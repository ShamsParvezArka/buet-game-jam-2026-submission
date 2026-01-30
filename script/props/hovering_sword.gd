extends StaticBody2D

@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var amplitude := 0.7
var frequency := 0.6
var initial_position_y := 0.0


func _ready() -> void:
	initial_position_y = self.position.y


func _process(delta: float) -> void:
	var t := Time.get_ticks_msec() / 1000.0
	# NOTE(arka): 2.0 * PI converts frequency to radians per second
	var y_offset = amplitude * sin(t * frequency * 2.0 * PI)
	self.position.y = initial_position_y + y_offset
