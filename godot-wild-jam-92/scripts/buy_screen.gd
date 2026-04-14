extends Node2D

@onready var main_game_scene = preload("res://scenes/main.tscn")
var PLUS_REP_COST = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_return_pressed() -> void:
	get_tree().change_scene_to_packed(main_game_scene)
	GameManager.hour = 20

func _on_purchase_rep_pressed() -> void:
	if GameManager.bar_money_value < PLUS_REP_COST:
		return
	GameManager.change_bar_reputation(50)
	GameManager.change_bar_money_amount(PLUS_REP_COST)

func _on_refill_ammo_pressed() -> void:
	pass # Replace with function body.
