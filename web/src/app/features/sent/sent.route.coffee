angular.module 'mailforever'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'sent',
        url: '/sent'
        templateUrl: 'app/features/sent/sent.html'
        controller: 'SentController'
        resolve:
          msgs: (SentService) ->
            SentService.getAll()