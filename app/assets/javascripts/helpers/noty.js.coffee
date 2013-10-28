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

  show: (type = "alert", text = "", layout = "bottomRight") ->
    noty(
      text: text
      type: type
      layout: layout
      timeout: 3000
      theme: "defaultTheme"
    )
