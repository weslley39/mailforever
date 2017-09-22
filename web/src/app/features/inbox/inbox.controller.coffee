angular.module 'mailforever'
  .controller 'InboxController', ($scope, $timeout,  msgs, Service, SweetAlert, type) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      messages        : msgs.data.messages
      selectedMessage : undefined
      type            : type

    ##################################
    ## Private Methods
    ##################################
    refreshResults = () ->
      Service.getAll()
        .then (result) ->
          result = result.data
          $timeout ->
            $scope.attrs.messages = result.messages

    ##################################
    ## Methods
    ##################################
    $scope.methods =
      selectMessage: (messageId) ->
        Service.setAsRead(messageId)
          .then () ->
            return Service.getById(messageId)
          .then (result) ->
            result = result.data
            $timeout ->
              $scope.attrs.selectedMessage = result.message

      deleteMessage: (messageId) ->
        Service.delete(messageId)
          .then () ->
            SweetAlert.swal("Deleted!", "The message was deleted!", "success")
            refreshResults()
            if $scope.attrs.selectedMessage.uid is messageId
              $timeout ->
                $scope.attrs.selectedMessage = undefined

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################