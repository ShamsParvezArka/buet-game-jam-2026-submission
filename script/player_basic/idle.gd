extends State


func enter() -> void:
	player.velocity.x = 0
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_idle")
	else:
		player.flipbook.play("idle")
	

func update(delta: float) -> void:
	if GlobalState.current_selected_player == player:
		if player.health <= 0:
			print("player_died")
			state_machine.change_state(state_machine.get_node("Death"))
		if player.direction_horizontal != 0:
			state_machine.change_state(state_machine.get_node("Run"))
		elif player.direction_vertical < 0:
			state_machine.change_state(state_machine.get_node("Climb"))
		elif Input.is_action_pressed("jump"):
			state_machine.change_state(state_machine.get_node("Jump"))
		elif Input.is_action_pressed("attack"):
			state_machine.change_state(state_machine.get_node("Attack"))
		elif Input.is_action_pressed("pick_up"):
			state_machine.change_state(state_machine.get_node("PickUp"))
		elif player.is_hurt:
			state_machine.change_state(state_machine.get_node("KnockBack"))
			
