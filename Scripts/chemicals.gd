extends Node
var empty_bottles:int
var filled_bottles:int
func _process(delta: float) -> void:
	for i in range(21):
		if i % 2 == 0:
			empty_bottles = i
			for iii in Global.chemicals_consumed:
				if i/2 == iii:
					get_child(i).visible = false
		else:
			filled_bottles = i

				
