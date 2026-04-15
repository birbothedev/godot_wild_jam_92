extends Node

var SCREEN: Dictionary = {
	"width": ProjectSettings.get_setting("display/window/size/viewport_width"),
	"height": ProjectSettings.get_setting("display/window/size/viewport_height"),
	"center": Vector2()
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SCREEN.center = Vector2(SCREEN.width / 2, SCREEN.height / 2)

func fade_out(to, duration: float, color: Color) -> void:
	var rootControl = CanvasLayer.new()
	var colorRect = ColorRect.new()
	var tween = get_tree().create_tween()
	rootControl.set_process_mode(PROCESS_MODE_ALWAYS)
	colorRect.color = (Color(0, 0, 0, 0))
	
	get_tree().get_root().add_child(rootControl)
	rootControl.add_child(colorRect)
	colorRect.set_size(Vector2(SCREEN.width, SCREEN.height))
	
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(colorRect, "color", color, duration/2.0)
	var root = get_tree().root
	await tween.finished
	
	var from = get_tree().current_scene
	if is_instance_valid(from):
		from.queue_free()
	
	var new_scene = load(to).instantiate()
	get_tree().get_root().add_child(new_scene)
	
	var tween2 = get_tree().create_tween()
	tween2.set_ease(Tween.EASE_IN_OUT)
	tween2.set_trans(Tween.TRANS_LINEAR)
	tween2.tween_property(colorRect, "color", color, duration/2.0)
	
	await tween2.finished
	
	get_tree().set_current_scene(new_scene)
	rootControl.queue_free()
	
