extends CharacterBody2D

var is_dead:bool = false
var SPEED = -500.0


func _physics_process(delta: float) -> void:
	if not is_dead:
		if not is_on_floor():
			velocity += get_gravity() * delta
		else:
			velocity.x += SPEED * delta
		if is_on_wall():
			SPEED = SPEED * -1
			scale.x = scale.x * -1
		move_and_slide()
		
func _on_health_dead() -> void:
	is_dead = true
	$Area2D.monitorable = false
	$Area2D.monitoring = false
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(0.0, 0.0, 0.0, 1.0),0.2)
	$CollisionShape2D.disabled = true
func taking_damage(damage: int) -> void:
	$"../Health".HP =- damage
	print($"../Health".HP)






func _on_area_2d_body_entered(body: Node2D) -> void:
	print("damaged")
	Global.main_player_HP -= 5
	print(Global.main_player_HP)
