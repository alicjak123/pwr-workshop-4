DigApp = angular.module 'DigApp', ['ui.router']

DigApp.config ($locationProvider) ->
  $locationProvider.html5Mode true

DigApp.config ($provide, $httpProvider, Rails) ->
  $provide.factory 'railsAssetsInterceptor', ->
    request: (config)->
      if assetUrl = Rails.templates[config.url]
        config.url = assetUrl
      config

  $httpProvider.interceptors.push 'railsAssetsInterceptor'

