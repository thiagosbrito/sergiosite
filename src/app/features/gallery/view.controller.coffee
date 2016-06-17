angular.module 'sergio'
.controller 'ViewController',[
  '$timeout',
  '$scope',
  'sidemenuProvider',
  '$state',
  '$stateParams',
  '$modal',
  'ApiService',
  ($timeout, $scope, sidemenuProvider, $state, $stateParams, $modal, ApiService) ->
    'ngInject'


    $scope.$sp = $stateParams

    $scope.$on 'closeThumbs', ()->
      console.log 'Worked'

    $scope.showThumbs = false;

    $scope.getThumbs = ()->
      $scope.showThumbs = true;
    $scope.image = $stateParams.image

    console.log $scope.image

    $scope.goToPrev = ()->
      $scope.image = $scope.image.prev
    $scope.goToNext = ()->
      $scope.image = $scope.image.next
]
