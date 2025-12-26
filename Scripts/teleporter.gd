extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("I_am_player"):
		Global.is_player_for_teleporter = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("I_am_player"):
		Global.is_player_for_teleporter = false
