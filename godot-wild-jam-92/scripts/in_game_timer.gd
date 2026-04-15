extends RichTextLabel

func _ready() -> void:
	var hours = str(GameManager.hour).pad_zeros(2)
	text = "Day " + str(GameManager.day) + ", " + hours + ":00"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# how long an in game minute is in IRL time in seconds
	if GameManager.timer < 1.0:
		# multiply by delta so timer goes up in real time
		GameManager.timer += 1 * delta
	elif GameManager.timer >= 1.0:
		GameManager.timer = 0
		GameManager.minutes += 10
		if GameManager.minutes == 60:
			GameManager.minutes = 0
			GameManager.hour += 1
			if GameManager.hour == 24:
				GameManager.hour = 0
				GameManager.day += 1
	text = "Day " + str(GameManager.day) + ", " + str(GameManager.hour).pad_zeros(2) + ":00"
	
	# pause game for buying upgrades at 8am
	if GameManager.hour == 8 and !GameManager.paused_for_timer:
		GameManager.paused_for_timer = true
		GameManager.game_paused_for_buying = true
		GameManager.go_to_buy_screen()
		print("going to buy screen")
	
	# return to game automatically at 8pm
	if GameManager.hour == 19 and GameManager.minutes == 50:
		GameManager.paused_for_timer = false
		GameManager.game_paused_for_buying = false
		GameManager.go_to_main_screen()
