angular.module 'sergio'
  .controller 'HomeController',['$scope','$timeout','homeService','$state','$interval', ($scope, $timeout, homeService, $state, $interval) ->
    'ngInject'

    $scope.$broadcast 'fade-in'

    homeService.getBanners().then(
      (res)->
        $scope.banners = res.data
        $scope.doAnimation $scope.banners
      (err)->
        console.log err
    )

    $scope.doAnimation = (banners)->
      for b,k in banners.banners
        if k is 0
          b.active = true
        else
          b.active = false
      return banners

    $interval (->
      index = _.findIndex $scope.banners.banners, _.findWhere $scope.banners.banners, {active: true}
      $scope.banners.banners[index].active = false;
      if index < $scope.banners.banners.length
        index = index + 1;
        $scope.banners.banners[index].active = true
      else
        index = 0
    ), 5000
  ]

