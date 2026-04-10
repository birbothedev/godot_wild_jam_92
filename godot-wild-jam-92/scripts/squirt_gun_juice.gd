extends CharacterBody2D

@export var speed = 2000

# position
var pos: Vector2
# rotation 
var rot: float
# direction
var dir: float

func _ready() -> void:
	global_position = pos
	global_rotation = rot

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()
