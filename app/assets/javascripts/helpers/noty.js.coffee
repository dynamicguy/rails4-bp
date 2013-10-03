Rails4Bp.Notify =
	confirm: (model) ->
		bootbox.dialog
			message: "<p>Are you sure you want to delete this item with ID: [#{model.get("id")}]? This action is irreversible. Be certain, sony!</p>"
			title: "Please confirm your action"
			buttons:
				danger:
					label: "Delete anyway!"
					className: "btn-danger"
					callback: ->
						model.destroy()
				main:
					label: "Close"
					className: "btn-primary"

#		noty(
#			text: "Are you sure you want to delete #{model.get("name")} with ID: #{model.get("id")}?"
#			type: "alert"
#			layout: 'center'
#			theme: "defaultTheme"
#			modal: true
#			template: '<div class="noty_message"><p class="noty_text"></p><div class="noty_close"></div></div>'
#			buttons: [
#				addClass: "btn btn-primary"
#				text: "Ok"
#				onClick: ($noty) ->
#					$noty.close()
#					console.log 'OK'
#					model.destroy()
#			,
#				addClass: "btn btn-default btn-danger"
#				text: "Cancel"
#				onClick: ($noty) ->
#					$noty.close()
#					console.log 'Cancelled'
#					false
#			]
#		)

	show: (type = "alert", text = "", layout = "bottomRight") ->
		noty(
			text: text
			type: type
			layout: layout
			timeout: 3000
			theme: "defaultTheme"
		)
