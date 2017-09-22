angular.module 'mailforever'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'sent',
        url: '/sent'
        templateUrl: 'app/features/inbox/inbox.html'
        controller: 'InboxController'
        resolve:
          msgs: (SentService) ->
            SentService.getAll()
          Service: (SentService) ->
            return SentService
          type: (EMAIL_TYPES) ->
            EMAIL_TYPES.SENT