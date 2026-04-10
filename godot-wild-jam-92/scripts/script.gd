extends CharacterBody2D

# exporting a var adds it as a changable option in the inspector
@export var speed = 400
#@export var rotation_speed = 1.5

#var juice_path = preload("res://scenes/squirt_gun_juice.tscn")
#var rotation_direction = 0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	print("key clicked")
	print(input_direction)
	velocity = input_direction * speed
	
	#if Input.is_action_just_pressed("left mouse click"):
		#fire()

#func fire():
	#var juice = juice_path.instantiate()
	#juice.dir = rotation
	#juice.pos = $"SQ Firing Position".global_position
	#juice.rot = global_rotation
	#get_parent().add_child(juice)

func _physics_process(delta):
	#look_at(get_global_mouse_position())
	get_input()
	move_and_slide()
