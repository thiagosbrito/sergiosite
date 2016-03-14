angular.module 'sergio'
  .controller 'LandingController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    ($timeout, $scope, sidemenuProvider, $state) ->
      'ngInject'
      $scope.state = $state
      $scope.redirect = ()->
        $timeout ->
          $scope.$broadcast 'fade-out'
        , 3000
        return
      $scope.redirect()
      return

  ]