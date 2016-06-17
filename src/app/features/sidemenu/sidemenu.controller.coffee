angular.module 'sergio'
  .controller 'SidemenuController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    '$stateParams',
    'ApiService',
    'Fullscreen',
    '$rootScope',
    ($timeout, $scope, sidemenuProvider, $state, $stateParams, ApiService, Fullscreen, $rootScope) ->
      'ngInject'

      $scope.state = $state
      $scope.closeThumbs = ()->
        window.history.back()

      $scope.$broadcast 'fade-in'

      $scope.tipoThumb = $stateParams.tipoThumb

      ApiService.getRequest('menu_itens').then(
        (res)->
          $scope.menuItems = res.data.menuItems
          console.log $scope.menuItems
          $scope.transformData $scope.menuItems
          console.log $scope.menuItems
        (err)->
          console.log err
      )

      $scope.transformData = (arr)->
        for item in arr
          if item.children
            for child in item.children
              child.sref = item.sref
              if child.tipo_thumb is null
                child.tipo_thumb = 2
              if child.titleEn is 'Cities'
                child.sref = 'cities'
                child.tipo_thumb = 2
                if child.children
                  for c in child.children
                    c.sref = 'cities'

        return arr

      $scope.goFullscreen = ->
        Fullscreen.all()
        return

      $scope.isFullScreen = false
]
