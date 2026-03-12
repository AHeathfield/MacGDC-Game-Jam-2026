class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var sprite: Sprite2D
@export var SPEED := 900
@export var SPRINT_MULT := 1.3

var direction: Vector2 = Vector2.ZERO
var is_sprinting: bool = false

func update(_delta: float) -> void:
	if body == null:
		return
	
	# Top Down movement
	if is_sprinting:
		body.velocity = direction * SPEED * SPRINT_MULT
	else:
		body.velocity = direction * SPEED

	
	body.move_and_slide()
	
	# Face movement direction
