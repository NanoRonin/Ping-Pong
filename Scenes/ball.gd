extends CharacterBody2D

const SPEED = 400.0

func _ready() -> void:
	var random_angle = randf_range(-PI / 4, PI / 4)
	var direction = Vector2.RIGHT
	if randf() > 0.5:
		direction = Vector2.LEFT
	velocity = direction.rotated(random_angle) * SPEED

func _physics_process(delta: float):
	var collision = move_and_collide(velocity * delta)
	
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		velocity.y *= -1
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())   
		
