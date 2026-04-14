extends Node

var main_game_scene = preload("res://scenes/main_game.tscn")
var buy_screen = preload("res://scenes/buy_screen.tscn")
var game_over_screen = preload("res://scenes/game_over.tscn")
var start_game_screen = preload("res://scenes/start_menu.tscn")

var bar_name_input
var bar_name_label
var rep_counter_bar
var money_counter_label
var blue_berry_count_label
var red_berry_count_label

var bar_reputation_value = 100
var max_reputation = 100
var bar_money_value = 0
var player_berry_blue_count = 0
var player_berry_red_count = 0

var game_paused_for_buying = false

var day = 1
var hour = 20
var minutes = 0
var timer = 0

var hypnotize_purchased = false

var player_ammo_count = 50
var max_ammo_count = 50

func _process(delta: float) -> void:
	if bar_reputation_value == 0:
		get_tree().change_scene_to_packed(game_over_screen)

func init_ui():
	if rep_counter_bar:
		rep_counter_bar.value = bar_reputation_value

	if money_counter_label:
		money_counter_label.text = str(bar_money_value)
	
	if blue_berry_count_label:
		blue_berry_count_label.text = str(player_berry_blue_count)
	
	if red_berry_count_label:
		red_berry_count_label.text = str(player_berry_red_count)
	
	if bar_name_label:
		print("bar label found")
		bar_name_label.text = str(bar_name_input)

func change_bar_reputation(amount):
	bar_reputation_value += amount
	if bar_reputation_value > max_reputation:
		bar_reputation_value = max_reputation
	rep_counter_bar.value = bar_reputation_value

func change_bar_money_amount(amount):
	bar_money_value += amount
	money_counter_label.text = str(bar_money_value)

func change_player_blue_berry_count(amount):
	player_berry_blue_count += amount
	blue_berry_count_label.text = str(player_berry_blue_count)

func change_player_red_berry_count(amount):
	player_berry_red_count += amount
	red_berry_count_label.text = str(player_berry_red_count)

func go_to_buy_screen():
	get_tree().change_scene_to_packed(buy_screen)
	game_paused_for_buying = false

func go_to_main_screen():
	get_tree().change_scene_to_packed(main_game_scene)
	game_paused_for_buying = false

func reset_game():
	bar_reputation_value = 100
	max_reputation = 100
	bar_money_value = 0
	player_berry_blue_count = 0
	player_berry_blue_count = 0

	game_paused_for_buying = false

	day = 1
	hour = 20
	minutes = 0
	timer = 0
	
	hypnotize_purchased = false
	
	reset_ammo_count()

func reset_ammo_count():
	player_ammo_count = max_ammo_count

func change_player_ammo_count(amount):
	player_ammo_count += amount
