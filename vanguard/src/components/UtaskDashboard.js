import React, {Component}  from "react";
import TaskList from "./TaskList";
import Axios from 'axios';

// url to fetch task lists
const DAEMONURL = 'http://localhost:8091/gettasks';

export default class UtaskDashboard extends Component {

    constructor(props) {
        super(props);

        this.state = {
            taskList : []
        }
    }



    // fetch task list from REST Endpoint
    fetchUTaskList() {
        Axios.get(DAEMONURL)
            .then(res => {
                console.log(res.data)

                this.setState( { taskList: res.data})
            })
    }


    render() {
        return (
            <div>
                <TaskList taskList={this.state.taskList}></TaskList>
            </div>
        )
    }
}