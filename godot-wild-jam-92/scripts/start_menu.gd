extends Node2D

var welcome_screen
var start_screen
var credits_screen
var text_input

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	welcome_screen = $"Welcome Screen"
	start_screen = $"Start Menu Screen"
	credits_screen = $"Credits Screen"
	text_input = $"Welcome Screen/LineEdit"
	start_screen.show()
	credits_screen.hide()
	welcome_screen.hide()

func _on_start_pressed() -> void:
	start_screen.hide()
	welcome_screen.show()
	credits_screen.hide()

func _on_credits_pressed() -> void:
	credits_screen.show()
	start_screen.hide()
	welcome_screen.hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_start_game_pressed() -> void:
	credits_screen.hide()
	start_screen.hide()
	welcome_screen.hide()
	GameManager.go_to_main_screen()

func _on_back_pressed() -> void:
	credits_screen.hide()
	start_screen.show()
	welcome_screen.hide()

func _on_line_edit_text_changed(new_text: String) -> void:
	GameManager.bar_name_input = new_text
