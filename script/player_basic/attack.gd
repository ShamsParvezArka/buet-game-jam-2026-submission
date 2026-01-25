extends State

@onready var timer: Timer = $Timer
@onready var hit_collider: CollisionShape2D = $"../../HitArea/HitCollider"


func enter() -> void:
	if GlobalState.anime_sword_obtained:
		player.flipbook.play("sword_attack")
		timer.start()
		hit_collider.disabled = false
	else:
		state_machine.change_state(state_machine.previous_state)
	
	
func update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed_horizontal)


func _on_timer_timeout() -> void:
	state_machine.change_state(state_machine.get_node("Idle"))
	hit_collider.disabled = true
	

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		body.hit = true
		if hit_collider.position.x < 0:
			body.hit_direction = GlobalState.FacingDirection.LEFT
		elif hit_collider.position.x > 0:
			body.hit_direction = GlobalState.FacingDirection.RIGHT
	elif body.is_in_group("mob"):
		body.is_hurt = true
		if hit_collider.position.x < 0:
			body.hit_direction = GlobalState.FacingDirection.LEFT
		elif hit_collider.position.x > 0:
			body.hit_direction = GlobalState.FacingDirection.RIGHT
			
