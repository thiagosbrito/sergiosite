'use strict'
angular.module 'sergio'
  .service 'ApiService', [
    '$http',
    ($http) ->
      base_url = 'http://sergiorighini.com/2016/webservices.php?__action='
      getRequest     : (type, id, pag) ->
        if id
          if pag
            pag = pag
          else
            pag = 0
          $http
            url    : base_url + type + '&cod=' + id + '&pag=' + pag
            method : 'GET'
        else
          $http
            url    : base_url + type
            method : 'GET'
  ]
