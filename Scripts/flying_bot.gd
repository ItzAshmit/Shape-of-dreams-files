extends CharacterBody2D

var is_dead:bool
var SPEED = 2
var direction:float = 1


	
func _physics_process(delta: float) -> void:
	if not is_dead:
		if $Area2D.has_overlapping_bodies() or $Area2D2.has_overlapping_bodies():
			atttttttackkkkk()
		if not is_on_floor():
			velocity += (get_gravity() * delta)/6
			velocity.x += SPEED * direction
		if $RayCast2D2.is_colliding() or is_on_floor():
			velocity.y += -5
		if $RayCast2D.is_colliding():
			$"../AnimationPlayer".play("Flyer_bot_attack_cage")
			velocity.x = 0
			velocity.y = 0
		move_and_slide()

func atttttttackkkkk():
	Global.main_player_HP -= 2.5
	



func _on_area_2d_body_exited(_body: Node2D) -> void:
	randomize()
	direction *= -1
	velocity.x = SPEED * direction
	velocity.y = randf_range(100 * 0.5, -100 * 0.2)


func taking_damage(damage: int) -> void:
	self.modulate = Color(1.0, 0.0, 0.0, 1.0)
	$"../Health".HP -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.5)



func _on_health_dead() -> void:
	is_dead = true
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(0.0, 0.0, 0.0, 1.0),0.2)
	$CollisionShape2D.disabled = true
