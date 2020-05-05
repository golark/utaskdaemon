import React from 'react';
import Chart from "chart.js";
import { borders } from '@material-ui/system';
import { Aspect6 } from 'chartjs-plugin-colorschemes/src/colorschemes/colorschemes.office';
import { makeStyles } from '@material-ui/core/styles';
import withStyles from "@material-ui/core/styles/withStyles";

const useStyles = makeStyles =>({
    pieChartClass: {
        border: 0,
//        borderRadius: 3,
//        boxShadow: '0 1px 2px 1px #00a0b7',
        color: 'white',
        width: '100vh',
        height: '600px',
        padding: '0 30px',
    },
});
let myLineChart

Chart.defaults.global.defaultFontFamily = "'PT Sans', sans-serif"

class ProjPieChart extends React.Component {

    constructor(props) {
        super(props);
    }

    chartRef = React.createRef();
    componentDidMount() {
        this.buildChart();
    }

    componentDidUpdate() {
        this.buildChart();
    }

    buildChart() {

        const ctx = this.chartRef.current.getContext("2d");

        console.log(this.props.data)

        if (typeof myLineChart !== "undefined") myLineChart.destroy();

        myLineChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: this.props.data,
                    backgroundColor: ["red", "blue", "ping", "cyan", "purple", "yellow"],
                }],

                // These labels appear in the legend and in the tooltips when hovering different arcs
                labels: this.props.labels,
            },
            options: {
                legend: {
                    display: true
                },
                title:{
                    display:true,
                    text:'Task Share Breakdown',
                    padding:0,
                    fontColor:'#949696',
                    fontSize:30,
                    fontStyle:' bold',
                },
            },
        });
    }

    render() {

        const { classes } = this.props;
        return  (
            <div className={classes.pieChartClass} >
                <canvas
                    id="myChart"
                    ref={this.chartRef}
                />
            </div>
        )
    }

}

export default withStyles(useStyles)(ProjPieChart)