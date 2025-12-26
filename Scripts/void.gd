extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("I_am_player"):
		print("implayer")
		Global.main_player_HP -= 100
	else:
		body.queue_free()
