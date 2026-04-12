extends Node2D

@onready var berry = preload("res://scenes/boost_berry.tscn")
@onready var handler = $"../Berry Handler"

var spawn_locations
var spawn_locations_storage
var chosen_spawn

func _ready() -> void:
	spawn_locations = get_tree().get_nodes_in_group("berry_spawns")
	print(spawn_locations)
	
	refill_spawn_locations()
	get_random_spawn_location()

func _on_timer_timeout() -> void:
	if !GameManager.game_paused_for_buying:
		get_random_spawn_location()
		print("spawning berry")
		# spawn a new berry everytime the timer runs out
		var ber = berry.instantiate()
		if ber:
			print("berry found")
		ber.name = "Berry"
		ber.global_position = chosen_spawn 
		print(chosen_spawn)
		ber.z_index = 0
		handler.add_child(ber) 

func get_random_spawn_location():
	if spawn_locations_storage.is_empty():
		refill_spawn_locations()
	var marker = spawn_locations_storage.pop_front()
	chosen_spawn = marker.global_position
	print(chosen_spawn)

func refill_spawn_locations():
	spawn_locations_storage = spawn_locations.duplicate()
	spawn_locations_storage.shuffle()
