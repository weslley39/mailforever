angular.module 'mailforever'
  .controller 'SentController', ($scope, $timeout,  msgs, SentService, EMAIL_TYPES) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      messages        : msgs.data.messages
      selectedMessage : {}
      type            : EMAIL_TYPES.SENT

    ##################################
    ## Methods
    ##################################
    $scope.methods =
      selectMessage: (messageId) ->
        SentService.getById(messageId)
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