(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.ChartJSChartFactory = function() {

    };

    Suricate.ChartJSChartFactory.prototype.createLineChart = function(container, options) {
        var chart = {};
        var libraryObject;

        var convertData = function(data) {
            var datasets = [];
            for (var index = 0, seriesCount = data.series.length; index < seriesCount; index++) {
                var serie = data.series[index];
                datasets.push({
                    label: serie.name,
                    strokeColor: serie.color,
                    fillColor: "rgba(0, 0, 0, 0)",
                    pointStrokeColor: serie.color,
                    pointColor: serie.color,
                    data: serie.values
                });
            }

            return {
                labels: data.labels,
                datasets: datasets
            };
        };

        var init = function(data, options) {
            var ctx       = container.find(".chart")[0].getContext("2d");
            libraryObject = new Chart(ctx).Line(data, options);
            var legend    = libraryObject.generateLegend();
            container.find(".legend").html(legend);
        };

        var data = {
            labels: [],
            datasets: [ { } ]
        };
        init(data, options);

        chart.update = function(data) {
            var chartJSData = convertData(data);
            libraryObject.destroy();
            init(chartJSData, options);
        };

        return chart;
    };
}());
