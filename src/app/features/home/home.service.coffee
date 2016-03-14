'use strict'
angular.module 'sergio'
  .service 'homeService', ['$http', ($http)->

    BASE_URL = 'http://sergiorighini.com/2016/webservices.php?__action='
    
    getBanners: ()->
      $http
        url     : BASE_URL + 'banners_home'
        method  : 'GET'

  ]