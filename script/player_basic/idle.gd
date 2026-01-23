extends State


func enter() -> void:
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_idle")
	else:
		player.flipbook.play("idle")
	

func update(delta: float) -> void:
	if GlobalState.current_selected_player == player:
		if player.direction_horizontal != 0:
			state_machine.change_state(state_machine.get_node("Run"))
		elif player.direction_vertical < 0:
			state_machine.change_state(state_machine.get_node("Climb"))
		elif Input.is_action_pressed("jump"):
			state_machine.change_state(state_machine.get_node("Jump"))
		elif Input.is_action_pressed("attack"):
			state_machine.change_state(state_machine.get_node("Attack"))
		elif Input.is_action_pressed("grab"):
			state_machine.change_state(state_machine.get_node("Grab"))
		elif Input.is_action_pressed("throw"):
			state_machine.change_state(state_machine.get_node("Throw"))
