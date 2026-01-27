extends Camera2D

@export var basic: CharacterBody2D 
@export var wizard: CharacterBody2D

@onready var player_basic_icon: Sprite2D = $PlayerBasicIcon
@onready var player_wizard_icon: Sprite2D = $PlayerWizardIcon
@onready var audio_stream: Node2D = $AudioStream
@onready var player_mechanics_basic: Node2D = $PlayerMechanicsBasic
@onready var player_mechanics_wizard: Node2D = $PlayerMechanicsWizard


var interpolation_factor: float = 6.0


func _ready() -> void:
	GlobalState.current_selected_player = basic
	

func update_player_mechanics_sprite() -> void:
	#NOTE(arka): Player basic logic 
	if Input.is_action_pressed("attack"):
		player_mechanics_basic.get_node("Attack").play("k_pressed")
	elif Input.is_action_just_released("attack"):
		player_mechanics_basic.get_node("Attack").play("k")
	
	#NOTE(arka): Player wizard logic
	if Input.is_action_pressed("teleport"):
		player_mechanics_wizard.get_node("Teleport").play("t_pressed")
	elif Input.is_action_just_released("teleport"):
		player_mechanics_wizard.get_node("Teleport").play("t")
	if Input.is_action_pressed("target_switch"):
		player_mechanics_wizard.get_node("TargetSwitch").play("l_pressed")
	if Input.is_action_just_released("target_switch"):
		player_mechanics_wizard.get_node("TargetSwitch").play("l")
	

func _process(delta: float) -> void:
	self.position = self.position.lerp(GlobalState.current_selected_player.position, interpolation_factor * delta)
	
	if GlobalState.current_level > 2:
		self.get_tree().change_scene_to_file("res://scene/ending.tscn")
	
	# NOTE(arka): Player toggle logic
	if Input.is_action_just_pressed("player_switch"):
		GlobalState.current_selected_player = basic if GlobalState.current_selected_player == wizard else wizard
		audio_stream.play("Switch")
		
	# NOTE(arka): Current selected Player
	if GlobalState.current_selected_player == basic:
		player_wizard_icon.modulate = Color(1.0, 1.0, 1.0, 0.212)
		player_basic_icon.modulate = Color.WHITE
		player_mechanics_basic.visible = true
		player_mechanics_wizard.visible = false
	else:
		player_basic_icon.modulate = Color(1.0, 1.0, 1.0, 0.212)
		player_wizard_icon.modulate = Color.WHITE
		player_mechanics_basic.visible = false
		player_mechanics_wizard.visible = true
	
	update_player_mechanics_sprite()
	
	

	
	
