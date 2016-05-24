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
      console.log $stateParams
      ApiService.getRequest('imgs_'+$stateParams.tipo, $stateParams.id).then(
        (res)->
          $scope.images = res.data['imgs_' + $stateParams.tipo]
          $scope.transformObj $scope.images
          return
        (err)->
          console.log err
      )


      tipoThumbLimit = $stateParams.tipoThumb
      if tipoThumbLimit == "1"
        $scope.limit = 6
      if tipoThumbLimit == "2"
        $scope.limit = 24

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


  ]
