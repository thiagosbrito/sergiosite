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
              console.log child
              child.sref = item.sref
              if child.tipo_thumb == null 
                child.tipo_thumb = 2 
              else 
                child.tipo_thumb = parseInt child.tipo_thumb
              if child.titleEn is 'Cities'
                child.sref = 'cities'
                child.tipo_thumb = 2
                if child.children
                  for c in child.children
                    if c.tipo_thumb == null
                      c.tipo_thumb = 2 
                    else c.tipo_thumb = parseInt c.tipo_thumb
                    c.sref = 'cities'

        return arr

      $scope.$watch 'isFullscreen',(nv, ov)->
        console.log nv,ov
        return


      $scope.toggleFullScreen = ()->
        if Fullscreen.isEnabled()
         Fullscreen.cancel()
        else
           Fullscreen.all()
        $scope.isFullscreen = Fullscreen.isEnabled()
      
]
