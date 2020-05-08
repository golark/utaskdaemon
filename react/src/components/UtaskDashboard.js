import React, {Component}  from "react";
import TaskList from "./TaskList";
import Axios from 'axios';
import ProjPieChart from './ProjPieChart'
import BuildChart from './BuildChart'

// url to fetch task lists
const DAEMONURL = 'http://localhost:8091/';

export default class UtaskDashboard extends Component {

    constructor(props) {
        super(props);

        this.state = {
            taskList : [],
            dailyUtaskCount : [],
            projCount: []
        }
    }

    componentDidMount() {
        this.fetchUTaskList()
        this.getUtaskProjectCount()
        this.getDailyUtaskCount()
    }

    // fetch task list from REST Endpoint
    fetchUTaskList() {
        Axios.get(DAEMONURL + 'gettasks')
            .then(res => {
                this.setState( { taskList: res.data})
            })
    }

    getDailyUtaskCount() {
        Axios.get(DAEMONURL + 'getdailyutaskcount')
            .then(res => {
                console.log(res.data)
                this.setState( {
                    dailyUtaskCount:
                        {
                        labels: res.data.Labels,
                        datasets: [{
                            data: res.data.Data,
                        }]
                    }})
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
            <div style={{display: 'flex', flexDirection: 'row' }}>
                <div style={{display: 'flex', flexDirection: 'row', alignItems: 'center', width: '50%'}}>
                    <TaskList taskList={this.state.taskList}></TaskList>
                </div>
                <div style={{display: 'flex', flexDirection: 'column', alignItems: 'top', padding: '5em'}}>
                    <BuildChart  type={'line'}  data={this.state.dailyUtaskCount} options={{title:{ display:true, text:"Daily UTask Count"}}}></BuildChart>
                    <ProjPieChart data={this.state.projCount.Data} labels={this.state.projCount.Labels}/>
                </div>
            </div>
        )
    }
}