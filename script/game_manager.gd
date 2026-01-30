extends Node2D

@export var world: Node2D

@onready var indicator: Label = $Preprocessing/Indicator
@onready var blink_timer: Timer = $Preprocessing/Indicator/BlinkTimer


func restart_level(current_level: int) -> void:
	self.get_tree().reload_current_scene()
	GlobalState.game_over = false


func _ready() -> void:
	indicator.visible = false
	GlobalState.player_basic.position = GlobalState.basic_level_positon_container[GlobalState.current_level]
	GlobalState.player_wizard.position = GlobalState.wizard_level_positon_container[GlobalState.current_level]


func _process(delta: float) -> void:
	print("current_level: %s" % GlobalState.current_level)
	if Input.is_action_just_pressed("pause"):
		self.get_tree().paused = not self.get_tree().paused
		GlobalState.game_paused = self.get_tree().paused
		indicator.visible = GlobalState.game_paused
		world.modulate = Color(0.636, 0.636, 0.636, 1.0) if GlobalState.game_paused else Color.WHITE
	if GlobalState.game_over:
		restart_level(GlobalState.current_level)


func _on_blink_timer_timeout() -> void:
	if GlobalState.game_paused:
		indicator.visible = !indicator.visible
		
