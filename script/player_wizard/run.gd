extends State


func enter() -> void:
	player.flipbook.play("run")


func update(delta: float) -> void:
	state_machine.update_facing_direction(player.direction_horizontal)
	
	if player.direction_horizontal == 0:
		state_machine.change_state(state_machine.get_node("Idle"))
		
	player.velocity.x = player.direction_horizontal * player.move_speed_horizontal
