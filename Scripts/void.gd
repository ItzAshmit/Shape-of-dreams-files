extends Area2D

func kill_body(body):
	print("hellllo")
	if body.has_method("I_am_player"):
		Global.main_player_HP -= 1000
	else:
		body.queue_free()

func _on_body_exited(body: Node2D) -> void:
	kill_body(body)


func _on_body_entered(body: Node2D) -> void:
	kill_body(body)
