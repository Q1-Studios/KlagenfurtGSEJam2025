extends Button

@export var selected_modulate: Color = Color(1.5, 0.8, 0.2)
@export var default_select: bool = false
@export var level_num: int = 1

@onready var default_modulate: Color = modulate

var selected: bool = false

signal level_clicked(level)
signal level_selected(level)

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	pressed.connect(_on_pressed)
	
	if default_select:
		select()

func _on_mouse_entered() -> void:
	if is_visible_in_tree():
		select()
	
func _on_mouse_exited() -> void:
		modulate = default_modulate

func _on_pressed() -> void:
	if is_visible_in_tree():
		level_clicked.emit(level_num)

func select():
	modulate = selected_modulate
	level_selected.emit(level_num)
