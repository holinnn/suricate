[![Build Status](https://travis-ci.org/holinnn/suricate.svg?branch=master)](https://travis-ci.org/holinnn/suricate)
[![Code Climate](https://codeclimate.com/github/holinnn/suricate/badges/gpa.svg)](https://codeclimate.com/github/holinnn/suricate)
[![Test Coverage](https://codeclimate.com/github/holinnn/suricate/badges/coverage.svg)](https://codeclimate.com/github/holinnn/suricate/coverage)

# Suricate (work in progress)

**This README file is the goal, it does not reflect the current state of Suricate.**

Suricate aims to be an application template for building dashboards.  

## How it works

### Architecture

A suricate application is composed of **pages**.  
A page is composed of **widgets**.  
A widget exists both in frontend (Javascript) and backend (Ruby) :
* on the backend a widget act as a controller to send back some data to display
* on the frontend it controls and keeps updated a portion of the page  

A widget is associated to a **collector**. Collectors provides data to widgets.  
This way, depending on the interface implemented by a collector you can use the same collector with multiple widgets.

### Installation

As any other gem you can install it with :

```
gem install suricate
```

### New application

To generate a new Suricate application, run :

```
suricate new my_application
```

Where "my_application" is the folder that will contain the application template.

### Configuration

Configuration is done with `Suricate::build` method, which helps generating the configuration.

```ruby
Suricate.build do |config|
  # Global configuration
  config.default_page        = 'index'  # defines the default page displayed when hiting '/'
  config.public_directory    = 'public' # defines the location of the directory accessible from the web
  config.templates_directory = 'templates' # defines the location the directory containing the templates
  
  # Widgets configuration
  config.widgets do |widgets|
    widgets.counter :id, ErrorsCollector.new  # defines a new widget of type counter, and data will be collected by the ErrorsCollector instance
  end
end
```

When adding a new widget you can pass a Hash of options :
* `template` will sets your widget's view template, if no template option is provided, Suricate will look in the /widgets directory within the `templates_directory`, for a file called as the widget's `id` or its `type`

Any other options passed will be directly passed to the frontend widgets.

### Running the application

Like any other Rack application, running `rackup config.ru` will start your application.

## Sample application

A sample application is available in the [example folder](https://github.com/holinnn/suricate/tree/master/example)


## Building your own widget

There are two steps to follow :
* build the backend widget
* build the frontend widget

### Backend

### Frontend

## Licence

Suricate is released under the MIT License (MIT)
