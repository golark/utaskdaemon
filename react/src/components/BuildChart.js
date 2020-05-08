import React, { Component } from 'react'
import Chart from "chart.js";
import classes from "./LineGraph.module.css";

// Default options
Chart.defaults.global.legend.display = false;
Chart.defaults.global.title.display  = true;

export default class BuildChart extends Component {

    chartRef = React.createRef();

    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.props.onClick()
    }

    componentDidMount() {

        this.build();
    }

    componentDidUpdate() {

        this.build();
    }

    build() {

        // step 1 - get context
        const myChartRef = this.chartRef.current.getContext("2d");

        // step 2 - create a new Chart
        let newChart
        if (typeof newChart !== "undefined")  {
            newChart.destroy();
            console.log("destroying chart")
        }
        newChart = new Chart(myChartRef, {
            type:    this.props.type,
            data:    this.props.data,
            options: this.props.options,
        });

    }

    render() {
        return (
            <div >
                <canvas  id="newChart" ref={this.chartRef} width="1000" height="600" onClick={this.handleClick}>
                </canvas>
            </div>
        )
    }

}

// defaultProps
// Provide sample chart if data is not provided
BuildChart.defaultProps = {
    type: "pie",
    data: {
        //Bring in data
        labels: [1, 2, 3, 4, 5],
        datasets: [
            {
                label: "",
                data: [1, 2, 3, 4, 5],
                fill: true,
                showLine: false,
                borderColor: "#00a0c7",
                backgroundColor: '#00a0b7',
                pointBackgroundColor: '#00a0b7',
                pointBorderColor: '#fff',
            }
        ]
    },
}

// Example Chart Options
/*
    options: {
        layout: {
            padding: {
                top:5,left:10,bottom:5,right:10,
            },
        },
       title:{
            display:true,
            text:'Chart Title ',
            padding:30,
            fontColor:'#949696',
            fontSize:32,
            fontStyle:' bold',
        },
        scales: {
            x: {
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Month'
                },
                gridLines: {lineWidth: 3, borderDash: [1, 3],},
            },
            y: {
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Value'
                },
                gridLines:{lineWidth:3,borderDash:[1,3],},
            }
        },
        legend:{
            display: true,
            labels:{
                generateLabels: function(chart){
                    return  chart.data.datasets.map( function( dataset, i ){
                        return{
                            text:dataset.label,
                            lineCap:dataset.borderCapStyle,
                            lineDashOffset: 0,
                            lineJoin:dataset.borderJoinStyle,
                            fillStyle:dataset.backgroundColor,
                            strokeStyle:dataset.borderColor,
                            lineWidth:dataset.pointBorderWidth,
                        }
                    })
                },

            },
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
    },
}
*/
