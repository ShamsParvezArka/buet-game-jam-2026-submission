extends State

var can_climb := false

func enter() -> void:
	if !can_climb:
		state_machine.change_state(state_machine.previous_state)
		return
	
	GlobalState.player_basic_apply_gravity = false
	player.flipbook.play("climb")
	player.audio_stream.play("Climb")
	

func update(delta: float) -> void:
	if !can_climb:
		state_machine.change_state(state_machine.get_node("Idle"))
		
	if player.direction_vertical != 0:
		player.velocity.y = player.direction_vertical * player.move_speed_vertical
		player.flipbook.play("climb")
	else:
		player.velocity.y = 0
		player.flipbook.stop()
		
	if player.is_on_floor():
		state_machine.change_state(state_machine.get_node("Idle"))
	

func exit() -> void:
	GlobalState.player_basic_apply_gravity = true
	player.audio_stream.stop("Climb")
	

func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("climbing_area"):
		can_climb = true


func _on_interaction_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("climbing_area"):
		can_climb = false
