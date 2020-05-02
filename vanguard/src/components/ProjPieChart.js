import React from 'react';
import Chart from "chart.js";
import { Aspect6 } from 'chartjs-plugin-colorschemes/src/colorschemes/colorschemes.office';

let myLineChart

Chart.defaults.global.defaultFontFamily = "'PT Sans', sans-serif"

export default class ProjPieChart extends React.Component {

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

        return  (
            <div style={{width: '100vh', height: '100vh'}}>
                <canvas
                    id="myChart"
                    ref={this.chartRef}
                />
            </div>
        )
    }

}
