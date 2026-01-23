extends RigidBody2D

var amplitude: float = 0.5 
var frequency: float = 1
var initial_y: float = 0.0  


func _ready():
		initial_y = position.y


func _process(delta):
		var time = Time.get_ticks_msec() / 1000.0 
		# NOTE(arka): 2.0 * PI converts frequency to radians per second
		var y_offset = amplitude * sin(time * frequency * 2.0 * PI) 

		self.position.y = initial_y + y_offset
	
