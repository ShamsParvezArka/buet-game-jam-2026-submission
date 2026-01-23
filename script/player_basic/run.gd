extends State


func enter() -> void:
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_run")
	else:
		player.flipbook.play("run")
	

func update(delta: float) -> void:
	state_machine.update_facing_direction(player.direction_horizontal)
	
	if player.direction_horizontal == 0:
		state_machine.change_state(state_machine.get_node("Idle"))
	elif !player.is_on_floor():
		state_machine.change_state(state_machine.get_node("MidAir"))
	elif Input.is_action_pressed("jump"):
		state_machine.change_state(state_machine.get_node("Jump"))
	elif Input.is_action_pressed("attack"):
		state_machine.change_state(state_machine.get_node("Attack"))
		
	player.velocity.x = player.direction_horizontal * player.move_speed_horizontal
