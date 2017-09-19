angular.module 'mailforever'
  .directive 'messages', ->

    directive =
      restrict            : 'E'
      templateUrl         : 'app/components/messages/messages.html'
      # scope               :
        # creationDate : '='
      controller          : 'MessagesController'
      bindToController    : true