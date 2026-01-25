extends State


func enter() -> void:
	print("idle state")
	player.flipbook.play("idle")
	player.velocity = Vector2.ZERO
	
	
func update(delta: float) -> void:
	if player.target == null:
		return
		
	#var current_distance = abs(player.position.x - player.target.position.x)
	#print(current_distance)
	if player.player_has_hit:
		state_machine.change_state(state_machine.get_node("KnockBack"))
	else:
		state_machine.change_state(state_machine.get_node("Chase"))
		
