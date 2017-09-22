angular.module 'mailforever'
  .directive 'sidebar', ->
    directive =
      restrict            : 'E'
      templateUrl         : 'app/components/sidebar/sidebar.html'
      controller          : 'SidebarController'