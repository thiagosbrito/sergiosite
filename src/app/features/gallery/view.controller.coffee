angular.module 'sergio'
.controller 'GalleryController',[
  '$timeout',
  '$scope',
  'sidemenuProvider',
  '$state',
  '$stateParams',
  '$modal',
  'ApiService',
  ($timeout, $scope, sidemenuProvider, $state, $stateParams, $modal, ApiService) ->
    'ngInject'

    console.log 'View'

]
