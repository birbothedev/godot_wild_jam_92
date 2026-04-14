extends Node2D

var ammo_progress_bar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ammo_progress_bar = $"Ammo Tracker"
	GameManager.rep_counter_bar = $"Reputation Bar"
	GameManager.money_counter_label = $"TextureRect2/Money Counter"
	GameManager.blue_berry_count_label = $"TextureRect/Blue Berry Counter"
	GameManager.red_berry_count_label = $"TextureRect3/Red Berry Counter"
	update_ammo_progress_bar()
	GameManager.init_ui()

func update_ammo_progress_bar():
	ammo_progress_bar.max_value = GameManager.max_ammo_count
	ammo_progress_bar.value = GameManager.player_ammo_count
