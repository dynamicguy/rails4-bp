Rails4Bp.Notify =
	show: (type="alert", text="", layout="bottomRight") ->
		noty(
			text: text
			type: type
			layout: layout
			timeout: 3000
			theme: "defaultTheme"
		)
