extends CharacterBody2D

@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Sprite2D3

const SPEED = 800.0
const JUMP_VELOCITY = -500.0


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
		var direction := Input.get_axis("left", "right")
		var tween = get_tree().create_tween()
		if direction:
			velocity.x = direction * SPEED

			tween.tween_property(sprite_2d_2,"position",Vector2(20 * direction,-2),0.5)
			tween.tween_property(sprite_2d_3,"position",Vector2(4 * direction,-2),0.5)
		else:
			tween.kill()
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
		Global.player_position = global_position
