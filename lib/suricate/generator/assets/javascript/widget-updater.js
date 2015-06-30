(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    Suricate.WidgetUpdater = function(widget, interval) {
        this.widget        = widget;
        this.interval      = interval || 30;
        this.nextUpdateAt  = undefined;
        this.updating      = false;
    };

    /*
     * Public
     */

    Suricate.WidgetUpdater.prototype.update = function(now, callback) {
        if(this.isUpdatedNeeded()) {
            this.updating = true;
            this.fetchData(function(data) {
                this.nextUpdateAt = new Date(now.getTime() + interval * 1000);
                this.updating     = false;
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
            needsUpdate = (nextUpdateAt < now);
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
