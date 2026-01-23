extends State

@onready var timer: Timer = $Timer


func enter() -> void:
	player.flipbook.play("attack")
	timer.start()
	
	
func update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed_horizontal)
	

func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
