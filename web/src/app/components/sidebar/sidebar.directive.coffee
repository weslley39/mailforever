angular.module 'mailforever'
  .directive 'radarNavbar', ->

    directive =
      restrict            : 'E'
      templateUrl         : 'app/components/sidebar/sidebar.html'
      # scope               :
        # creationDate : '='
      controller          : 'SidebarController'
      bindToController    : true