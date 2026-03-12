class_name InputComponent extends Node

var move_direction: Vector2 = Vector2.ZERO
var sprint_held := false
var heal_pressed := false
var hurt_pressed := false

func update() -> void:
	move_direction = Input.get_vector("left", "right", "up", "down")
	sprint_held = Input.is_action_pressed("sprint")
	heal_pressed = Input.is_action_just_pressed("heal")
	hurt_pressed = Input.is_action_just_pressed("hurt")
