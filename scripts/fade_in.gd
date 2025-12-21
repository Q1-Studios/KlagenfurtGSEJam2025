extends ColorRect

@export var duration: float = 1

func _ready() -> void:
	color.a = 1

func _process(delta: float) -> void:
	if color.a > 0:
		color.a -= delta * (1/duration)
