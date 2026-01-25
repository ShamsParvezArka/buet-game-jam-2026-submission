extends State

@onready var timer: Timer = $Timer


func enter() -> void:
	print("attack state entered")
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	timer.start()
	player.flipbook.play("attack")
	

func update(delta: float) -> void:
	if player.is_hurt == true:
		state_machine.change_state(state_machine.get_node("KnockBack"))
		player.is_hurt = false


func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
