extends Area2D
class_name HitBox
signal on_health_changed
func take_damage(damage: int):
	var value = abs(damage)
	on_health_changed.emit(-value)
