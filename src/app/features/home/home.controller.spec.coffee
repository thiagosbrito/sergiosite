describe 'controllers', () ->
  vm = undefined

  beforeEach module 'sergio'

  beforeEach inject ($controller) ->
    
    vm = $controller 'HomeController'