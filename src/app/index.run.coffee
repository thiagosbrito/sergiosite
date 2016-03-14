angular.module 'sergio'
  .run ($log, $rootScope) ->
    'ngInject'
    $log.debug 'runBlock end'
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      console.log '$stateChangeStart to ' + toState.to + '- fired when the transition begins. toState,toParams : \n', toState, toParams
      return
    $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams) ->
      console.log '$stateChangeError - fired when an error occurs during transition.'
      console.log arguments
      return
    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      console.log '$stateChangeSuccess to ' + toState.name + '- fired once the state transition is complete.'
      return
    $rootScope.$on '$viewContentLoaded', (event) ->
      console.log '$viewContentLoaded - fired after dom rendered', event
      return
    $rootScope.$on '$stateNotFound', (event, unfoundState, fromState, fromParams) ->
      console.log '$stateNotFound ' + unfoundState.to + '  - fired when a state cannot be found by its name.'
      console.log unfoundState, fromState, fromParams
      return
