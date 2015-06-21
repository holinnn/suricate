Suricate.WidgetsContainer = function(container) {
    this.container = container;
};

// Is widget present on the page ?
Suricate.WidgetsContainer.prototype.isWidgetPresent = function(id) {
    return this.getWidgetContainer(id) !== undefined;
};

Suricate.WidgetsContainer.prototype.getWidgetContainer = function(id) {
    return this.container.find("#" + id)[0];
};

