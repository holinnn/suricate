(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.StatusWidget = function(id, container, configuration, application) {
        Suricate.Widget.call(this, id, container, configuration, application);
    };

    Suricate.StatusWidget.prototype = new Suricate.Widget();

    Suricate.StatusWidget.prototype.setData = function(data) {
    };
}());

