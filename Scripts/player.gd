extends CharacterBody2D
@onready var the_boss: AnimatedSprite2D = $AnimatedSprite2D



const SPEED = 600.0
const JUMP_VELOCITY = -800.0
const SKEW_CHANGE = 100
var tween = get_tree().create_tween()

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
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			the_boss.play("default")
			tween.tween_property(the_boss,"flip_h",false,0)
		if direction == -1:
			the_boss.play("default")
			tween.tween_property(the_boss,"flip_h",true,0)


	move_and_slide()
