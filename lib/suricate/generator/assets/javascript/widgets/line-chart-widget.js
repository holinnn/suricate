(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.LineChartWidget = function(id, container, configuration, application) {
        Suricate.Widget.call(this, id, container, configuration, application);
        this.chart = undefined;
    };

    Suricate.LineChartWidget.prototype = new Suricate.Widget();

    Suricate.LineChartWidget.prototype.init = function() {
        Suricate.Widget.prototype.init.call(this);
        var chartFactory = this.application.getChartFactory();
        var container    = this.view.getBody();
        this.chart       = chartFactory.createLineChart(container, {});
    };

    /*
     * Private
     */

    Suricate.LineChartWidget.prototype.setData = function(data) {
        this.chart.update(data.chart);
    };
}());
