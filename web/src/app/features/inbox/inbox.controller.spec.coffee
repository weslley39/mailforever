'use strict'

describe 'controllers: InboxController', () ->
  $scope = controllerInjections = msgsMock = null

  beforeEach module('mailforever')

  beforeEach inject(($rootScope, InboxService, EMAIL_TYPES) ->
    $scope = $rootScope.$new()

    msgsMock = {
      data: {
        messages: [
          {
            id: 1,
            name: 'Foo'
          },
          {
            id: 2,
            name: 'Bar'
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

  it 'Should have the properties initiate for inbox', inject ($controller, $state, EMAIL_TYPES) ->

    # Setup
    $controller 'InboxController', controllerInjections

    # Expectations
    expect($scope.attrs.messages).toEqual(msgsMock.data.messages)
    expect($scope.attrs.type).toEqual(EMAIL_TYPES.INBOX)

  it 'Should have the properties initiate for sent', inject ($controller, $state, SentService, EMAIL_TYPES) ->

    # Setup
    controllerInjections.Service = SentService
    controllerInjections.type = EMAIL_TYPES.SENT
    $controller 'InboxController', controllerInjections

    # Expectations
    expect($scope.attrs.messages).toEqual(msgsMock.data.messages)
    expect($scope.attrs.type).toEqual(EMAIL_TYPES.SENT)

  it 'Should get the info about the message when selected and set as read if inbox', inject ($controller, $httpBackend, $timeout, APP_BASE_URL) ->

    # Setup
    $httpBackend.expect('GET', APP_BASE_URL + 'inbox/1').respond(200, {message: msgsMock.data.messages[0]})
    $httpBackend.expect('PUT', APP_BASE_URL + 'inbox/1/read').respond(200)
    $controller 'InboxController', controllerInjections

    # Call
    $scope.methods.selectMessage(msgsMock.data.messages[0].id)
    $scope.$digest()
    $httpBackend.flush()
    $timeout.flush()

    # Expectations
    expect($scope.attrs.selectedMessage).toEqual(msgsMock.data.messages[0])

  it 'Should get the info about the message when selected and not set as read if sent', inject ($controller, $httpBackend, $timeout, APP_BASE_URL, EMAIL_TYPES) ->

    # Setup
    $httpBackend.expect('GET', APP_BASE_URL + 'inbox/1').respond(200, {message: msgsMock.data.messages[0]})

    controllerInjections.type = EMAIL_TYPES.SENT
    $controller 'InboxController', controllerInjections

    # Call
    $scope.methods.selectMessage(msgsMock.data.messages[0].id)
    $scope.$digest()
    $httpBackend.flush()
    $timeout.flush()

    # Expectations
    expect($scope.attrs.selectedMessage).toEqual(msgsMock.data.messages[0])


  it 'Should delete the message and refresh the results', inject ($controller, $httpBackend, $timeout, APP_BASE_URL, EMAIL_TYPES) ->

    # Setup
    $httpBackend.expect('DELETE', APP_BASE_URL + 'inbox/1').respond(200)
    $httpBackend.expect('GET', APP_BASE_URL + 'inbox').respond(200, { messages: [] })

    $controller 'InboxController', controllerInjections
    $scope.attrs = { selectedMessage: { uid: 2 }}

    # Call
    $scope.methods.deleteMessage(msgsMock.data.messages[0].id)
    $scope.$digest()
    $httpBackend.flush()
    $timeout.flush()

    # Expectations
    expect($scope.attrs.messages.length).toEqual(0)

  it 'Should delete the message and refresh the results and if is the selected message, deselect', inject ($controller, $httpBackend, $timeout, APP_BASE_URL, EMAIL_TYPES) ->

    # Setup
    $httpBackend.expect('DELETE', APP_BASE_URL + 'inbox/1').respond(200)
    $httpBackend.expect('GET', APP_BASE_URL + 'inbox').respond(200, { messages: [] })

    $controller 'InboxController', controllerInjections
    $scope.attrs = { selectedMessage: { uid: 1 }}

    # Call
    $scope.methods.deleteMessage(msgsMock.data.messages[0].id)
    $scope.$digest()
    $httpBackend.flush()
    $timeout.flush()

    # Expectations
    expect($scope.attrs.messages.length).toEqual(0)
    expect($scope.attrs.selectedMessage).toEqual(undefined)