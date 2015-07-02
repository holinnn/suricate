(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.ChartJSChartFactory = function() {

    };

    Suricate.ChartJSChartFactory.createLineChart = function(element, data, options) {
        var chart = {
            chart: undefined,
            init: function(data, options) {
                var ctx    = this.element.getContext("2d");
                this.chart = new Chart(ctx).Line(data, options);
            },
            update: function(data) {
                this.chart.destroy();
                this.init(data, options);
            }
        };

        chart.init(data, options);
        return chart;
    };
}());
