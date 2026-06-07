extends CharacterBody2D

const SPEED = 400.0
var ball: Node2D

func _ready():
	ball = get_node("../Ball")

func _physics_process(_delta: float):
	var direction = 0.0
	
	if ball.position.y > position.y:
		direction = 1.0
	elif ball.position.y < position.y:
		direction = -1.0
	
	velocity.y = direction * SPEED
	move_and_slide()
	
	var paddleHeight = $Collision.shape.size.y
	var viewportHeight = get_viewport_rect().size.y
	
	global_position.y = clamp(global_position.y, 0, viewportHeight - paddleHeight)
