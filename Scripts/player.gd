extends CharacterBody2D
@onready var the_boss: Sprite2D = $TheBoss



const SPEED = 600.0
const JUMP_VELOCITY = -1000.0
const SKEW_CHANGE = 100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var tween = get_tree().create_tween()
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			tween.tween_property(the_boss,"flip_h",false,0)
			tween.tween_property(the_boss,"skew",0.3,1)
		if direction == -1:
			tween.tween_property(the_boss,"flip_h",true,0)
			tween.tween_property(the_boss,"skew",-0.3,1)

	else:
		tween.tween_property(the_boss,"skew",0,1)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
