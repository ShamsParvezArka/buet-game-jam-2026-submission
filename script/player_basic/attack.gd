extends State

@onready var timer: Timer = $Timer


func enter() -> void:
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_attack")
		timer.start()
	else:
		state_machine.change_state(state_machine.previous_state)
	
	
func update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed_horizontal)
	

func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
