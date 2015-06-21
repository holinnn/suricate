/*
 * Public
 */

Suricate.API = function(baseURL) {
  this.baseURL = baseURL;
};

// Get widget configurations
Suricate.API.prototype.getWidgets = function(callback) {
  this.sendRequest('GET', '/widgets', {}, function(data) {
    callback(data.widgets);
  });
};

// Get updated data for widget
Suricate.API.prototype.getWidgetData = function(widgetID, callback) {

};


/*
 * Private
 */

// Send request to API
Suricate.API.prototype.sendRequest = function(method, path, params, callback) {
  var self = this;
  var url = this.baseURL + path;
  $.ajax({
    url: url,
    method: method,
    data: params,
    success: function(data) {
      self.handleResponse(url, data, callback);
    }
  });
}

Suricate.API.prototype.handleResponse = function(url, json, callback) {
  if(json.status == 200) {
    callback(json.data);
  }
  else {
    console.error("Failed to load request", "url", url, "response", data);
  }
}
