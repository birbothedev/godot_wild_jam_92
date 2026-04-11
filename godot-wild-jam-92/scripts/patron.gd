extends CharacterBody2D

@export var speed = 50
var target_position : Vector2

func _ready():
	target_position = get_random_target_position()

func _physics_process(_delta):
	var collision = move_and_collide(velocity * _delta)
	if collision:
		velocity = velocity.bounce((collision.get_normal()))

	if global_position.distance_to(target_position) < 10:
		target_position = get_random_target_position()
	var direction = global_position.direction_to(target_position)
	velocity = direction * speed
	move_and_slide()

func get_random_target_position():
	var screen_size = get_viewport().size
	var extra = screen_size * 1.2
	
	return Vector2(
		randf_range(screen_size.x - extra.x, screen_size.x + extra.x),
		randf_range(screen_size.y - extra.y, screen_size.y + extra.y)
	)
