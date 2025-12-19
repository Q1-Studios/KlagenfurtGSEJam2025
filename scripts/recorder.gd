extends Node2D

@export var music: AudioStreamPlayer

var timestamps:Array
var started:bool
var start_time:int


func _input(event: InputEvent) -> void:
	if event is InputEventAction:
		if started:
			timestamps.append({"milliseconds": Time.get_ticks_msec() - start_time, "action": event.action})
			
		if not started and event.action == "Start_Recording":
			started = true
			start_time = Time.get_ticks_msec()
			music.play()
			
		if started and event.action == "Stop_Recording":
			music.stop()
			started = false
			
			print(timestamps)
	
	
