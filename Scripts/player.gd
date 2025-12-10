extends Node2D

@onready var small_form: CharacterBody2D = $small_form
@onready var main_body: CharacterBody2D = $main_body
var is_in_area:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	small_form.modulate = Color(1,1,1,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _input(_event: InputEvent) -> void:
	if Global.is_main_body:
		if Input.is_action_just_pressed("Change_shape"):
			var tween = get_tree().create_tween()
			tween.tween_property(small_form,"modulate",Color(1,1,1,1),0.5)
			small_form.visible = true
			tween.tween_property(main_body,"modulate",Color(0,0,0,0.5),0.5)
			small_form.global_position = main_body.global_position + Vector2(-1.5,-60)
			$small_form/CollisionShape2D.disabled = false
			$small_form/Camera2D2.enabled = true
			$main_body/CPUParticles2D2.amount = 10
			$main_body/CollisionShape2D.disabled = true
			$main_body/Camera2D.enabled = false
			await get_tree().create_timer(0.1).timeout
			Global.is_main_body = false
	if not Global.is_main_body:
		if is_in_area:
			if Input.is_action_just_pressed("Change_shape"):
				var tween = get_tree().create_tween()
				tween.tween_property(main_body,"modulate",Color(1,1,1,1),0.2)
				tween.tween_property(small_form,"modulate",Color(1,1,1,0),0.2)
				small_form.visible = false
				main_body.global_position = small_form.global_position + Vector2(0,-75)
				$main_body/CPUParticles2D2.amount = 100
				$small_form/CollisionShape2D.disabled = true
				$small_form/Camera2D2.enabled = false
				$main_body/CollisionShape2D.disabled = false
				$main_body/Camera2D.enabled = true
				await get_tree().create_timer(0.1).timeout
				Global.is_main_body = true



func _on_area_2d_body_entered(body: Node2D) -> void:
	var tween = get_tree().create_tween()
	is_in_area = true
	tween.tween_property(body,"modulate",Color(1,1,1,0.5),0.3).set_trans(Tween.TRANS_CIRC)
	await get_tree().create_timer(0.5,false).timeout
	tween.kill()


func _on_area_2d_body_exited(body: Node2D) -> void:
	var tween = get_tree().create_tween()
	is_in_area = false
	tween.tween_property(body,"modulate",Color(1,1,1,1),0.3).set_trans(Tween.TRANS_CIRC)
	await get_tree().create_timer(0.5,false).timeout
	tween.kill()
