@tool
extends Node

@onready var label: Label = $Label
@export_multiline var text:String 
var texted:bool
func _process(delta: float) -> void:
		label.text = text
		texted = false
