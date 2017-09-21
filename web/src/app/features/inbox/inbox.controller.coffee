angular.module 'mailforever'
  .controller 'InboxController', ($scope, $timeout,  msgs, InboxService) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      messages        : msgs.data.messages
      selectedMessage : {}

    ##################################
    ## Methods
    ##################################
    $scope.methods =
      selectMessage: (messageId) ->
        InboxService.getById(messageId)
          .then (result) ->
            result = result.data
            $scope.attrs.selectedMessage = result.message
            console.log $scope.attrs

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################