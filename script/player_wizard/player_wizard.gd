extends CharacterController

@export var move_speed_horizontal := 30
@export var move_speed_vertical := 0
@export var jump_force := -30
@export var gravity := 90


func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if not self.is_on_floor() and GlobalState.player_basic_apply_gravity:
		self.velocity += Vector2(0, self.gravity) * delta
	self.move_and_slide()
