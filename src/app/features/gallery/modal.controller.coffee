angular.module 'sergio'
  .controller 'GalleryModalController' ,[
    '$modalInstance',
    '$scope',
    'items',
    '$stateParams',
    ($modalInstance, $scope, items, $stateParams)->

      $scope.sParam = $stateParams

      $scope.image = items

      $scope.navigate = (direction)->
        console.log direction
        $scope.image = direction

      $scope.cancel = ()->
        $modalInstance.dismiss 'cancel'
  ]