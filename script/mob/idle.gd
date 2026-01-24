extends State

func enter() -> void:
	player.flipbook.play("idle")
func update(delta: float) -> void:
	print(player.velocity)
	if player.direction_horizontal != 0 :
		print("change to run")
		state_machine.change_state(state_machine.get_node("Run"))
