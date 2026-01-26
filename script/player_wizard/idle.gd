extends State


func enter() -> void:
	player.flipbook.play("idle")
	

func update(delta: float) -> void:
	if GlobalState.current_selected_player == player:
		if player.direction_horizontal != 0:
			state_machine.change_state(state_machine.get_node("Run"))
		elif Input.is_action_just_pressed("teleport"):
			state_machine.change_state(state_machine.get_node("Teleport"))
		elif Input.is_action_pressed("pick_up"):
			state_machine.change_state(state_machine.get_node("PickUp"))
			
