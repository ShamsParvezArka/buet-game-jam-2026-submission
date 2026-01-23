extends CharacterBody2D

var is_being_pushed := false


func _physics_process(delta: float) -> void:
	if !is_being_pushed:
		self.velocity.x = move_toward(self.velocity.x, 0.0, 1200 * delta)
	
	if not self.is_on_floor():
		self.velocity += Vector2(0, 90) * delta
	
	move_and_slide()
	is_being_pushed = false
