extends ButtonPreset
class_name ButtonGraceAreaMobile

@onready var actual_button: ButtonPreset = $".."

func _ready() -> void:
	super._ready()
	if not Globals.is_mobile:
		hide()

func _process(_delta: float) -> void:
	selectable = actual_button.selectable
	disabled = actual_button.disabled

func select() -> void:
	actual_button.grab_focus()

func unselect() -> void:
	if not actual_button.mouse_inside:
		actual_button.release_focus()

func press() -> void:
		actual_button.grab_focus()
		actual_button._on_pressed()
