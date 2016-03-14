angular.module 'sergio'
  .controller 'ContactController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    '$stateParams',
    '$modal',
    'ApiService',
    ($timeout, $scope, sidemenuProvider, $state, $stateParams, $modal, ApiService) ->
      'ngInject'
      
      ApiService.getRequest('contact').then(
        (res)->
          $scope.contato = res.data.contact
        (err)->
          console.log err
      )
  ]