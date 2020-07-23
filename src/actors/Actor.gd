extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2.UP

export var speed: = Vector2(200,200)
export var gravity = 200

var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta

func is_going_up()->bool:
	return _velocity.y < 0
