extends State

func enter() -> void:
	player.flipbook.play("run")

func update(delta: float) -> void:
	if player.direction_horizontal == 0:
		state_machine.change_state(state_machine.get_node("Idle"))
	#elif Input.is_action_pressed("attack"):
		#state_machine.change_state(state_machine.get_node("Attack"))
