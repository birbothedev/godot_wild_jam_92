extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GameManager.change_player_red_berry_count(1)
	queue_free()
