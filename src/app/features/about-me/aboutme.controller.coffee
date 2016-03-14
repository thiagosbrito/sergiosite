angular.module 'sergio'
  .controller 'AboutController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    '$stateParams',
    '$modal',
    'ApiService',
    ($timeout, $scope, sidemenuProvider, $state, $stateParams, $modal, ApiService) ->
      'ngInject'
      
      ApiService.getRequest('about_me').then(
        (res)->
          $scope.about = res.data.aboutme
        (err)->
          console.log err
      )
  ]