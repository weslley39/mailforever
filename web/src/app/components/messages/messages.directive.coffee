angular.module 'mailforever'
  .directive 'messages', ->
    directive =
      restrict            : 'E'
      templateUrl         : 'app/components/messages/messages.html'
      controller          : 'MessagesController'
      scope               :
        data     : '='
        selectCb : '&'