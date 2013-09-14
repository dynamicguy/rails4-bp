
# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require components/underscore-amd/underscore
#= require components/backbone-amd/backbone
#= require components/backbone.marionette/lib/backbone.marionette
#= require components/bootstrap/dist/js/bootstrap
#= require components/backbone.syphon/lib/backbone.syphon
#= require js-routes
#= require_tree ./backbone/config
#= require backbone/app
#= require_tree ./helpers
#= require_tree ./backbone/controllers
#= require_tree ./backbone/views
#= require_tree ./backbone/entities
#= require_tree ./backbone/components
#= require_tree ./backbone/apps
#= require init