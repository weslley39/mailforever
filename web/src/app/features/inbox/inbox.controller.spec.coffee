'use strict'

describe 'controllers: SearchController', () ->
  $scope = controllerInjections = msgsMock = null

  beforeEach module('mailforever')

  beforeEach inject(($rootScope, InboxService, EMAIL_TYPES) ->
    $scope = $rootScope.$new()

    msgsMock = {
      data: {
        messages: [
          {
            id: 1,
            name: 'foo'
          }
        ]
      }
    }

    controllerInjections =
      $scope   : $scope
      msgs     : msgsMock
      Service  : InboxService
      type     : EMAIL_TYPES.INBOX
  )

  fit 'Should have the properties initiate', inject ($controller, $state, EMAIL_TYPES) ->

    # Setup
    $controller 'InboxController', controllerInjections

    # Expectations
    expect($scope.attrs.messages).toEqual(msgsMock.data.messages)
    expect($scope.attrs.type).toEqual(EMAIL_TYPES.INBOX)
