extends Node

var main_game_scene = preload("res://scenes/main.tscn")
var buy_screen = preload("res://scenes/buy_screen.tscn")
var game_over_screen = preload("res://scenes/game_over.tscn")
var start_game_screen = preload("res://scenes/start_menu.tscn")

var rep_counter_label
var money_counter_label

var bar_reputation_value = 100
var bar_money_value = 0

var game_paused_for_buying = false

var day = 1
var hour = 20
var minutes = 0
var timer = 0

func _process(delta: float) -> void:
	if bar_reputation_value == 0:
		get_tree().change_scene_to_packed(game_over_screen)

func init_ui():
	if rep_counter_label:
		rep_counter_label.text = str(bar_reputation_value)

	if money_counter_label:
		money_counter_label.text = str(bar_money_value)

func remove_reputation_from_bar():
	bar_reputation_value -= 1
	rep_counter_label.text = str(bar_reputation_value)

func add_money_to_bar():
	bar_money_value += 1
	money_counter_label.text = str(bar_money_value)

func go_to_buy_screen():
	get_tree().change_scene_to_packed(buy_screen)
	game_paused_for_buying = false

func go_to_main_screen():
	get_tree().change_scene_to_packed(main_game_scene)
	game_paused_for_buying = false
