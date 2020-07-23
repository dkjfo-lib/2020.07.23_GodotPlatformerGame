extends Area2D

export var score_value: = 100

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _on_coin_body_entered(body: PhysicsBody2D) -> void:
	anim_player.play("fade_out")
	PlayerData.score += score_value
