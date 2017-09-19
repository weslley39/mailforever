angular.module 'mailforever'
  .controller 'SidebarController', ($scope, $state) ->
    'ngInject'

    ##################################
    ## Attributes
    ##################################
    $scope.attrs =
      menus: [
        {
          name: 'Inbox',
          total: 5,
          route: 'inbox',
          icon: 'fa fa-inbox'
        }
      ]
    ##################################
    ## Methods
    ##################################
    $scope.methods =
      isActive: (route) ->
        $state.current.name is route

    ##################################
    ## Watchers
    ##################################

    ##################################
    ## Init
    ##################################