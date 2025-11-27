extends CharacterBody2D

@onready var mesh_instance_2d: MeshInstance2D = $MeshInstance2D

const SPEED = 400.0
const JUMP_VELOCITY = -800.0
var direction_global = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		mesh_instance_2d.rotation += 1 * direction_global
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	direction_global = direction
	if direction:
		mesh_instance_2d.rotation += 0.2 * direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
