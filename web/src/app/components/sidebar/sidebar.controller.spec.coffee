# 'use strict'

# describe 'directives: sidebar', () ->
#   scope = null

#   beforeEach module('mailforever')

#   beforeEach inject(($rootScope, $templateCache, $injector) ->
#     scope = $rootScope.$new()
#   )

#   fit 'should check if the menu item is the active one', inject ($rootScope, $compile) ->
#     # Setup

#     # Compile
#     elem = angular.element "<sidebar></sidebar>"
#     elem = $compile(elem)(scope)
#     scope.$digest()
#     isolateScope = elem.isolateScope()

#     # Call
#     result = isolateScope.methods.isActive('inbox')


#     # Expectations
#     expect(result).toBeTruthy()