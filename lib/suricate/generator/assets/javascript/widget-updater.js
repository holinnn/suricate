(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.WidgetUpdater = function(widget, interval) {
        this.widget        = widget;
        this.interval      = interval || 1000;
        this.nextUpdateAt  = undefined;
        this.updating      = false;
    };

    /*
     * Public
     */

    Suricate.WidgetUpdater.prototype.update = function(now, callback) {
        if(this.isUpdatedNeeded(now)) {
            var self      = this;
            this.updating = true;
            this.fetchData(function(data) {
                self.nextUpdateAt = new Date(now.getTime() + self.interval);
                self.updating     = false;
                callback(data);
            });
        }
    };

    /*
     * Private
     */

    Suricate.WidgetUpdater.prototype.areDataOutdated = function(now) {
        var needsUpdate = true;
        if(this.nextUpdateAt) {
            needsUpdate = (this.nextUpdateAt < now);
        }
        return needsUpdate;
    };

    Suricate.WidgetUpdater.prototype.isUpdatedNeeded = function(now) {
        return !this.updating && this.areDataOutdated(now);
    };

    Suricate.WidgetUpdater.prototype.fetchData = function(callback) {
        var api = this.widget.getApplication().createAPI();
        api.getWidgetData(this.widget.getID(), callback);
    };
}());
