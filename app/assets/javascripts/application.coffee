#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-sprockets
#= require angular
#= require angular-rails-templates
#= require angular-ui-router
#= require angular-ng-dialog
#= require angular-input-match
#= require angular-email-available
#= require angular-file-input
#= require underscore
#= require_tree ./client_app/templates
#= require ./client_app/application.module.js
#= require ./client_app/admin.module.js
#= require_tree ./client_app/factories
#= require_tree .




window.previewAvatar = (input, selector) ->
  if input.files && input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $(selector).css('background', 'transparent url(' + e.target.result + ')')
    reader.readAsDataURL(input.files[0])