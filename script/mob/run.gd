extends State


func enter() -> void:
	print("chase state")
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	player.flipbook.play("run")
	


func update(delta: float) -> void:
	if player.health <= 0:
		state_machine.change_state(state_machine.get_node("Death"))
	if !player.is_on_floor():
		return
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return 
			
	state_machine.update_facing_direction(player.direction_horizontal)

	var d = player.global_position - player.target.global_position
	if d.length() > player.target_distance:
		player.velocity.x = sign(-d.normalized().x) * player.move_speed_horizontal
	else:
		player.velocity = Vector2.ZERO
		state_machine.change_state(state_machine.get_node("Attack"))	
	
		
