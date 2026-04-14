extends Node

var main_game_scene = preload("res://scenes/main.tscn")
var buy_screen = preload("res://scenes/buy_screen.tscn")
var game_over_screen = preload("res://scenes/game_over.tscn")
var start_game_screen = preload("res://scenes/start_menu.tscn")

var rep_counter_bar
var money_counter_label
var berry_count_label

var bar_reputation_value = 100
var max_reputation = 100
var bar_money_value = 0
var player_berry_count = 0

var game_paused_for_buying = false

var day = 1
var hour = 20
var minutes = 0
var timer = 0

func _process(delta: float) -> void:
	if bar_reputation_value == 0:
		get_tree().change_scene_to_packed(game_over_screen)

func init_ui():
	if rep_counter_bar:
		rep_counter_bar.value = bar_reputation_value

	if money_counter_label:
		money_counter_label.text = str(bar_money_value)
	
	if berry_count_label:
		berry_count_label.text = str(player_berry_count)

func change_bar_reputation(amount):
	bar_reputation_value += amount
	if bar_reputation_value > max_reputation:
		bar_reputation_value = max_reputation
	rep_counter_bar.value = bar_reputation_value

func change_bar_money_amount(amount):
	bar_money_value += amount
	money_counter_label.text = str(bar_money_value)

func change_player_berry_count(amount):
	player_berry_count += amount
	berry_count_label.text = str(player_berry_count)

func go_to_buy_screen():
	get_tree().change_scene_to_packed(buy_screen)
	game_paused_for_buying = false

func go_to_main_screen():
	get_tree().change_scene_to_packed(main_game_scene)
	game_paused_for_buying = false
