extends CharacterController

@export var normal_speed := 20
@export var chase_speed = 30
@export var accleration:= 10
@export var gravity := 90

@export var player:CharacterController # target
@export var left_boundary:Vector2 
@export var right_boundary:Vector2

@onready var ray_cast: RayCast2D = $Flipbook/RayCast2D
@onready var timer: Timer = $Timer

var direction:Vector2

enum State {
	SEARCH, # looking for enemy
	FOUND # found the enemy
}
var current_state =State.SEARCH # initially searching

func _ready() -> void:
	# random movment value boundary
	left_boundary = self.position + Vector2(-10,0) 
	right_boundary = self.position + Vector2(10,0)

func _physics_process(delta: float) -> void:
	move(delta)
	change_direction()
	lookForPlayer()

func lookForPlayer():
	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()
		if collider == player:
			chasePlayer()
	else:
		stopChase()
		
func chasePlayer():
	timer.stop()
	current_state = State.FOUND
func stopChase():
	if timer.time_left <= 0:
		timer.start()
func move(delta:float):
	if current_state == State.SEARCH:
		velocity = velocity.move_toward(direction*normal_speed,accleration*delta)
	elif current_state == State.FOUND:
		velocity = velocity.move_toward(direction*chase_speed,accleration*delta)
	move_and_slide()

func change_direction()-> void:
	if current_state == State.SEARCH:
		if flipbook.flip_h:
			#looking at left
			if self.position.x >= left_boundary.x:
				direction = Vector2(-1,0)
			else:
				flipbook.flip_h = false
				ray_cast.target_position = Vector2(50,0)
			
		else:
			if self.position.x <= right_boundary.x:
				direction = Vector2(1,0)
			else:
				flipbook.flip_h	= true
				ray_cast.target_position = Vector2(-50,0)
	elif current_state == State.FOUND: # found the player
		direction = (player.position - self.position).normalized()
		
		direction = sign(direction)
		if direction.x == 1:
			#right direction
			#print("chasing in right")
			flipbook.flip_h = false
			ray_cast.target_position = Vector2(50,0)
		else:
			#print("chasing in left")
			flipbook.flip_h = true
			ray_cast.target_position = Vector2(-50,0)
			
func _on_timer_timeout() -> void:
	current_state = State.SEARCH
