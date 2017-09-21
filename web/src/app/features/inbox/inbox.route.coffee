angular.module 'mailforever'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'inbox',
        url: '/inbox'
        templateUrl: 'app/features/inbox/inbox.html'
        controller: 'InboxController'
        resolve:
          msgs: (InboxService) ->
            InboxService.getAll()
          totalUnread: (InboxService) ->
            InboxService.getTotalUnread()