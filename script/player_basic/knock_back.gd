extends State

@onready var timer: Timer = $Timer


func enter() -> void:
	player.flipbook.play("mid_air")
	player.velocity.y = player.jump_force + 15
	timer.start()	


func update(delta: float) -> void:
	if player.health <= 0:
		state_machine.change_state(state_machine.get_node("Death"))


func _on_timer_timeout() -> void:
	player.is_hurt = false
	state_machine.change_state(state_machine.get_node("Idle"))
