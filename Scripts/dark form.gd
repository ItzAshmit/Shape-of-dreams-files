extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	if not Global.is_main_body:
		# Add the gravity.
		if not is_on_floor():
			velocity += (get_gravity() * delta)/3

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
func _input(_event: InputEvent) -> void:
	if not Global.is_main_body:
		if Input.is_action_pressed("Change_shape"):
			self.visible = false
			$Camera2D2.enabled = false
			$CollisionShape2D.disabled = true
			$"../CharacterBody2D".visible = true
			$"../CharacterBody2D/CollisionShape2D".disabled = false
			$"../CharacterBody2D/Camera2D".enabled = true
			await get_tree().process_frame
			Global.is_main_body = true
