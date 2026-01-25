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
	if player.player_has_hit == true:
		state_machine.change_state(state_machine.get_node("KnockBack"))
		player.player_has_hit = false


func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
