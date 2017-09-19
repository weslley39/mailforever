angular.module 'mailforever'
  .controller 'SidebarController', ($scope) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      menus: [
        {
          name: 'Inbox',
          total: 5,
          route: 'inbox'
        }
      ]
    ##################################
    ## Methods
    ##################################

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################
    console.log $scope.attrs