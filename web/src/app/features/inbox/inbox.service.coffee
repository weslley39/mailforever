angular.module "mailforever"
  .service "InboxService", ($http, APP_BASE_URL) ->
    return {
      getAll: () ->
        $http
          url               : APP_BASE_URL + 'inbox'
          method            : 'GET'

      getById: (id) ->
        $http
          url               : APP_BASE_URL + "inbox/#{id}"
          method            : 'GET'
    }