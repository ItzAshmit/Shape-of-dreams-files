extends CharacterBody2D

var is_dead:bool = false
var direction:int = 1
var SPEED = 500.0
var jump:float = -500
func _physics_process(delta: float) -> void:
	if not is_inside_tree():
		return
	if not is_dead:
		if not is_on_floor():
			if self:
				velocity += get_gravity() * delta
		else:
			velocity.x += SPEED * delta
		if is_on_wall():
			direction *= -1
			SPEED = SPEED * direction
			scale.x = scale.x * -1
		if is_on_wall() and is_on_floor():
			velocity.y = jump
		move_and_slide()
func _on_health_dead() -> void:
	is_dead = true
	$Area2D.monitorable = false
	$Area2D.monitoring = false
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(0.0, 0.0, 0.0, 1.0),0.2)
	$CollisionShape2D.disabled = true
func taking_damage(damage: int) -> void:
	self.modulate = Color(1.0, 0.0, 0.0, 1.0)
	$"../Health".HP -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.5)






func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.main_player_HP -= 1
	body.get_parent().apply_knockback(global_position,1000)






func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	velocity = Vector2.ZERO
	var direction_2 = global_position.direction_to(Global.player_position + Vector2(0,-40)).normalized()
	velocity += (direction_2 * SPEED * direction)

func _on_area_2d_2_body_exited(_body: Node2D) -> void:
	velocity = Vector2.ZERO
	var direction_2 = global_position.direction_to(Global.player_position + Vector2(0,-40)).normalized()
	velocity += (direction_2 * SPEED * direction)
