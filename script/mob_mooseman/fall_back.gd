extends State


func enter() -> void:
	print("cooldown state")
	player.velocity.x = 0
	player.flipbook.play_backwards("run")
	
	
func update(delta: float) -> void:
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	
	var d = player.global_position - player.target.global_position
	player.velocity.x = sign(d.normalized().x) * player.move_speed_horizontal

	
