extends Camera2D

@onready var basic: CharacterBody2D = $"../PlayerBasic"
@onready var wizard: CharacterBody2D = $"../PlayerWizard"

var interpolation_factor: float = 6.0

func _ready() -> void:
	GlobalState.current_selected_player = basic
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player_switch"):
		GlobalState.current_selected_player = basic if GlobalState.current_selected_player == wizard else wizard
		
	self.position = self.position.lerp(GlobalState.current_selected_player.position, interpolation_factor * delta);
