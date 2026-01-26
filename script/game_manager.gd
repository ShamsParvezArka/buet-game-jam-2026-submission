extends Node2D

@export var world: Node2D

@onready var indicator: Label = $Preprocessing/Indicator
@onready var blink_timer: Timer = $Preprocessing/Indicator/BlinkTimer


func _ready() -> void:
	indicator.visible = false


func _process(delta: float) -> void:
	print(GlobalState.push_trap_count)
	if Input.is_action_just_pressed("pause"):
		self.get_tree().paused = not self.get_tree().paused
		GlobalState.game_paused = self.get_tree().paused
		indicator.visible = GlobalState.game_paused
		world.modulate = Color(0.636, 0.636, 0.636, 1.0) if GlobalState.game_paused else Color.WHITE


func _on_blink_timer_timeout() -> void:
	if GlobalState.game_paused:
		indicator.visible = !indicator.visible
		
