@tool
class_name Buble_lights
extends Sprite2D

@onready var point_light_2d: PointLight2D = $PointLight2D
@export var first_frame_time:float = 0.5
@export var second_frame_time:float = 0.5
@export var third_frame_time:float = 0.5
@export var fourth_frame_time:float = 0.5
@export_range(0,3) var highest_at_which_frame:int = 1

func _ready() -> void:
	animate()

func animate():
	if highest_at_which_frame == 0:
		point_light_2d.energy = 2
	else:
		point_light_2d.energy = 1
	frame = 0
	await get_tree().create_timer(first_frame_time).timeout
	if highest_at_which_frame == 1:
		point_light_2d.energy = 2
	else:
		point_light_2d.energy = 1
	frame = 1
	await get_tree().create_timer(second_frame_time).timeout
	if highest_at_which_frame == 2:
		point_light_2d.energy = 2
	else:
		point_light_2d.energy = 1
	frame = 2
	await get_tree().create_timer(third_frame_time).timeout
	if highest_at_which_frame == 3:
		point_light_2d.energy = 2
	else:
		point_light_2d.energy = 1
	frame = 3
	await get_tree().create_timer(fourth_frame_time).timeout

	animate()
