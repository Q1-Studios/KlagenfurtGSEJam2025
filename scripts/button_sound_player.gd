extends Node
class_name ButtonSoundPlayer

@onready var parent_area: Node = $".."

@export var click_sfx: AudioStreamPlayer
@export var hover_sfx: AudioStreamPlayer

func _ready() -> void:
	if parent_area is Button:
		parent_area.mouse_entered.connect(_on_mouse_entered)
		parent_area.pressed.connect(_on_pressed)
	else:
		print("Legacy Button: " + parent_area.name)

func _on_mouse_entered() -> void:
	hover_sfx.play()
	
func _on_pressed() -> void:
	click_sfx.play()
