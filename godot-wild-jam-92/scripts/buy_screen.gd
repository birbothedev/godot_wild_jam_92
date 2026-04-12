extends Node2D

@onready var main_game_scene = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_return_pressed() -> void:
	get_tree().change_scene_to_packed(main_game_scene)
	GameManager.hour = 20
