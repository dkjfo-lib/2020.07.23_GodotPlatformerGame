tool
extends Area2D

onready var anim_player : AnimationPlayer = $AnimationPlayer
export var next_scene : PackedScene

func _get_configuration_warning() -> String:
	return "plz set up the next scene" if not next_scene else ""

func _on_portal_body_entered(body: Node) -> void:
	anim_player.play("fadeOut")
	yield(anim_player, "animation_finished")
	if not next_scene:
		return
	else:
		get_tree().change_scene_to(next_scene)
