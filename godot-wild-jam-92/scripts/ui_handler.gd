extends Node2D

var ammo_progress_bar
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../Player"
	ammo_progress_bar = $"Ammo Tracker"
	if player:
		update_ammo_progress_bar()
	GameManager.rep_counter_bar = $"Reputation Bar"
	GameManager.money_counter_label = $"Label8/Money Counter"
	GameManager.berry_count_label = $"Label9/Berry Counter"
	GameManager.init_ui()

func update_ammo_progress_bar():
	ammo_progress_bar.max_value = player.MAX_AMMO_COUNT
	ammo_progress_bar.value = player.AMMO_COUNT 
