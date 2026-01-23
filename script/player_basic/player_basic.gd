extends CharacterController

@export var move_speed_horizontal := 30
@export var move_speed_vertical := 20
@export var jump_force := -30
@export var push_force := 15
@export var gravity := 90


func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if not self.is_on_floor() and GlobalState.player_basic_apply_gravity:
		self.velocity += Vector2(0, self.gravity) * delta
	self.move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision := get_slide_collision(i)
		var box := collision.get_collider()

		if box is CharacterBody2D and box.is_in_group("pushable"):
			var normal := collision.get_normal()

			if abs(normal.x) > 0.9 and self.direction_horizontal != 0:
				box.velocity.x = direction_horizontal * (self.push_force)
				box.is_being_pushed = true
