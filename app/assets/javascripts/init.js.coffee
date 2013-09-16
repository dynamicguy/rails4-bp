$ ->
	Rails4Bp.start environment: "<%= Rails.env %>"
	NProgress.configure
		showSpinner: false

	$(document).on "page:fetch", ->
		NProgress.start()

	$(document).on "page:change", ->
		NProgress.done()

	$(document).on "page:restore", ->
		NProgress.remove()

