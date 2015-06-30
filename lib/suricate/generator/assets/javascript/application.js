(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.Application = function(widgetsContainer, configuration) {
        this.widgetsContainer = new Suricate.WidgetsContainer(widgetsContainer);
        this.configuration    = configuration;
        this.initialized      = false;
        this.widgets          = [];
        this.updateInterval   = undefined;
    };



    // Starts the application
    Suricate.Application.prototype.start = function() {
        var self = this;
        this.init(function() {
            self.startUpdates();
        });
    };

    Suricate.Application.prototype.stop = function() {
        this.stopUpdates();
    };


    // Creates and return an object
    // to communicate with the API
    Suricate.Application.prototype.createAPI = function() {
        var baseURL = location.protocol + "//" + location.host + "/api";
        return new Suricate.API(baseURL);
    };

    Suricate.Application.prototype.getWidgetsContainer = function() {
        return this.widgetsContainer;
    };



    /*
     * Private
     */

    Suricate.Application.prototype.init = function(callback) {
        if(!this.initialized) {
            var self = this;
            this.initWidgets(function() {
                self.sinitialized = true;
                callback();
            });
        }
        else {
            callback();
        }
    };

    Suricate.Application.prototype.initWidgets = function(callback) {
        var api  = this.createAPI();
        var self = this;
        api.getWidgets(function(configurations) {
            var factory  = new Suricate.WidgetFactory(self, configurations);
            self.widgets = factory.buildWidgets();
            callback();
        });
    };

    Suricate.Application.prototype.startUpdates = function() {
        if(this.updateInterval === undefined) {
            var self = this;
            this.updateInterval = window.setInterval(function() {
                self.update();
            }, 1000);
        }
    };

    Suricate.Application.prototype.stopUpdates = function() {
        if(this.updateInterval !== undefined) {
            window.clearInterval(this.updateInterval);
            this.updateInterval = undefined;
        }
    };

    Suricate.Application.prototype.update = function() {
        var now = new Date();
        for (var widgetIndex = 0, l = this.widgets.length; widgetIndex < l; widgetIndex ++) {
            var widget = this.widgets[widgetIndex];
            widget.update(now);
        }
    };
}());
