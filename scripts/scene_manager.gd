extends Node
@export var menuScene:PackedScene
@export var scoreScene:PackedScene

@export var levelScene:PackedScene
@export var level2Scene:PackedScene
@export var level3Scene:PackedScene
@export var level4Scene:PackedScene

enum LevelIds {
	LEVEL1,
	LEVEL2,
	LEVEL3,
	LEVEL4
}

@onready var level_dict: Dictionary[LevelIds, PackedScene] = {
	LevelIds.LEVEL1: levelScene,
	LevelIds.LEVEL2: level2Scene,
	LevelIds.LEVEL3: level3Scene,
	LevelIds.LEVEL4: level4Scene,
}

func get_level_from_id(id: LevelIds) -> PackedScene:
	return level_dict[id]
