import React, {Component}  from "react";
import TaskList from "./TaskList";
import Axios from 'axios';
import ProjPieChart from './ProjPieChart'

// url to fetch task lists
const DAEMONURL = 'http://localhost:8091/';

export default class UtaskDashboard extends Component {

    constructor(props) {
        super(props);

        this.state = {
            taskList : [],
            projCount: []
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
                this.setState( { projCount: res.data})


            })
    }

    render() {
        return (
            <div style={{display: 'flex', flexDirection: 'row', alignItems: 'center'}}>
                <div style={{display: 'flex', flexDirection: 'row', alignItems: 'center', width: '50%'}}>
                    <TaskList taskList={this.state.taskList}></TaskList>
                </div>
                <div style={{display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                    <ProjPieChart data={this.state.projCount.Data} labels={this.state.projCount.Labels}/>
                </div>
            </div>
        )
    }
}