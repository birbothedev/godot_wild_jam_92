extends CharacterBody2D

@export var speed = 400
var AMMO_COUNT = 50
var MAX_AMMO_COUNT = 50
var screen_size
var sprite_size
var ui_handler 
var juice_path = preload("res://scenes/squirt_gun_juice.tscn")

func _ready() -> void:
	reset_ammo_count()
	ui_handler = $"../UI Handler"
	screen_size = get_viewport_rect().size
	sprite_size = $Sprite2D.texture.get_size()

func _physics_process(delta):
	look_at(get_global_mouse_position())
	get_input()
	# prevent movement outside screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)   
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_just_pressed("left mouse click"):
		if AMMO_COUNT >= 1:
			fire()
			ui_handler.update_ammo_progress_bar()
		else:
			print("no ammo")

func fire():
	AMMO_COUNT -= 1
	var juice = juice_path.instantiate()
	juice.dir = rotation
	juice.pos = $"SQ Firing Position".global_position
	juice.rot = global_rotation
	get_parent().add_child(juice)

func reset_ammo_count():
	AMMO_COUNT = MAX_AMMO_COUNT
