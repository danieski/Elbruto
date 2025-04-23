extends Area2D
class_name HealthComponent
signal onDead
signal onDamageTook
signal onHealthChanged(health: int)

@export var max_health: int = 3
var current_health: int = 0
var old_health: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
func take_heal(value: int):
	set_health(value)
func set_health(value: int):
	pass


	


func _on_hit_box_on_health_changed(value) -> void:
	
	old_health = current_health
	current_health += value
	current_health = clamp(current_health, 0, max_health)
	
	if old_health != current_health:
		onHealthChanged.emit(current_health)
	if current_health <= 0:
		onDead.emit()
	elif current_health >= 0 and current_health < old_health:
		onDamageTook.emit()
