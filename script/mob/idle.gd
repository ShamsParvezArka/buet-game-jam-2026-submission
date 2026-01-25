extends State


func enter() -> void:
	print("idle state")
	player.flipbook.play("idle")
	player.velocity = Vector2.ZERO
	
	
func update(delta: float) -> void:
	if player.health <= 0:
		state_machine.change_state(state_machine.get_node("Death"))
	if player.target:
		state_machine.change_state(state_machine.get_node("Chase"))
	elif player.is_hurt:
		state_machine.change_state(state_machine.get_node("KnockBack"))
		
