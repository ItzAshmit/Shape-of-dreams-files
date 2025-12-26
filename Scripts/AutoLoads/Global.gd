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
=======
>>>>>>> parent of 24fac24 (hmmm)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
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
=======
>>>>>>> parent of dda01e1 (Physics engine changed)
<<<<<<< HEAD
=======
>>>>>>> parent of 24fac24 (hmmm)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
=======
>>>>>>> parent of ee10735 (wtf is going on)
#For Player




func _process(_delta: float) -> void:
	main_player_HP = clamp(main_player_HP,0,100)
	
