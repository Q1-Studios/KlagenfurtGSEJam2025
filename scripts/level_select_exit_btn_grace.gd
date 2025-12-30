extends ButtonPreset

@export var root: LevelSelectGUI
@export var actual_button: ButtonPreset

signal exit_level_select

func _ready() -> void:
	super._ready()
	if not Globals.is_mobile:
		hide()

func press() -> void:
	if root.allow_exit:
		actual_button.grab_focus()
		exit_level_select.emit()
