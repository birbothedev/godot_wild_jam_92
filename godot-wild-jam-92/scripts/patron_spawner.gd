extends Node2D

@onready var patron = preload("res://scenes/patron.tscn")
@onready var handler = $"../Patron Handler"

func _on_timer_timeout() -> void:
	if !GameManager.game_paused_for_buying:
		# spawn a new patron everytime the timer runs out
		var pat = patron.instantiate()
		pat.name = "Patron"
		pat.global_position = global_position 
		pat.z_index = 0
		handler.add_child(pat) 
