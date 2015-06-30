(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.WidgetsContainer = function(container) {
        this.container = container;
    };

    /*
     * Public
     */

    // Is widget present on the page ?
    Suricate.WidgetsContainer.prototype.isWidgetPresent = function(id) {
        return this.getWidgetContainer(id).length > 0;
    };

    // Get the DOM element associated to widget with id
    Suricate.WidgetsContainer.prototype.getWidgetContainer = function(id) {
        return this.container.find("[data-widget-id='" + id + "']");
    };
}());
