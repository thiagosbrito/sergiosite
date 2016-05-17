angular.module 'sergio'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'main',
        url: ''
        views:
          '':
            templateUrl: 'app/features/main.html'
            controller: ($scope, $state)->
              $scope.st = $state
          'sidemenu@main':
            templateUrl:  'app/features/sidemenu/sidemenu.html'
            controller:   'SidemenuController'

      .state 'main.home',
        url: '/home'
        templateUrl:      'app/features/home/home.html'
        controller:       'HomeController'

      .state 'main.landing',
        url: '/landing'
        templateUrl: 'app/features/landing/landing.html'
        controller: 'LandingController'

      .state 'main.gallery',
        url: '/gallery/:tipoThumb/:tipo/:id'
        templateUrl: 'app/features/gallery/gallery.html'
        controller: 'GalleryController'
        resolve     :
          request: [
            'ApiService',
            '$stateParams',
            '$state',
            (ApiService, $stateParams, $state) ->
              if $stateParams.id
                ApiService.getRequest('imgs_' + $stateParams.tipo, $stateParams.id).then(
                  (res)->
                    return res.data['imgs_'+$stateParams.tipo]
                  (err)->
                    console.log err
                )
              else
                ApiService.getRequest($stateParams.tipo).then(
                  (res)->
                    return res.data[$stateParams.tipo]
                  (err)->
                    console.log err
                )
          ]
          

      .state 'main.contact',
        url: '/contact'
        templateUrl: 'app/features/contact/contact.html'
        controller: 'ContactController'

      .state 'main.about',
        url: '/about-me'
        templateUrl: 'app/features/about-me/aboutme.html'
        controller: 'AboutController'

    $urlRouterProvider.otherwise '/landing'
