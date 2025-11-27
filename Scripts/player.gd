extends Node2D

@onready var small_form: CharacterBody2D = $small_form
@onready var main_body: CharacterBody2D = $main_body

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if Global.is_main_body:
		if Input.is_action_just_pressed("Change_shape"):
			small_form.global_position = main_body.global_position
			small_form.z_index = 1
			small_form.visible = true
			$small_form/CollisionShape2D.disabled = false
			$small_form/Camera2D2.enabled = true
			main_body.visible = false
			$main_body/CollisionShape2D.disabled = true
			$main_body/Camera2D.enabled = false
			await get_tree().create_timer(0.1).timeout
			Global.is_main_body = false
		
	if not Global.is_main_body:
		if Input.is_action_just_pressed("Change_shape"):
			main_body.global_position = small_form.global_position
			small_form.visible = false
			$small_form/CollisionShape2D.disabled = true
			$small_form/Camera2D2.enabled = false
			main_body.visible = true
			$main_body/CollisionShape2D.disabled = false
			$main_body/Camera2D.enabled = true
			Global.is_main_body = true
			await get_tree().create_timer(0.1).timeout
			Global.is_main_body = true
