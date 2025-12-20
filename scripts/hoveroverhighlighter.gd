extends Node2D

@export var highlight_color: Color = Color(1.5, 0.8, 0.2, 1.0)
@export var normal_color: Color = Color(1, 1, 1, 1)

@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	area_2d.mouse_entered.connect(_on_mouse_entered)
	area_2d.mouse_exited.connect(_on_mouse_exited)
	area_2d.input_event.connect(_on_input_event)

func _on_mouse_entered() -> void:
	modulate = highlight_color

func _on_mouse_exited() -> void:
	modulate = normal_color

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		handle_click()

func handle_click() -> void:
	print("Owl clicked!")
	
