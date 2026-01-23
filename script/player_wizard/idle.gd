extends State


func enter() -> void:
	player.flipbook.play("idle")
	

func update(delta: float) -> void:
	if player.direction_horizontal != 0:
		state_machine.change_state(state_machine.get_node("Run"))
	if Input.is_action_pressed("attack"):
		state_machine.change_state(state_machine.get_node("Attack"))
