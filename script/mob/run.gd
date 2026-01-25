extends State


func enter() -> void:
	print("chase state")
	player.flipbook.play("run")


func update(delta: float) -> void:
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	
	state_machine.update_facing_direction(player.direction_horizontal)
	var current_distance = abs(player.position.x - player.target.position.x)

	if current_distance <= player.target_distance:
		state_machine.change_state(state_machine.get_node("Attack"))
		return
	
	player.position.x += (player.target.position.x - player.position.x) / player.move_speed_inverse_horizontal
	

		
