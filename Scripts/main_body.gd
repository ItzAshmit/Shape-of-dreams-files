extends CharacterBody2D
@onready var the_boss: Node2D = $"body parts"
@onready var cape: AnimatedSprite2D = $"body parts/cape"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var particles: CPUParticles2D = $"CPUParticles2D"
@onready var particles_2: CPUParticles2D = $CPUParticles2D2
@onready var the_roatted_aura: Sprite2D = $"body parts/elbow/hand/Node2D/the roatted aura"

var can_dash:bool = true
var animation_played:bool
var animation_played_2:bool = true
var is_walking:bool
var SPEED:float = 600.0
const JUMP_VELOCITY:float = -750.0
const SKEW_CHANGE:float = 100

func _ready() -> void:
	cape.frame = 1
	$"body parts/AnimatedSprite2D".frame = 6
	particles.emitting = false
	particles_2.visible = false
func _physics_process(delta: float) -> void:
	if Global.is_main_body:
		var direction := Input.get_axis("left", "right")
		
		
		
		
		
		
###############DASHHHH---
		if Input.is_action_just_pressed("dash"):
			if can_dash:
				if direction:
					particles_2.modulate = Color(1,1,1,1)
					cape.speed_scale = 2.0
					particles_2.visible = true
					particles_2.initial_velocity_max = 1000
					if direction == 1:
						the_boss.skew = 0.05
						SPEED = 6000
						can_dash = false
						$Timer.start()
					if direction == -1:
						the_boss.skew = -0.05
						SPEED = 6000
						can_dash = false
						$Timer.start()
						
						
###############attacking---
		if Input.is_action_just_pressed("attack"):
			randomize()
			print("attacked")
			var random_chance:float = randf()
			if random_chance <= 0.334:
				animation_player.play("attacking")
			elif random_chance <= 0.668:
				animation_player.play("attacking_2")
			else:
				animation_player.play("attacking_3")
			var bodies_in_range = $"body parts/Area2D".get_overlapping_bodies()
			for i in bodies_in_range:
				if i.has_method("taking_damage"):
					i.taking_damage(Global.player_melee_attack)
			Global.melee_attacked = true
			await get_tree().create_timer(0.5).timeout
			Global.melee_attacked = false
				
						
						
						
###############MOVEMENT---
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
			
			
		# Add the gravity.
		var tween = get_tree().create_tween()
		if not is_on_floor():
			velocity += get_gravity() * delta
			
			
		if direction:
			tween.tween_property(the_boss,"scale",Vector2(1 * direction,the_boss.scale.y),0.2).set_trans(Tween.TRANS_QUAD)
			tween.tween_property(the_boss,"rotation",0.1 * direction,0.5)
			particles.emitting = true
			particles.gravity.x = 1000.0 * direction

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
			particles.emitting = false 
			is_walking = false
			if not is_walking and not animation_played:
				cape.play_backwards("the aura starts")
				animation_played = true
				animation_played_2=true
				
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		Global.player_position = global_position




func _on_animated_sprite_2d_animation_finished() -> void:
		if is_walking:
			cape.play("aura farming with cape")


func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	SPEED = 600
	$"body parts/cape".speed_scale = 1.0
	tween.tween_property(particles_2,"modulate",Color(1,1,1,0),0.5)
	tween.tween_property(the_boss,"skew",0,0.5)
	await get_tree().create_timer(1,false).timeout
	can_dash = true
	particles_2.initial_velocity_max = 0




func _on_health_is_player_dead() -> void:
	pass
