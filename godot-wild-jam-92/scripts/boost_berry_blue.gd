extends Area2D

var ui_handler

func _ready() -> void:
	ui_handler = $"../../UI Handler"

func _on_body_entered(body: Node2D) -> void:
	GameManager.change_player_blue_berry_count(1)
	GameManager.change_player_ammo_count(2)
	ui_handler.update_ammo_progress_bar()
	queue_free()
