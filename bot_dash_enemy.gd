extends CharacterBody2D

var is_dead:bool = false
var SPEED = -300.0
var speed_increased:bool = false
var is_angered:bool
func _physics_process(delta: float) -> void:
	if not is_dead:
		if not is_on_floor():
			velocity += get_gravity() * delta
		else:
			velocity.x += SPEED * delta
		if is_on_wall():
			SPEED = SPEED * -1
			scale.x = scale.x * -1
		if $RayCast2D.is_colliding():
			if not speed_increased:
				SPEED = SPEED * 20
				var tween = get_tree().create_tween()
				tween.tween_property(self,"modulate",Color(1.0, 0.0, 0.0, 1.0),0.1)
				is_angered = true
				speed_increased = true
				$"../Timer".start()
		move_and_slide()

func _on_timer_timeout() -> void:
	SPEED = SPEED / 20
	var tween = get_tree().create_tween()
	is_angered = false
	tween.tween_property(self,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.5)
	speed_increased = false




func _on_area_2d_body_entered(_body: Node2D) -> void:
	if is_angered:
		Global.main_player_HP -= 10
		Engine.time_scale = 0.0
		await get_tree().create_timer(0.1,true,false,true).timeout
		Engine.time_scale = 1.0
		print(Global.main_player_HP)




func _on_health_dead() -> void:
	is_dead = true
	var tween = get_tree().create_tween()
	tween.tween_property($PointLight2D,"color",Color(0.0, 0.0, 0.0, 1.0),0.2)
	tween.tween_property(self,"modulate",Color(0.0, 0.0, 0.0, 1.0),0.2)
	$CollisionShape2D.disabled = true



func taking_damage(damage: int) -> void:
	$"../Health".HP -= damage
	print($"../Health".HP)
