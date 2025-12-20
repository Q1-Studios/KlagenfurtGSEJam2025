extends Node2D
var moveout = false

func _process(delta):
	if moveout:
		position.x-=delta*2000
