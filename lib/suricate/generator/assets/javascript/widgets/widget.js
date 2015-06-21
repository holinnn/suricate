Suricate.Widget = function(id, container, configuration, application) {
    this.id            = id;
    this.container     = container;
    this.application   = application;
    this.configuration = configuration;
};

Suricate.Widget.prototype.init = function() {
    this.container.append(this.configuration.template);
    this.updater = new Suricate.WidgetUpdater(this, configuration.interval);
};

Suricate.Widget.prototype.update = function(now) {
    console.warn("update() function not defined in Suricate.Widget's subclass", this);
};
