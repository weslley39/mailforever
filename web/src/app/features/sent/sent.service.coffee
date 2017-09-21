angular.module "mailforever"
  .service "SentService", ($http, APP_BASE_URL) ->
    return {
      getAll: () ->
        $http
          url               : APP_BASE_URL + 'sent'
          method            : 'GET'

      getById: (id) ->
        $http
          url               : APP_BASE_URL + "sent/#{id}"
          method            : 'GET'
    }