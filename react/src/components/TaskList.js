import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItemText from '@material-ui/core/ListItemText';
import ListItem from '@material-ui/core/ListItem';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';
import AccessTime from '@material-ui/icons/AccessTime';

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

    // createListItem generate single item given primary and secondary text
    createListItem(key, prim, secon) {

        return (
            <ListItem key={key}>
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
        const taskListView  = []
        for (let i = 0; i < this.props.taskList.length; i++) {
            const task = this.props.taskList[i]
            taskListView.push(this.createListItem(i, task.T.TaskName + " / " + task.T.ProjectName, task.SDate + "  " + task.STime))
        }

        return (
            <List className={classes.root}>
                {taskListView}
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
