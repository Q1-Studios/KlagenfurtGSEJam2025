extends ButtonPreset

func press() -> void:
	get_tree().change_scene_to_packed(SceneManager.menuScene)
