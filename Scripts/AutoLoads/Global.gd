extends Node


#-------  Global_variables  -------

#For Player
var is_main_body:bool = true
var main_player_HP:float = 100.0
var player_melee_attack:float = 20.0
var player_position:Vector2
<<<<<<< HEAD
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
var is_player_for_teleporter:bool = false

var has_power_to_dash:bool = false
var has_power_to_change_form:bool = false
var has_power_to_attack:bool = false
var can_move:bool = true
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
=======
>>>>>>> parent of dda01e1 (Physics engine changed)
#For Player




func _process(_delta: float) -> void:
	main_player_HP = clamp(main_player_HP,0,100)
	
