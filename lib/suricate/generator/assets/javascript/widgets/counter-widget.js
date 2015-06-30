(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.CounterWidget = function(id, container, configuration, application) {
        Suricate.Widget.call(this, id, container, configuration, application);
    };

    Suricate.CounterWidget.prototype = new Suricate.Widget();
}());
