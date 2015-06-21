=begin
* l'application fonctionne avec des collector (récupération de données), des formattor (mise en forme des données) et des widgets

* un collector récupère les données depuis une source, il doit pouvoir fonctionner comme un plugin pour avoir des contributions

* les templates définissent des zones où viennent se mettrent les plugins
* le JS de l'app initialise une app et va chercher les données pour chaque widgets
* dans le template HTML on definit des data-widget-id à l'initialisation on récupère tous les widget-id et on va chercher les données en JSON

* JS
	* application.js
	* init.js

* type de widgets :
	* graph (Point(x, y))
	* compteur (valeur, label)
	* list (label, url)

* pour chaque type de widget un formattor existe

* collecteur :
	* sentry
		* compteur global
		* list
	* sql
		* graph
	* jenkins
		* compteur
		* list

* un compteur peut être le nombre de données


* un collecteur définit une interface :
	* #data

* MonitoredData :
	* name
	* url


Widget :
	* id
	* name
	* collector
	* le widget sait quel formatter utiliser
	* formatter instancié avec le collector
	* appel de

API up ?
	* collecteur renvoie en data un événement avec date, nom, data

Un widget est un controlleur

L'application renvoie des templates

Quand on initialise l'app on lui file un répository de widget qui peut faire des find_by_id() pour récupérer un widget&


On instancie un controlleur avec un widget et un context
on execute le controlleur avec un callback de rendu, redirection, etc.
le controlleur récupère les données du widget

Dans la page html on a des placeholder pour les widgets
Si on veut afficher des textes le widget récupère un json formatté et il adapte l'html de la page

=end

config = Suricate.build do |config|
	config.widgets do |widgets|
		widgets.counter :errors_count, SentryErrorsCollector.new(ENV['API_KEY'])
	end
end

class Configuration
	attr_accessor :widgets_repository
end

class WidgetsRepository
	class << self
		def all
		end
	end
end

run Suricate::Application.new(config)


class Widget
	def initialize(context, collector)
    @context   = context
		@collector = collector
	end

  def execute
    data = @collector.get(params)
    render data, status: 200
  end
end

class Application
  get('/widgets/:id') do
    return 'json'
  end

  get('/pages/:id') do
    return 'html'
  end
end
