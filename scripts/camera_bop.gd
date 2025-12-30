extends Camera2D

var music_bus_idx = AudioServer.get_bus_index("Music")
var spectrum := AudioServer.get_bus_effect_instance(
	music_bus_idx, 0
) as AudioEffectSpectrumAnalyzerInstance

@export var zoom_amount := 0.038
@export var smooth_speed := 10.0

var current_zoom := 1.0

@export var attack_speed = 14.0
@export var release_speed = 7.0
@export var range_low = 20
@export var range_high = 100

func _process(delta):
	var low = spectrum.get_magnitude_for_frequency_range(range_low, range_high).length()
	var energy = clamp(low * 5, 0.0, 1.0)
	var target_zoom = 1.0 + energy * zoom_amount

	var speed = attack_speed if target_zoom > current_zoom else release_speed
	current_zoom = lerp(current_zoom, target_zoom, 1.0 - exp(-speed * delta))
	zoom = Vector2.ONE * current_zoom
