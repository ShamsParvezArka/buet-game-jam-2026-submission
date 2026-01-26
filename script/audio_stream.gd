extends Node2D


func play(audio_stream_name: String) -> void:
	self.get_node(audio_stream_name).play()


func stop(audio_stream_name: String) -> void:
	self.get_node(audio_stream_name).stop()
