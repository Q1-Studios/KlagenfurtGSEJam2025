extends Label

func _ready() -> void:
	if Globals.is_mobile:
		text = "Mobile"
	else:
		text = "PC"
