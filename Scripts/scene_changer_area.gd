extends Area2D

var changer:PackedScene = null
@onready var color_rect: ColorRect = $ColorRect
@export var scene_to_change:PackedScene


func _ready() -> void:
	changer = load("scene_to_change")
	color_rect.modulate = Color(0.0, 0.0, 0.0, 0.0)

func _on_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(color_rect,"modulate",Color(0.0, 0.0, 0.0, 1.0),5)
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("changer")
	



func _on_body_exited(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(color_rect,"modulate",Color(0.0, 0.0, 0.0, 0.0),2)
