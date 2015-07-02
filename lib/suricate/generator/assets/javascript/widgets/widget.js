(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.Widget = function(id, container, configuration, application) {
        this.id            = id;
        this.container     = container;
        this.application   = application;
        this.configuration = configuration;
    };

    /*
     * Public
     */

    Suricate.Widget.prototype.getID = function() {
        return this.id;
    };

    Suricate.Widget.prototype.getApplication = function() {
        return this.application;
    };

    Suricate.Widget.prototype.init = function() {
        this.updater = new Suricate.WidgetUpdater(this, this.configuration.interval);
        this.view    = new Suricate.WidgetView(this.configuration.template);
        this.view.setPlaceholders(this.configuration.placeholders);
        this.view.appendTo(this.container);
    };

    Suricate.Widget.prototype.update = function(now) {
        var self = this;
        this.updater.update(now, function(data) {
            self.view.setLastUpdateAt(now);
            self.setData(data);
        });
    };

    /*
     * Private
     */

    Suricate.Widget.prototype.setData = function(data) {
        console.error("function setData(data) is not defined in Suricate.Widget's subclass", this);
    };
}());
