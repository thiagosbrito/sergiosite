angular.module 'sergio'
  .directive 'tsbGallery', [
    '$animate'
    '$state',
    '$timeout',
    '$modal',
    '$stateParams',
    '$log',
    ($animate, $state, $timeout, $modal, $stateParams, $log) ->
      return {
        templateUrl: '/app/directives/gallery.html'
        scope:
          images: '=ngModel'
        link: (s, e, a)->
          s.sParam = {}
          s.sParam.limit = 6
          s.sParam.tipoThumb = $stateParams.tipoThumb
          s.sParam.tipo = $stateParams.tipo
          if s.sParam.tipoThumb is '1'
              s.sParam.limit = 6
          if s.sParam.tipoThumb is '2'
              s.sParam.limit = 24

          s.openModal = (image)->
              modalInstance = $modal.open(
                animation: true
                backdrop: 'static'
                templateUrl: '/app/features/gallery/modal-template.html'
                controller: 'GalleryModalController'
                size: 'lg'
                windowClass: 'testeClass'
                resolve: items: ->
                  return image
              )
              modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
              ), ->
                $log.info 'Modal dismissed at: ' + new Date
                return
              return
      }
    ]