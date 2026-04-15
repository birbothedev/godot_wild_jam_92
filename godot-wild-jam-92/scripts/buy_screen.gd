extends Node2D

var PLUS_REP_COST = 100
var HYPNOTIZE_COST = 100
var BERRY_BOOST_COST = 3
var SPRITZ_AMMO_MULTIPLIER = 5

var brewing_bar
var booster_purchased_count = 0
var added_berry_count = 0
var brewed_ammo_bar
var total_brewed = 0
var spritz_label

var already_brewed = false

var ui_handler

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Brew Button".disabled = false
	$"Purchase Booster".disabled = false
	$"Add Berry Button".disabled = false
	ui_handler = $"UI Handler"
	brewing_bar = $"Brewing Bar"
	brewed_ammo_bar = $"Booster Bar"
	spritz_label = $"Spritz Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_purchase_reputation_pressed() -> void:
	if GameManager.bar_money_value < PLUS_REP_COST:
		return
	GameManager.change_bar_reputation(50)
	GameManager.change_bar_money_amount((PLUS_REP_COST * -1))

func _on_purchase_hypnotize_pressed() -> void:
	if GameManager.bar_money_value < HYPNOTIZE_COST:
		return
	GameManager.change_bar_money_amount((HYPNOTIZE_COST * -1))
	GameManager.hypnotize_purchased = true

func _on_return_to_game_pressed() -> void:
	GameManager.go_to_main_screen()
	GameManager.paused_for_timer = false
	GameManager.hour = 20

func _on_purchase_booster_pressed() -> void:
	if booster_purchased_count <= 10 and GameManager.bar_money_value >= BERRY_BOOST_COST and booster_purchased_count < GameManager.player_berry_red_count:
		booster_purchased_count += 1
		brewing_bar.value += 1
		GameManager.change_bar_money_amount(BERRY_BOOST_COST * -1)
		print(GameManager.bar_money_value)

func _on_add_berry_button_pressed() -> void:
	if added_berry_count <= 10 and added_berry_count <= booster_purchased_count and GameManager.player_berry_red_count > 0:
		added_berry_count += 1
		GameManager.change_player_red_berry_count(-1)
		brewing_bar.value += 1

func _on_brew_button_pressed() -> void:
	var extra = booster_purchased_count - added_berry_count
	total_brewed = ((added_berry_count + booster_purchased_count) - extra) * SPRITZ_AMMO_MULTIPLIER
	print(added_berry_count)
	print(booster_purchased_count)
	print(extra)
	print(total_brewed)
	if !already_brewed and total_brewed > 0:
		if booster_purchased_count != added_berry_count:
			GameManager.change_bar_money_amount((extra * BERRY_BOOST_COST))
		already_brewed = true
		brewed_ammo_bar.value = total_brewed
		spritz_label.text = "+" + str(total_brewed) + " Spritz Added!"
		GameManager.change_player_ammo_count(total_brewed)
		ui_handler.update_ammo_progress_bar()
		$"Purchase Booster".disabled = true
		$"Add Berry Button".disabled = true
		$"Brew Button".disabled = true
