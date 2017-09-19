angular.module 'mailforever'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'inbox',
        url: '/inbox'
        templateUrl: 'app/features/inbox/inbox.html'
        controller: 'InboxController'
        controllerAs: 'ctrl'