(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.WidgetFactory = function(application, configurations) {
        this.application      = application;
        this.configurations   = configurations;
    };

    Suricate.WidgetFactory.prototype.buildWidgets = function() {
        var widgets = [];
        for (var configurationIndex = 0, l = this.configurations.length; configurationIndex < l; configurationIndex ++) {
            var configuration   = this.configurations[configurationIndex];
            var isWidgetPresent = this.application.getWidgetsContainer().isWidgetPresent(configuration.id);
            if(isWidgetPresent) {
                var widget = this.buildWidget(configuration);
                widgets.push(widget);
            }
        }
        return widgets;
    };


    /*
     * Private
     */

    Suricate.WidgetFactory.prototype.buildWidget = function(infos) {
        var Prototype = Suricate[infos.type];

        if (Prototype === undefined) {
            throw new Error("Can't find Suricate." + infos.type + " prototype. Define it first");
        }
        else {
            var id            = infos.id;
            var configuration = infos.configuration;
            var container     = this.application.getWidgetsContainer().getWidgetContainer(id);
            var widget        = new Prototype(id, container, configuration, this.application);
            widget.init();
            return widget;
        }
    };
}());
