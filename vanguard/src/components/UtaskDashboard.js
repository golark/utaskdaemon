import React, {Component}  from "react";
import TaskList from "./TaskList";
import Axios from 'axios';

// url to fetch task lists
const DAEMONURL = 'http://localhost:8091/';

export default class UtaskDashboard extends Component {

    constructor(props) {
        super(props);

        this.state = {
            taskList : []
        }
    }

    componentDidMount() {
        this.fetchUTaskList()
        this.getUtaskProjectCount()
    }

    // fetch task list from REST Endpoint
    fetchUTaskList() {
        Axios.get(DAEMONURL + 'gettaskssorted')
            .then(res => {

                this.setState( { taskList: res.data})
            })
    }

    getUtaskProjectCount() {
        Axios.get(DAEMONURL + 'getprojectcounts')
            .then(res => {

                // this.setState( { taskList: res.data})
                console.log(res.data)
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