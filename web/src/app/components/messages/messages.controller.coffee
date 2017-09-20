angular.module 'mailforever'
  .controller 'MessagesController', ($scope) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      messages: $scope.data

    ##################################
    ## Methods
    ##################################
    # $scope.methods =

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################
    console.log $scope.attrs