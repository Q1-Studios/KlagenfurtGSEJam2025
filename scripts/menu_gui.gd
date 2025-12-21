extends Node2D

@export var environment: WorldEnvironment

func _on_transition_to_level() -> void:
	environment.environment.adjustment_brightness = 1.2
	$FadeOut.start_fade_out()
