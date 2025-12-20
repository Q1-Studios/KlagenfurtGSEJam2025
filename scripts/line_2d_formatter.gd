extends Line2D

@export var refreshOnAllTicks: bool = false

var stop = false

func stopit():
	stop = true

func _ready() -> void:
	points = PackedVector2Array([])
	impose_format_to_all_children()
	
func _process(_delta: float) -> void:
	if refreshOnAllTicks and not stop:
		impose_format_to_all_children()
		
func impose_format_to_all_children() -> void:
	for child in get_children():
		for child2 in child.get_children():
			if child2 is not Line2D:
				continue
			child2.closed = closed
			child2.width = width
			child2.width_curve = width_curve
			child2.default_color = default_color
			child2.gradient = gradient
			child2.texture = texture
			child2.texture_mode = texture_mode
			child2.joint_mode = joint_mode
			child2.begin_cap_mode = begin_cap_mode
			child2.end_cap_mode = end_cap_mode
			child2.sharp_limit = sharp_limit
			child2.round_precision = round_precision
			child2.antialiased = antialiased
		if child is not Line2D:
			continue
		child.closed = closed
		child.width = width
		child.width_curve = width_curve
		child.default_color = default_color
		child.gradient = gradient
		child.texture = texture
		child.texture_mode = texture_mode
		child.joint_mode = joint_mode
		child.begin_cap_mode = begin_cap_mode
		child.end_cap_mode = end_cap_mode
		child.sharp_limit = sharp_limit
		child.round_precision = round_precision
		child.antialiased = antialiased
		
