extends Button

onready var scene_tree = get_tree()

func _on_Button_Retry_pressed() -> void:
	PlayerData.score = 0
	scene_tree.paused = false
	scene_tree.reload_current_scene()
