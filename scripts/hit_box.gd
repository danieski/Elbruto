extends Area2D
class_name HitBox
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

signal on_health_changed
func take_damage(damage: int):
	audio_stream_player_2d.play()
	var value = abs(damage)
	on_health_changed.emit(-value)
