extends CharacterBody2D

@export var speed = 50
var target_position : Vector2
var patron_target_locations
var temp_positions_array
var current_position
var hit_with_juice = false

func _ready():
	patron_target_locations = get_tree().get_nodes_in_group("reg_patrons")
	get_random_target_position()
	
	var direction = global_position.direction_to(target_position)
	velocity = direction * speed

func _physics_process(_delta):
	var direction = global_position.direction_to(target_position)
	
	var collision = move_and_collide(velocity * _delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
	if global_position.distance_to(target_position) < 5:
		get_random_target_position()
	
	if GameManager.game_paused_for_buying:
		queue_free()

func get_random_target_position():
	# get the first position in the array and delete it
	var marker = patron_target_locations.pick_random()
	target_position = marker.global_position

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	GameManager.remove_reputation_from_bar()
	queue_free()

func _on_juice_detection_body_entered(body: Node2D) -> void:
	print("hit with juice")
	hit_with_juice = true
	apply_knockback(body.get_parent().global_position, 150.0)
	body.queue_free()

# Inside the enemy script (e.g., CharacterBody2D)
func apply_knockback(attacker_position: Vector2, force: float):
	# Calculate direction from attacker to enemy
	var knockback_dir = global_position.direction_to(attacker_position)
	knockback_dir = -knockback_dir 
	# Apply force (velocity)
	velocity = knockback_dir * force
	# Call move_and_slide() in _physics_process to apply
	move_and_slide() 
