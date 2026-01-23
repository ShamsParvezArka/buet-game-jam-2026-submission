class_name CharacterController extends CharacterBody2D

@export var state_machine: StateMachine
@export var initial_state: State
@export var flipbook: AnimatedSprite2D

var direction_horizontal := 0.0
var direction_vertical := 0.0


func _ready() -> void:
	GlobalState.player_basic_apply_gravity = true
	state_machine.init(initial_state)


func _process(_delta: float) -> void:
	direction_horizontal = Input.get_axis("move_left", "move_right")
	direction_vertical = Input.get_axis("move_up", "move_down")
		
		
