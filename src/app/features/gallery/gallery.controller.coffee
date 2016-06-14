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
      $scope.curPage = 1
      $scope.pages = 0


      $scope.$watch 'curPage',(value, oldValue)->
        if value > $scope.pages
          value = 1
        if value <= 0
          value = $scope.curPage
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
          if value.sref is $stateParams.tipo
            angular.forEach value.children,(children)->
              if children.id is $stateParams.id
                $scope.pages = children.pages
            return
        return


      $scope.nextPage = ()->
        nextPage = $scope.curPage + 1
        if nextPage > $scope.pages
          nextPage = 1

        $state.go 'main.gallery.thumbs',{tipoThumb:$stateParams.tipoThumb,tipo:$stateParams.tipo,id:$stateParams.id,page:nextPage}
        return
      $scope.prevPage = ()->
        nextPage = $scope.curPage - 1
        if nextPage is 0
          nextPage = $scope.pages
        $state.go 'main.gallery.thumbs',{tipoThumb: $stateParams.tipoThumb,tipo:$stateParams.tipo,id:$stateParams.id,page:nextPage}
        return
      $scope.goToView = (img)->
        $state.go 'main.gallery.view',{tipoThumb: img.tipoThumb, tipo: img.tipo, id: img.id, page: 1, image: img}
        return

      $scope.getImages = (tipo, id, page)->

        ApiService.getRequest(tipo, id, page).then(
          (res)->
            $scope.images = res.data['imgs_' + $stateParams.tipo]
            $scope.transformObj $scope.images
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


  ]
