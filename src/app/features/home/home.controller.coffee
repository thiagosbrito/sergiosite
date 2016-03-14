angular.module 'sergio'
  .controller 'HomeController',['$scope','$timeout','homeService', ($scope, $timeout, homeService) ->
    'ngInject'
    
    $scope.$broadcast 'fade-in'
    
    homeService.getBanners().then(
      (res)->
        $scope.banners = res.data
        console.log $scope.banners
      (err)->
        console.log err
    )


    $scope.images = [
      '/assets/images/home/foto-1.jpg'
      '/assets/images/home/foto-2.jpg'
      '/assets/images/home/foto-3.jpg'
    ]

    $scope.currentPic = $scope.images[0]
    
    $scope.changePic = (index)->
      $scope.currentPic = $scope.images[index]

    i = 0
    setInterval((->
      i++

      if i == 3
        i = 0

      $scope.changePic i
    ), 2500)

    return
    


      

  ]

