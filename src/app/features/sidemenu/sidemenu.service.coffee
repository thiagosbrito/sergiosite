angular.module 'sergio'
  .service 'sidemenuProvider', ['$http', ($http) ->
    
    BASE_URL = 'http://sergiorighini.com/2016/webservices.php?__action='

    getPhotoLinks: ->
      $http
        url     : BASE_URL + 'links_photography'
        method  : 'GET'

    getPaintingsLinks: ()->
      $http
        url     : BASE_URL + "links_paintings"
        method  : 'GET'

    getCitiesLinks: () ->
      $http
        url     : BASE_URL + 'links_cities'
        method  : 'GET'

    getOperaLinks: () ->
      $http
        url     : BASE_URL + 'links_opera'
        method  : 'GET'
  ]