'use strict'

# =============================================
# Module
# =============================================
angular.module 'sergio'

  # =============================================
  # DashboardService
  # =============================================
  .service 'ApiService', [
    '$http',
    ($http) ->

      base_url = 'http://sergiorighini.com/2016/webservices.php?__action='

      getRequest     : (type, id) ->
        
        if id
          $http
            url    : base_url + type + '&cod=' + id
            method : 'GET'
        else
          $http
            url    : base_url + type
            method : 'GET'

  ]
