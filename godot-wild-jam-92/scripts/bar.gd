extends Area2D

var patron_safe_for_counting = false

func mark_safe_for_counting(body):
	body.patron_safe_for_counting = true

func _on_body_entered(body: Node2D) -> void:
	if body.patron_safe_for_counting == true:
		GameManager.change_bar_money_amount(1)
		body.call_deferred("queue_free")

func _on_safe_for_counting_body_exited(body: Node2D) -> void:
	mark_safe_for_counting(body)
