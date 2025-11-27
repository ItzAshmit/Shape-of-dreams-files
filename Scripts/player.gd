extends CharacterBody2D
@onready var the_boss: Node2D = $"body parts"
@onready var cape: AnimatedSprite2D = $"body parts/cape"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var particles: CPUParticles2D = $"CPUParticles2D"
@onready var particles_2: CPUParticles2D = $CPUParticles2D2
@onready var the_roatted_aura: Sprite2D = $"body parts/elbow/hand/the roatted aura"



var animation_played:bool
var animation_played_2:bool = true
var is_walking:bool
const SPEED:float = 600.0
const JUMP_VELOCITY:float = -750.0
const SKEW_CHANGE:float = 100
func _ready() -> void:
	cape.frame = 1
	particles.emitting = false
func _physics_process(delta: float) -> void:
	if Global.is_main_body:
		# Add the gravity.
		var tween = get_tree().create_tween()
		if not is_on_floor():
			particles_2.emitting = true
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			if direction == -1:
				particles_2.emitting = true
				tween.tween_property(the_boss,"scale",Vector2(-1,the_boss.scale.y),0.2).set_trans(Tween.TRANS_QUAD)
				tween.tween_property(the_boss,"rotation",-0.1,0.5)
				particles.emitting = true
				particles.gravity.x = -1000.0
			if direction == 1:
				particles_2.emitting = true
				tween.tween_property(the_boss,"scale",Vector2(1,the_boss.scale.y),0.2).set_trans(Tween.TRANS_QUAD)
				tween.tween_property(the_boss,"rotation",0.1,0.5)
				particles.emitting = true
				particles.gravity.x = 1000.0
			if animation_played_2:
				cape.play("the aura starts")
				is_walking = true
				animation_played_2=false
			velocity.x = direction * SPEED
			the_roatted_aura.skew += velocity.x * (velocity.y + 1)/10000
			the_roatted_aura.rotation += velocity.x * (velocity.y + 1)/10000
			animation_played = false
			
		else:
			tween.tween_property(the_boss,"rotation",0,0.5)
			particles.gravity.x = 0
			particles_2.emitting = false
			particles.emitting = false 
			is_walking = false
			if not is_walking and not animation_played:
				cape.play_backwards("the aura starts")
				animation_played = true
				animation_played_2=true
				
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		
func _on_animated_sprite_2d_animation_finished() -> void:
		if is_walking:
			cape.play("aura farming with cape")
func _input(_event: InputEvent) -> void:
	if Global.is_main_body:
		if Input.is_action_just_pressed("Change_shape"):
			self.visible = false
			$Camera2D.enabled = false
			$CollisionShape2D.disabled = true
			$"../CharacterBody2D2".visible = true
			$"../CharacterBody2D2/CollisionShape2D".disabled = false
			$"../CharacterBody2D2/Camera2D2".enabled = true
			await get_tree().process_frame
			Global.is_main_body = false
