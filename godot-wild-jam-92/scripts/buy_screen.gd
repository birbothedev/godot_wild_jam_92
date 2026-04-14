extends Node2D

var PLUS_REP_COST = 100
var HYPNOTIZE_COST = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_refill_ammo_pressed() -> void:
	pass # Replace with function body.

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
	get_tree().change_scene_to_packed(GameManager.main_game_scene)
	GameManager.hour = 20
