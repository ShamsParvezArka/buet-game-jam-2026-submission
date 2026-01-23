extends State


func enter() -> void:
	if GlobalState.can_climb:
		GlobalState.player_basic_apply_gravity = false
		player.flipbook.play("climb")
	else:
		state_machine.change_state(state_machine.previous_state)
	

func update(delta: float) -> void:
	if player.direction_vertical != 0:
		player.velocity.y = player.direction_vertical * player.move_speed_vertical
		player.flipbook.play("climb")
	else:
		player.velocity.y = 0
		player.flipbook.stop()
		
	if player.is_on_floor():
		state_machine.change_state(state_machine.get_node("Idle"))
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	GlobalState.can_climb = true if area.is_in_group("climbing_area") else false
	

func _on_area_2d_area_exited(_area: Area2D) -> void:
	GlobalState.can_climb = false
	GlobalState.player_basic_apply_gravity = true
	state_machine.change_state(state_machine.get_node("Idle"))
