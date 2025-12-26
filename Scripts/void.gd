extends Area2D

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 24fac24 (hmmm)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
=======
>>>>>>> parent of 24fac24 (hmmm)
>>>>>>> parent of 3239f35 (nononon)
=======
>>>>>>> parent of 28409a8 (i will fix it i hope)
=======
>>>>>>> parent of 24fac24 (hmmm)
func kill_body(body):
	if body.has_method("I_am_player"):
		Global.main_player_HP -= 1000
	else:
		body.queue_free()

func _on_body_exited(body: Node2D) -> void:
	kill_body(body)
<<<<<<< HEAD
=======
>>>>>>> parent of dda01e1 (Physics engine changed)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3239f35 (nononon)
=======
>>>>>>> parent of dda01e1 (Physics engine changed)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 24fac24 (hmmm)
<<<<<<< HEAD
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of 3239f35 (nononon)
=======
>>>>>>> parent of 28409a8 (i will fix it i hope)
=======
>>>>>>> parent of 24fac24 (hmmm)


func _on_body_entered(body: Node2D) -> void:
	kill_body(body)
