extends Sprite2D

var bar_name_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bar_name_label = $BarNameLabel
	bar_name_label.text = str(GameManager.bar_name_input)
