extends Control

var start_game_screen = preload("res://scenes/start_menu.tscn")

func _ready() -> void:
	hide()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	show()
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func _input(event):
	if Input.is_action_just_pressed("escape"):
		if get_tree().paused == false:
			pause()
		else:
			resume()

func _on_resume_pressed() -> void:
	resume()
	hide()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_packed(start_game_screen)
