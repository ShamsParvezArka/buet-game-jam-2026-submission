extends Camera2D

@export var basic: CharacterBody2D 
@export var wizard: CharacterBody2D

@onready var player_basic_icon: Sprite2D = $PlayerBasicIcon
@onready var player_wizard_icon: Sprite2D = $PlayerWizardIcon
@onready var audio_stream: Node2D = $AudioStream

var interpolation_factor: float = 6.0


func _ready() -> void:
	GlobalState.current_selected_player = basic
	

func _process(delta: float) -> void:
	self.position = self.position.lerp(GlobalState.current_selected_player.position, interpolation_factor * delta)
	
	# NOTE(arka): Player toggle logic
	if Input.is_action_just_pressed("player_switch"):
		GlobalState.current_selected_player = basic if GlobalState.current_selected_player == wizard else wizard
		audio_stream.play("Switch")
		
	# NOTE(arka): Current selected Player
	if GlobalState.current_selected_player == basic:
		player_wizard_icon.modulate = Color(1.0, 1.0, 1.0, 0.212)
		player_basic_icon.modulate = Color.WHITE
	else:
		player_basic_icon.modulate = Color(1.0, 1.0, 1.0, 0.212)
		player_wizard_icon.modulate = Color.WHITE

	
	
