'use strict'

describe 'directives: sidebar', () ->
  scope = null

  beforeEach module('mailforever')

  beforeEach inject(($rootScope, $templateCache, $injector) ->
    scope = $rootScope.$new()
  )

  it 'should check if the menu item is the active one', inject ($rootScope, $compile, $state) ->
    # Setup
    $state.current = { name: 'inbox'}

    # Compile
    elem = angular.element "<sidebar></sidebar>"
    elem = $compile(elem)(scope)
    scope.$digest()
    isolateScope = elem.isolateScope()

    # Call
    result = scope.methods.isActive('inbox')


    # Expectations
    expect(result).toBeTruthy()