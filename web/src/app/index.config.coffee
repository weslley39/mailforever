angular.module 'radarLua'
  .config ($logProvider, $urlRouterProvider, toastrConfig) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    $urlRouterProvider.otherwise '/'


