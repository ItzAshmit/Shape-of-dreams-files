class_name Health
extends Node2D
@export_range(0.0,100.0,1) var HP: float
@export var is_player:bool
@export var melee_attcked:bool = false
signal dead
signal is_player_dead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_player:
		if $"../TextureProgressBar":
			$"../TextureProgressBar".value = Global.main_player_HP
			$"../TextureProgressBar".visible = true
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_player:
		if $"../TextureProgressBar":
			$"../TextureProgressBar".value = Global.main_player_HP
	else:
		HP = clamp(HP, 0, 100)
	if HP <= 0:
		emit_signal("dead")
	if Global.main_player_HP <= 0:
		emit_signal("is_player_dead")
