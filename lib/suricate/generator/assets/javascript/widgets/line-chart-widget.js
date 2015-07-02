(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.LineChartWidget = function(id, container, configuration, application) {
        Suricate.Widget.call(this, id, container, configuration, application);
        this.chart = undefined;
    };

    Suricate.LineChartWidget.prototype = new Suricate.Widget();

    Suricate.LineChartWidget.prototype.init = function() {

    };

    /*
     * Private
     */

    Suricate.LineChartWidget.prototype.setData = function(data) {
        var chartFactory = this.application.getChartFactory();

    };
}());
