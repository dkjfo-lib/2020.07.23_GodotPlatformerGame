extends Actor

var DontStopJump = false


func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	print("HI")
	die()
	return
	
	
func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	print("FU")
	_velocity.y = -speed.y
	DontStopJump = true
	
	
func _physics_process(delta: float) -> void:
	var is_jump_interrupted = Input.is_action_just_released("move_jump")
	var moveDirection : = getDirection()
	_velocity = getVelocity(_velocity, moveDirection, speed, delta, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	
func getDirection() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		-1 if Input.is_action_pressed("move_jump") and is_on_floor() else 1
	)


func getVelocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		delta: float,
		is_jump_interrupted: bool
	) -> Vector2:
		
	var out_velocity: = linear_velocity
	out_velocity.x = speed.x * direction.x
	
	if direction.y == -1 : 
		out_velocity.y = -speed.y
		
	if is_going_up() and is_jump_interrupted and !DontStopJump :
		out_velocity.y = 0
		
	if DontStopJump and !is_going_up() :
		DontStopJump = false
	return out_velocity
	
func die() -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free()
	PlayerData.death_count += 1


