<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>
.statsContainer {
	width: 50vw;
	margin: 0 auto;
	border: 1px solid red;
	height: 100%;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		Highcharts.chart('weeklyContainer', {

			  title: {
			    text: 'Solar Employment Growth by Sector, 2010-2016'
			  },

			  subtitle: {
			    text: 'Source: thesolarfoundation.com'
			  },

			  yAxis: {
			    title: {
			      text: 'Number of Employees'
			    }
			  },

			 xAxis: {
			        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			    },

			  legend: {
			    layout: 'vertical',
			    align: 'right',
			    verticalAlign: 'middle'
			  },


			  series: [{
			    name: 'Installation',
			    data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175,52503, 57177, 52503, 30123]
			  }, {
			    name: 'Manufacturing',
			    data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434, 17722, 16005, 21032, 19233]
			  }, {
			    name: 'Sales & Distribution',
			    data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 17722, 16005, 39387, 20231, 30404]
			  }, {
			    name: 'Project Development',
			    data: [10230, 20133,7988, 12169, 15112, 22452, 34400, 34227, 11816, 18274, 18111, 20223]
			  }, {
			    name: 'Other',
			    data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111, 11816, 18274, 18111, 49303]
			  }],

			  responsive: {
			    rules: [{
			      condition: {
			        maxWidth: 500
			      },
			      chartOptions: {
			        legend: {
			          layout: 'horizontal',
			          align: 'center',
			          verticalAlign: 'bottom'
			        }
			      }
			    }]
			  }

			});
		
		Highcharts.chart('container', {
			  chart: {
			    type: 'column'
			  },
			  title: {
			    text: 'Monthly Average Rainfall'
			  },
			  subtitle: {
			    text: 'Source: WorldClimate.com'
			  },
			  xAxis: {
			    categories: [
			      'Jan',
			      'Feb',
			      'Mar',
			      'Apr',
			      'May',
			      'Jun',
			      'Jul',
			      'Aug',
			      'Sep',
			      'Oct',
			      'Nov',
			      'Dec'
			    ],
			    crosshair: true
			  },
			  yAxis: {
			    min: 0,
			    title: {
			      text: 'Rainfall (mm)'
			    }
			  },
			  tooltip: {
			    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			      '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			    footerFormat: '</table>',
			    shared: true,
			    useHTML: true
			  },
			  plotOptions: {
			    column: {
			      pointPadding: 0.2,
			      borderWidth: 0
			    }
			  },
			  series: [{
			    name: 'Tokyo',
			    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

			  }, {
			    name: 'New York',
			    data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

			  }, {
			    name: 'London',
			    data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

			  }, {
			    name: 'Berlin',
			    data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

			  }]
			});
	});
</script>


<div class="statsContainer" align="left">
	<h3>방문자 추이</h3>
	<section class="weeklyStats">
		<h4>주별</h4>
		<figure class="highcharts-figure">
		  <div id="weeklyContainer"></div>
		  <p class="highcharts-description">
		    Basic line chart showing trends in a dataset. This chart includes the
		    <code>series-label</code> module, which adds a label to each line for
		    enhanced readability.
		  </p>
	 	</figure>
	</section>
	<section class="monthlyStats">
		<h4>월별</h4>
		<figure class="highcharts-figure">
		  <div id="container"></div>
		  <p class="highcharts-description">
		    A basic column chart compares rainfall values between four cities.
		    Tokyo has the overall highest amount of rainfall, followed by New York.
		    The chart is making use of the axis crosshair feature, to highlight
		    months as they are hovered over.
		  </p>
		</figure>
	</section>
</div>