angular.module 'mailforever'
  .config ($logProvider, $urlRouterProvider, toastrConfig) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    $urlRouterProvider.otherwise '/inbox'


