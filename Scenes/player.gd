extends CharacterBody2D

const SPEED = 400.0

func _physics_process(delta: float):
	velocity.y = 0
	
	if Input.is_action_pressed("playerUp"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("playerDown"):
		velocity.y = SPEED
	
	move_and_slide()
	
	var paddleHeight = $Collision.shape.size.y
	var viewportHeight = get_viewport_rect().size.y
	
	global_position.y = clamp(global_position.y, 0, viewportHeight - paddleHeight)
