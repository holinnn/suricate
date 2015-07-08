(function() {
    "use strict";
    window.Suricate = window.Suricate || {};

    var statuses = {
        ok: "ok",
        alert: "danger",
        warning: "warning"
    };

    Suricate.WidgetView = function(content) {
        this.content       = $(content);
        this.currentStatus = undefined;
    };

    /*
     * Public
     */

    Suricate.WidgetView.prototype.getBody = function() {
        return this.content.find(".body");
    };

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


    Suricate.WidgetView.prototype.setStatusOK = function() {
        this.setStatus(statuses.ok);
    };

    Suricate.WidgetView.prototype.setStatusAlert = function() {
        this.setStatus(statuses.alert);
    };

    Suricate.WidgetView.prototype.setStatusWarning = function() {
        this.setStatus(statuses.warning);
    };

    /*
     * Private
     */
    Suricate.WidgetView.prototype.getPlaceholder = function(name) {
        return this.content.find("[data-widget-binding='" + name + "']");
    };

    Suricate.WidgetView.prototype.setStatus = function(status) {
        if(this.currentStatus !== status) {
            var statuses = ["ok", "danger", "warning"];
            var statusIndex = statuses.indexOf(status);
            statuses.splice(statusIndex, 1);
            var classesToRemove = statuses.join(" ");
            this.content.removeClass(classesToRemove);
            this.content.addClass(status);
            this.currentStatus = status;
        }
    };
}());
