'use strict'

describe 'directives: messages', () ->
  scope = null

  beforeEach module('mailforever')

  beforeEach inject(($rootScope, $templateCache, $injector) ->
    scope = $rootScope.$new()
  )

  it 'Should instanciate the scope properties', inject ($rootScope, $compile) ->
    # Setup
    message = {
      id: 1,
      name: 'Foo'
    }

    scope.selectedMessage = message

    # Compile
    elem = angular.element "<message-viewer message='selectedMessage'></message-viewer>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call

    # Expectations
    expect(isolateScope.message).toEqual(message)