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
        this.setPlaceholder("last-update-at", time.toLocaleTimeString());
    };

    Suricate.WidgetView.prototype.setName = function(name) {
        this.setPlaceholder("name", name);
    };

    Suricate.WidgetView.prototype.setPlaceholders = function(placeholders) {
        for(var name in placeholders) {
            var value = placeholders[name];
            this.setPlaceholder(name, value);
        }
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
