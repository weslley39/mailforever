angular.module('mailforever')
  .constant 'APP_BASE_URL', 'api/'
  .constant 'EMAIL_TYPES', {
    INBOX: 'inbox',
    SENT : 'sent'
  }