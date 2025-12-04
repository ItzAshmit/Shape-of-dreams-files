extends CharacterBody2D


var SPEED = -300.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.x += SPEED * delta
		if is_on_wall():
			scale.x = scale.x * -1
	if $RayCast2D.is_colliding():
		SPEED = 2000
	move_and_slide()
