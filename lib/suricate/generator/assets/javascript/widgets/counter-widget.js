(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.CounterWidget = function(id, container, configuration, application) {
        Suricate.Widget.call(this, id, container, configuration, application);
    };

    Suricate.CounterWidget.prototype = new Suricate.Widget();

    Suricate.CounterWidget.prototype.setData = function(data) {
        var value = this.formatNumber(data.value);
        this.view.setPlaceholder('value', value);
    };

    Suricate.CounterWidget.prototype.formatNumber = function(number) {
        var precision = number % 1 === 0 ? 0 : 2;
        // From http://stackoverflow.com/a/14428340/610531
        return number.toFixed(precision).replace(/./g, function(c, i, a) {
            return i && c !== "." && ((a.length - i) % 3 === 0) ? ',' + c : c;
        });
    };
}());
