extends Node2D

@onready var patron = preload("res://scenes/patron.tscn")

var patron_array = []

func _on_timer_timeout() -> void:
	# spawn a new patron everytime the timer runs out
	var pat = patron.instantiate()
	var handler = get_parent().get_node("Patron Handler")
	handler.add_child(pat) 
	pat.global_position = global_position 
	
	patron_array.insert(0, pat)
	print("spawning patron")
	print("Spawner global:", global_position)
	print("Patron global:", pat.global_position)
