extends CharacterBody2D

@export var speed = 35
var target_position : Vector2
var patron_target_locations
var temp_positions_array
var current_position
var hit_with_juice = false
var player
var is_hypnotized = false
var bar
var patron_sprite

func _ready():
	player = $"../../Player"
	bar = $"../../Bar"
	patron_sprite = $AnimatedSprite2D
	patron_target_locations = get_tree().get_nodes_in_group("reg_patrons")
	get_random_target_position()
	
	var direction = global_position.direction_to(target_position)
	velocity = direction * speed

func _physics_process(_delta):
	if !is_hypnotized:
		var direction = global_position.direction_to(target_position)
		var collision = move_and_collide(velocity * _delta)
		if collision:
			velocity = velocity.bounce(collision.get_normal())

		if global_position.distance_to(target_position) < 5:
			get_random_target_position()
	else:
		hypnotize_patron()
	
	if GameManager.game_paused_for_buying:
		queue_free()
	
	$AnimatedSprite2D.play("walk")
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

func get_random_target_position():
	var marker = patron_target_locations.pick_random()
	target_position = marker.global_position

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	GameManager.change_bar_reputation(-1)
	queue_free()

func _on_juice_detection_body_entered(body: Node2D) -> void:
	if GameManager.hypnotize_purchased:
		is_hypnotized = true
		patron_sprite.modulate = Color.PURPLE
		
	hit_with_juice = true
	apply_knockback(player.global_position, 100.0)
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

func hypnotize_patron():
	var direction = global_position.direction_to(bar.global_position)
	velocity = direction * speed
	move_and_slide()
