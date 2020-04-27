import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItemText from '@material-ui/core/ListItemText';
import ListItem from '@material-ui/core/ListItem';
import TypoGraphy from '@material-ui/core/Typography'
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';
import AccessTime from '@material-ui/icons/AccessTime';
import PropTypes from 'prop-types';
import Axios from 'axios';

const useStyles = makeStyles((theme) => ({
    root: {
        width: '100%',
        maxWidth: 360,
        backgroundColor: '#6772e5',
        border: 10,
        borderRadius: 3,
        boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
        height: 50,
    },
}));

class TaskList extends React.Component {

    constructor() {
        super();

        this.state = {

            tasks : [],
            persons: []
        }
    }

    componentDidMount() {

        Axios.get('http://localhost:8091/gettasks')
            .then(res => {
                console.log(res.data)

                this.setState( { tasks: res.data})
            })


        console.log("tasks" + this.state.tasks.Name)

    }

    // createListItem generate single item given primary and secondary text
    createListItem(prim, secon) {

        return (
            <ListItem>
                <ListItemAvatar>
                    <Avatar>
                        <AccessTime />
                    </Avatar>
                </ListItemAvatar>
                <ListItemText primary={prim} secondary={secon} />
            </ListItem>
        )
    }

    // createListView a full list view with multiple parsed list elements
    createListView() {
        const classes = this.props;

        // create task list
        // @TODO: consider a map based implementation
        const taskList  = []
        for (let i = 0; i < this.state.tasks.length; i++) {
            const task = this.state.tasks[i]
            taskList.push(this.createListItem(task.T.TaskName + " / " + task.T.ProjectName, task.SDate + "  " + task.STime))
        }

        return (
            <List className={classes.root}>
                {taskList}
            </List>
        );
    }

    render() {
        return (
            <div>
                {this.createListView()}
            </div>
        );
    }
}


export default TaskList;
