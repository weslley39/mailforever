angular.module 'mailforever'
  .directive 'messageViewer', ->
    directive =
      restrict            : 'E'
      templateUrl         : 'app/components/message-viewer/message-viewer.html'
      controller          : 'MessageViewerController'
      scope               :
        message     : '='