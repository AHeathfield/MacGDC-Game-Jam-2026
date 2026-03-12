class_name Player extends CharacterBody2D

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var health_component: HealthComponent = %HealthComponent

func _ready() -> void:
	health_component.died.connect(_on_died)

func _physics_process(delta: float) -> void:
	# Read Controls
	input_component.update()
	
	# Apply movement
	movement_component.direction = input_component.move_direction
	movement_component.is_sprinting = input_component.sprint_held
	movement_component.update(delta)
	
	# Update health
	if input_component.heal_pressed:
		health_component.heal(10)
	if input_component.hurt_pressed:
		health_component.damage(10)

func _on_died() -> void:
	print("Player died")
	queue_free()
