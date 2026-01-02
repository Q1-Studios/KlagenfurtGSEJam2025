extends ColorRect

var paused: bool = false
var require_release: bool = false

func _process(_delta: float) -> void:
	if paused and Input.is_anything_pressed() and not require_release:
		set_pause(false)
	elif not paused and Input.is_action_just_pressed("ui_cancel"):
		set_pause(true)
	
	if not get_window().has_focus():
		set_pause(true)
	
	# If a key was presed in the last frame, require the key to be released
	# Otherwise, an unpause would be performed immediately after a pause
	require_release = Input.is_anything_pressed()

func set_pause(value: bool) -> void:
	paused = value
	visible = value
	get_tree().paused = value
