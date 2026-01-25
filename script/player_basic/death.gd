extends State

@onready var timer: Timer = $Timer

func enter() -> void:
	player.flipbook.play("die")
	print("player_death_state")
	timer.start()
	

func _on_timer_timeout() -> void:
	get_tree().quit()
