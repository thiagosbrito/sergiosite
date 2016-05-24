angular.module 'sergio'
  .controller 'SidemenuController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    '$stateParams',
    'ApiService',
    'Fullscreen',
    ($timeout, $scope, sidemenuProvider, $state, $stateParams, ApiService, Fullscreen) ->
      'ngInject'
      console.log 'Sidemenu controller'
      $scope.state = $state

      $scope.$broadcast 'fade-in'

      $scope.tipoThumb = $stateParams.tipoThumb

      ApiService.getRequest('menu_itens').then(
        (res)->
          $scope.menuItems = res.data.menuItems
          $scope.transformData $scope.menuItems
          console.log $scope.menuItems
        (err)->
          console.log err
      )

      $scope.transformData = (arr)->
        for item in arr
          if item.children
            for child in item.children
              if child.tipo_thumb is null
                child.tipo_thumb = 2
        return arr

      $scope.goFullscreen = ->
        console.log 'FullBitch'
        Fullscreen.all()
        return

      $scope.isFullScreen = false
]
