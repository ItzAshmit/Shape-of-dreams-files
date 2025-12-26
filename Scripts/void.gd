extends Area2D

<<<<<<< HEAD
func kill_body(body):
	if body.has_method("I_am_player"):
		Global.main_player_HP -= 1000
	else:
		body.queue_free()

func _on_body_exited(body: Node2D) -> void:
	kill_body(body)
=======
>>>>>>> parent of dda01e1 (Physics engine changed)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("I_am_player"):
		print("implayer")
		Global.main_player_HP -= 100
	else:
		body.queue_free()
