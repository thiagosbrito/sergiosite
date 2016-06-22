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

      $scope.$stateParams = $stateParams
      $scope.curPage = $stateParams.page
      
      $scope.getPageNum = ()->
        ApiService.getRequest('menu_itens').then(
          (res)->
            $scope.items = res.data['menuItems'];
            $scope.getPages $scope.items
          (err)->
            console.log err
        )

      $scope.getPageNum()
      $scope.getPages = (items)->
        angular.forEach items,(value)->
          if value.sref is $stateParams.tipo or value.sref == 'photography'
            angular.forEach value.children,(children)->
              if children.id is $stateParams.id
                $scope.pages = children.pages
              if children.sref is 'cities'
                angular.forEach children.children,(c)->
                  if c.id is $stateParams.id
                    $scope.pages = c.pages

            return
        return

      $scope.definePage = (page)->
        if page < 1
          page = 1
          $scope.curPage = page
        if page > $scope.pages
          page = $scope.pages
          $scope.curPage = page
        $scope.curPage = page
        return page

      $scope.next = ()->
        $state.go 'main.gallery.thumbs',{tipo: $stateParams.tipo, id: $stateParams.id, tipoThumb: $stateParams.tipoThumb, page: $scope.definePage parseInt($scope.curPage) + 1}
        return

      $scope.prev = ()->
        $state.go 'main.gallery.thumbs',{tipo: $stateParams.tipo, id: $stateParams.id, tipoThumb: $stateParams.tipoThumb, page: $scope.definePage parseInt($scope.curPage) - 1}
        return

      $scope.goToView = (img)->
        $state.go 'main.gallery.view',{tipoThumb: img.tipoThumb, tipo: img.tipo, id: img.id, page: 1, image: img, tipoId: $stateParams.id}
        return

      $scope.getImages = (tipo, id, page)->

        ApiService.getRequest(tipo, id, page).then(
          (res)->
            $scope.images = res.data['imgs_' + $stateParams.tipo]
            $scope.transformObj $scope.images
            console.log $scope.images
            $scope.curPic = 0;
            $scope.maxPic = $scope.images.length;
            return
          (err)->
            console.log err
            return
        )
        return
      $scope.getImages('imgs_'+$stateParams.tipo, $stateParams.id, $stateParams.page)


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

      $scope.goToNext = ()->
        $scope.curPic = $scope.curPic + 1;
        if $scope.curPic > $scope.images.length
          $scope.curPic = 0
      $scope.goToPrev = ()->
        $scope.curPic = $scope.curPic - 1;
        if $scope.curPic == 0
          $scope.curPic = $scope.images.length


  ]
