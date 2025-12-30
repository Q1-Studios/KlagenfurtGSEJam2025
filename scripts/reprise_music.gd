extends AudioStreamPlayer

@export var level1_reprise: AudioStream
@export var level2_reprise: AudioStream
@export var level3_reprise: AudioStream

var start_volume: float = -40
@export var time_until_max_volume: float = 0.5

var target_db: float = 0.0
var db_incr_rate: float

func _ready() -> void:
	match ManagerGlobal.levelScene:
		ManagerGlobal.LevelIds.LEVEL1:
			stream = level1_reprise
			target_db = 5.0
		ManagerGlobal.LevelIds.LEVEL2:
			stream = level2_reprise
			target_db = -5.0
		ManagerGlobal.LevelIds.LEVEL3:
			stream = level3_reprise
			target_db = -2.0
	
	if ManagerGlobal.victory:
		volume_db = start_volume
		db_incr_rate = (target_db - start_volume) / time_until_max_volume
		play()

func _process(delta: float) -> void:
	if volume_db < target_db:
		volume_db += delta * db_incr_rate
		
		if volume_db > target_db:
			volume_db = target_db
	
