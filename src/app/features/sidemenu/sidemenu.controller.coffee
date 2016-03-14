angular.module 'sergio'
  .controller 'SidemenuController',[
    '$timeout',
    '$scope',
    'sidemenuProvider',
    '$state',
    '$stateParams',
    'ApiService',
    ($timeout, $scope, sidemenuProvider, $state, $stateParams, ApiService) ->
      'ngInject'

      $scope.state = $state

      $scope.$broadcast 'fade-in'

      $scope.tipoThumb = $stateParams.tipoThumb

      ApiService.getRequest('menu_itens').then(
        (res)->
          $scope.menuItems = res.data.menuItems
          $scope.transformData $scope.menuItems
        (err)->
          console.log err
      )

      $scope.transformData = (arr)->
        for item in arr
          if item.children
            for child in item.children
              if child.tipo_thumb is null
                child.tipo_thumb = 2
        console.log arr
        return arr

      # $scope.menuItems = [
      #   {
      #     title:  'Paintings'
      #     sref:   'paintings'
      #     children: [
      #       {
      #         titlePt: 'Quadros que continuam nos outros'
      #         titleEn: 'Paintings that continue on in others'
      #         sref: 'continue'
      #       },
      #       {
      #         titlePt: 'Série Um Bilhão'
      #         titleEn: 'The One Billion Series'
      #         sref: 'billion'
      #       },
      #       {
      #         titlePt: 'Série Teoria das Cordas'
      #         titleEn: 'The String Theory Series'
      #         sref: 'string-theory'
      #       },
      #       {
      #         titlePt: 'Obras de 1998 a 2003'
      #         titleEn: 'Workd from 1998 to 2003'
      #         sref: 'works'
      #       }
      #     ]
      #   },
      #   {
      #     title: 'Photography'
      #     sref: 'photography'
      #     children: [
      #       {
      #         titlePt: 'Séries Dimensões'
      #         titleEn: 'Dimensions Series'
      #         sref: 'dimensions'
      #       },
      #       {
      #         titlePt: 'Outras Séries'
      #         titleEn: 'Other Series'
      #         sref: 'other'
      #       },
      #       {
      #         titlePt: 'Cidades'
      #         titleEn: 'Cities'
      #         sref: 'cities'
      #         children: [
      #           {
      #             title: 'Sao Paulo'
      #             sref: 'sp'
      #           },
      #           {
      #             title: 'New York'
      #             sref: 'ny'
      #           },
      #           {
      #             title: 'Rome'
      #             sref: 'rm'
      #           },
      #           {
      #             title: 'Paris'
      #             sref: 'pr'
      #           },
      #           {
      #             title: 'Other cities'
      #             sref: 'other'
      #           }
      #         ]
      #       },
      #       {
      #         titlePt: 'Pessoas'
      #         titleEn: 'People'
      #         sref: 'people'
      #       }
      #     ]
      #   }
      # ]

  ]