extends CharacterBody2D
@onready var character_body_2d_2: CharacterBody2D = $"."
@onready var collision_shape_2d_2: CollisionShape2D = $"../CollisionShape2D2"
@onready var collision_shape_2d: CollisionShape2D = $"../CollisionShape2D"



const SPEED = 1000.0
const JUMP_VELOCITY = -500.0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Change_shape"):
		if Global.if_is_ball:
			Global.if_is_ball = false
			character_body_2d_2.visible = true
			self.visible = false
			collision_shape_2d.disabled = true
			collision_shape_2d_2.disabled = true
		else:
			character_body_2d_2.visible = false
			self.visible = true
			collision_shape_2d.disabled = false
			collision_shape_2d_2.disabled = false
		
func _physics_process(delta: float) -> void:
	if Global.if_is_ball:
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
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
