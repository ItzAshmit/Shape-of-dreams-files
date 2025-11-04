extends Node2D
@onready var circle: CharacterBody2D = $Circle
@onready var rectangle: CharacterBody2D = $rectangle
@onready var triangle: CharacterBody2D = $Triangle
@onready var small_circle: CharacterBody2D = $small_circle








var current_shape = 0
var changing_order = []


func _ready() -> void:
	await get_tree().process_frame
	changing_order = [circle,rectangle,triangle,small_circle]
	var current_index = changing_order[current_shape]
	current_index.velocity = Vector2.ZERO
	current_index.visible = true
	if current_shape != 2:
		current_index.get_node("CollisionShape2D").disabled = false
	else:
		current_index.get_node("CollisionPolygon2D").disabled = false
	for i in changing_order:
			if i != current_index:
				if i != triangle:
					i.get_node("CollisionShape2D").disabled = true
				else:
					i.get_node("CollisionPolygon2D").disabled = true
				i.visible = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Change_shape"):
		var prev_position = changing_order[current_shape].position
		current_shape += 1
		if current_shape >= len(changing_order):
			current_shape = 0
		var current_index = changing_order[current_shape]
		current_index.velocity = Vector2.ZERO
		current_index.visible = true
		if current_shape != 2:
			current_index.get_node("CollisionShape2D").disabled = false
			current_index.get_node("Camera2D").enabled = true
		else:
			current_index.get_node("CollisionPolygon2D").disabled = false
			current_index.get_node("Camera2D").enabled = true
		current_index.position = prev_position
		for i in changing_order:
			if i != current_index:
				if i != triangle:
					i.get_node("CollisionShape2D").disabled = true
					i.get_node("Camera2D").enabled = false
				else:
					i.get_node("CollisionPolygon2D").disabled = true
					i.get_node("Camera2D").enabled = false
				i.visible = false
