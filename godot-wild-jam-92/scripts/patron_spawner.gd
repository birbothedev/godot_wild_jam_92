extends Node2D

@onready var patron = preload("res://scenes/patron.tscn")
@onready var handler = $"../Patron Handler"

var spawn_locations
var spawn_locations_storage
var chosen_spawn
var spawn_audio

func _ready() -> void:
	spawn_locations = get_tree().get_nodes_in_group("patron_spawns")
	
	refill_spawn_locations()
	get_random_spawn_location()

func _on_timer_timeout() -> void:
	if !GameManager.game_paused_for_buying:
		get_random_spawn_location()
		# spawn a new patron everytime the timer runs out
		var pat = patron.instantiate()
		pat.name = "Patron"
		pat.global_position = chosen_spawn 
		pat.z_index = 0
		handler.add_child(pat) 
	
func get_random_spawn_location():
	if spawn_locations_storage.is_empty():
		refill_spawn_locations()
	var marker = spawn_locations_storage.pop_front()
	chosen_spawn = marker.global_position

func refill_spawn_locations():
	spawn_locations_storage = spawn_locations.duplicate()
	spawn_locations_storage.shuffle()
