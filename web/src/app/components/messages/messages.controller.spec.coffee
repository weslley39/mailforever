'use strict'

describe 'directives: messages', () ->
  scope = null

  beforeEach module('mailforever')

  beforeEach inject(($rootScope, $templateCache, $injector) ->
    scope = $rootScope.$new()
  )

  it 'Should instanciate the scope properties', inject ($rootScope, $compile) ->
    # Setup
    messages = [
      {
        id: 1,
        name: 'Foo'
      }
    ]

    type = 'inbox'

    scope.messages = messages
    scope.type = type

    # Compile
    elem = angular.element "<messages data='messages' type='type'></messages>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call

    # Expectations
    expect(isolateScope.attrs.messages).toEqual(messages)
    expect(isolateScope.attrs.type).toEqual(type)

  it 'Should call the callback function when the user select the message', inject ($rootScope, $compile) ->
    # Setup
    selectedMessage = {}

    scope.selectMessage = (message) ->
      selectedMessage = message

    messages = [
      {
        id: 1,
        name: 'Foo'
      }
    ]
    type = 'inbox'

    scope.messages = messages
    scope.type     = type

    # Compile
    elem = angular.element "<messages data='messages' type='type' select-cb='selectMessage(id)'></messages>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call
    isolateScope.methods.select(messages[0])

    # Expectations
    expect(selectedMessage).toEqual(messages[0].id)

  fit 'Should set property read to true when selected', inject ($rootScope, $compile) ->
    # Setup
    selectedMessage = {}

    scope.selectMessage = (message) ->
      selectedMessage = message

    messages = [
      {
        id: 1,
        name: 'Foo',
        read: false
      }
    ]
    type = 'inbox'

    scope.messages = messages
    scope.type     = type

    # Compile
    elem = angular.element "<messages data='messages' type='type' select-cb='selectMessage(id)'></messages>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call
    isolateScope.methods.select(messages[0])

    # Expectations
    expect(messages[0].read).toBeTruthy()

  it 'should check if the message is the active one', inject ($rootScope, $compile) ->
    # Setup

    # Compile
    elem = angular.element "<messages></messages>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call
    isolateScope.attrs.selected = {uid: 1}
    result = isolateScope.methods.isSelected(1)

    # Expectations
    expect(result).toBeTruthy()