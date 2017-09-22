angular.module 'mailforever'
  .controller 'MessagesController', ($scope, SweetAlert) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      selected: undefined
      type    : $scope.type

    ##################################
    ## Methods
    ##################################
    $scope.methods =
      select: (message) ->
        $scope.attrs.selected = message
        $scope.selectCb(message)
        message.read = true

      isSelected: (messageId) ->
        return $scope.attrs.selected?.uid is messageId

      delete: (event, message) ->
        event.stopPropagation()
        SweetAlert.swal(
          {
            title              : "Are you sure?",
            text               : "Your will not be able to recover this email!",
            type               : "warning",
            showCancelButton   : true,
            cancelButtonColor  : "#68767C",
            confirmButtonColor : "#C8333A",
            confirmButtonText  : "Yes, delete it!",
            closeOnConfirm     : false
          }, () ->
            return $scope.deleteCb(message)
        )

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################