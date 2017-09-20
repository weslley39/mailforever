angular.module "mailforever"
  .service "InboxService", ($http, APP_BASE_URL) ->
    return {
      getAll: () ->
        $http
          url               : APP_BASE_URL + 'inbox'
          method            : 'GET'
    }