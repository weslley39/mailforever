angular.module 'mailforever'
  .controller 'InboxController', ($scope, $timeout,  msgs, totalUnread, InboxService, EMAIL_TYPES) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      messages        : msgs.data.messages
      totalUnread     : totalUnread.data.total
      selectedMessage : {}
      type            : EMAIL_TYPES.INBOX

    ##################################
    ## Methods
    ##################################
    $scope.methods =
      selectMessage: (messageId) ->
        InboxService.getById(messageId)
          .then (result) ->
            result = result.data
            $timeout ->
              $scope.attrs.selectedMessage = result.message

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################