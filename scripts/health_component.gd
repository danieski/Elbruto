extends Area2D
class_name HealthComponent
signal onDead
signal onDamageTaken
signal onHealthChanged(health: int)

var max_health: int
var current_health: int = 0
var old_health: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_health = get_parent().stats.hp
	current_health = max_health

func _on_hit_box_on_health_changed(value) -> void:
	print(get_parent().name, " has been damaged: ", value, " hp")
	old_health = current_health
	current_health += value
	current_health = clamp(current_health, 0, max_health)
	
#	if old_health != current_health:
#		onHealthChanged.emit(current_health)
	if current_health <= 0:
		onDead.emit()
	elif current_health >= 0 and current_health < old_health:
		print("ondamagetook")
		onDamageTaken.emit()
