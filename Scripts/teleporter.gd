extends Node2D


				
	


func _on_area_2d_body_exited(_body: Node2D) -> void:
		var bodies = $Area2D.get_overlapping_bodies()
		for i in bodies:
			if i.has_method("I_am_player") and not Global.is_main_body:
				Global.is_player_for_teleporter = false


func _on_area_2d_body_entered(_body: Node2D) -> void:
		var bodies = $Area2D.get_overlapping_bodies()
		for i in bodies:
			if i.has_method("I_am_player") and not Global.is_main_body:
				Global.is_player_for_teleporter = true
