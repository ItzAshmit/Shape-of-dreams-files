extends Node


#-------  Global_variables  -------

#For Player
var is_main_body:bool = true
var main_player_HP:float = 100.0
var player_melee_attack:float = 20.0
var player_position:Vector2
var is_player_for_teleporter:bool = false
#For Player

func _process(_delta: float) -> void:
	main_player_HP = clamp(main_player_HP,0,100)
	
