(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.WidgetView = function(content) {
        this.content = $(content);
    };

    /*
     * Public
     */

    Suricate.WidgetView.prototype.appendTo = function(container) {
        container.append(this.content);
    };

    Suricate.WidgetView.prototype.setLastUpdateAt = function(time) {
        this.setPlaceholder("last-update-at", time);
    };

    Suricate.WidgetView.prototype.setPlaceholder = function(name, value) {
        this.getPlaceholder(name).html(value);
    };

    /*
     * Private
     */
    Suricate.WidgetView.prototype.getPlaceholder = function(name) {
        return this.content.find("[data-widget-binding='" + name + "']");
    };
}());
