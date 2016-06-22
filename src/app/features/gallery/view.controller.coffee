angular.module 'sergio'
.controller 'ViewController',[
  '$timeout',
  '$scope',
  'sidemenuProvider',
  '$state',
  '$stateParams',
  '$modal',
  'ApiService',
  'Fullscreen',
  ($timeout, $scope, sidemenuProvider, $state, $stateParams, $modal, ApiService, Fullscreen) ->
    'ngInject'

    console.log $stateParams
    $scope.getImages = (tipo, id, page)->

      ApiService.getRequest(tipo, id, 0).then(
        (res)->
          $scope.images = res.data['imgs_' + $stateParams.tipo]
          $scope.transformObj $scope.images
          $scope.setImage()
          $scope.curPic = 0;
          $scope.maxPic = $scope.images.length;
          return
        (err)->
          console.log err
          return
      )
      return
    $scope.getImages('imgs_'+$stateParams.tipo, $stateParams.tipoId)

    $scope.transformObj = (images)->
      lgt = images.length - 1
      for img, key in images
        img.tipo = $stateParams.tipo
        img.tipoThumb = $stateParams.tipoThumb
        if key is 0
          img.first = true
          img.last = false
          img.prev = images[lgt]
          img.next = images[key + 1]
        if key is lgt
          img.first = false
          img.last = true
          img.prev = images[key - 1]
          img.next = images[0]
        if key isnt 0 and key isnt lgt
          img.first = false
          img.last = false
          img.prev = images[key - 1]
          img.next = images[key + 1]
      return images

    $scope.isFullscreen = false

    $scope.$sp = $stateParams

    $scope.$on 'closeThumbs', ()->
      console.log 'Worked'
      return

    $scope.showThumbs = false

    $scope.getThumbs = ()->
      $scope.showThumbs = true;
      return

    $scope.image = $stateParams.image
    
    $scope.setImage = ()->
      if $stateParams.tipo is 'opera'
        $scope.image = $stateParams.image
      else 
        $scope.image = _.findWhere $scope.images,{id: $stateParams.image.id}

    console.log $scope.image

    $scope.goToPrev = ()->
      $scope.image = $scope.image.prev
      return
    
    $scope.goToNext = ()->
      $scope.image = $scope.image.next
      return

    $scope.toggleFullScreen = ()->
      $scope.isFullscreen = !$scope.isFullscreen
      return

    return
]
