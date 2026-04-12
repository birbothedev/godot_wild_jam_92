extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GameManager.change_player_berry_count(1)
	print(GameManager.player_berry_count)
	queue_free()

func _on_despawn_timer_timeout() -> void:
	queue_free()
