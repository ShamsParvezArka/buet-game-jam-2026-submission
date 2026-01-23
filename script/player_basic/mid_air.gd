extends State


func enter() -> void:
	player.flipbook.play("mid_air")
	

func update(delta: float) -> void:
	if player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed_horizontal)
		state_machine.change_state(state_machine.get_node("Idle"))
	else:
		if player.direction_vertical < 0:
			state_machine.change_state(state_machine.get_node("Climb"))
	
	player.velocity.x = player.direction_horizontal * player.move_speed_horizontal
