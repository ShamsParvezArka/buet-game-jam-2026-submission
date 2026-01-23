extends CharacterBody2D

@export var initial_state: State
@export var flipbook: AnimatedSprite2D
@export var state_machine: StateMachine
@export var ray: Node
@export var move_speed_horizontal := 30
@export var move_speed_vertical := 20
@export var jump_force := -30
@export var gravity := 90

var direction_horizontal := 0.0
var direction_vertical := 0.0


func _ready() -> void:
	GlobalState.anime_sword_obtained = false
	GlobalState.player_basic_apply_gravity = true
	state_machine.init(initial_state)


func _process(_delta: float) -> void:
	if GlobalState.current_selected_player == self:
		direction_horizontal = Input.get_axis("move_left", "move_right")
		direction_vertical = Input.get_axis("move_up", "move_down")
		

func _physics_process(delta: float) -> void:
	state_machine.update(delta)
	
	if not self.is_on_floor() and GlobalState.player_basic_apply_gravity:
		self.velocity += Vector2(0, self.gravity) * delta
	self.move_and_slide()
