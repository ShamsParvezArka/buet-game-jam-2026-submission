extends State

@onready var timer: Timer = $Timer

func enter() -> void:
	if player.target == null:
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	timer.start()
	player.flipbook.play("attack")
	if player.target != null and player.is_hurt == false:
		player.target.health -= 10
		player.target.is_hurt = true
	print("player_health_",player.target.health)
	

func update(delta: float) -> void:
	if player.health <= 0:
		state_machine.change_state(state_machine.get_node("Death"))
	elif player.is_hurt == true and player.health > 0:
		state_machine.change_state(state_machine.get_node("KnockBack"))
		player.is_hurt = false
		player.is_hit = false


func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
