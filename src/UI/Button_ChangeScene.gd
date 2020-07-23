tool
extends Button

onready var scene_tree = get_tree()

export (String, FILE) var next_scene:  = "" 

func _get_configuration_warning() -> String:
	return "PLZ, Set up the start scene" if not next_scene else ""

func _on_Button_play_pressed() -> void:
	if scene_tree.paused: 
		scene_tree.paused = false
	PlayerData.reset() 
	get_tree().change_scene(next_scene)
