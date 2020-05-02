package db

import (
	"context"
	"errors"
	"github.com/golark/utaskdaemon/dbcontainer"
	log "github.com/sirupsen/logrus"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

// MongoConn
// db connection
type MongoConn struct {
	uri            string
	database       string
	collectionName string

	collection *mongo.Collection
	client     *mongo.Client
}

const (
	ContainerName = "utaskmongo"
)

// NewMongoConn
// if container is not running, restart it or create a new one
// start connection with the container
func NewMongoConn(URI string, database string, colName string) (*MongoConn, error) {

	// first check if the container exists
	if !dbcontainer.IsContainerRunning(ContainerName) {
		dbcontainer.CreateMongodbContainer(ContainerName)
	}

	db := &MongoConn{uri: URI, database: database, collectionName: colName}

	return db, db.connect()
}

// Disconnect from db connection
func (db *MongoConn) Disconnect() error {

	// first check if we have a valid client
	if db.client == nil {
		log.Error("can not disconnect from nil client")
		errors.New("nil client, can not disconnect")
	}

	if err := db.client.Disconnect(context.TODO()); err != nil {
		log.WithFields(log.Fields{"err": err}).Error("error while disconnecting from db")
		return err
	}

	log.WithFields(log.Fields{"db": db}).Trace("disconnected from db")

	return nil
}

// Connect connect to mongo db
// ping for sanity, and create a database and a collection
func (db *MongoConn) connect() error {

	// step 1 - check URI
	if db.uri == "" {
		log.Error("URI can not be empty")
		return errors.New("URI can not be empty")
	}
	log.WithFields(log.Fields{"uri": db.uri}).Info("URI")

	// step 2 - connect to mongodb
	log.WithFields(log.Fields{"uri": db.uri}).Info("attempting connection to db")
	clientOpts := options.Client().ApplyURI(db.uri)
	client, err := mongo.Connect(context.TODO(), clientOpts)
	if err != nil {
		log.WithFields(log.Fields{"err": err, "URI": db.uri}).Error("error while trying to connect to db")
	}
	log.Info("connected to mongodb")
	db.client = client

	// step 3 - try to ping
	err = db.client.Ping(context.TODO(), nil)
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("cant ping db")
	}
	log.Trace("successfully pinged mongodb")

	// step 4 - create a database
	if db.database == "" {
		log.Error("database name can not be empty string")
		return errors.New("database name can not be empty string")
	}
	if db.collectionName == "" {
		log.Error("collection name can not be empty")
		return errors.New("collection name can not be empty")
	}

	db.collection = db.client.Database(db.database).Collection(db.collectionName)
	log.WithFields(log.Fields{"Database": db.database, "CollectionName": db.collectionName}).Info("created database & collection")

	return nil
}

func (db *MongoConn) InsertNewDocument(intf interface{}) error {

	if db.collection == nil {
		log.Error("collection is nil")
		return errors.New("nil collection")
	}

	res, err := db.collection.InsertOne(context.TODO(), intf)
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("error occured while trying to insert to collection")
	}

	log.WithFields(log.Fields{"result": res, "db": db}).Trace("inserted single document to collection")

	return nil
}

func (db *MongoConn) DeleteAll() error {

	if db.collection == nil {
		log.Error("collection is nil")
		return nil
	}

	log.Info("deleting all documents")
	res, err := db.collection.DeleteMany(context.TODO(), bson.M{})
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("can not delete documents")
		return err
	}
	log.WithFields(log.Fields{"res":res}).Info("delete result")

	return nil
}

func (db* MongoConn) GetAllDocuments() ([]map[string]interface{}, error) {

	if db.collection == nil {
		log.Error("collection is nil")
		return nil, errors.New("nil collection")
	}

	// query all
	cursor, err := db.collection.Find(context.TODO(), bson.M{})
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("errored while querying collection")
		return nil, errors.New("errored while querying collection")
	}
	defer cursor.Close(context.TODO())

	// decode
	var extractedData []map[string]interface{}
	for cursor.Next(context.TODO()) {
		var data map[string]interface{}
		if err = cursor.Decode(&data); err != nil {
			log.Error("errored while reading the cursor")
		} else {
			log.WithFields(log.Fields{"data":data}).Trace("get document")
			extractedData= append(extractedData, data)
		}
	}

	return extractedData, nil
}

