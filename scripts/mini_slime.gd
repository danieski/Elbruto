extends CharacterBody2D
var followAt: CharacterBody2D
@export var stats: CharacterStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer

	
func _physics_process(delta: float) -> void:
	move_and_slide() 

func jump():
	var direction =(followAt.position-position).normalized()
	velocity=direction*10

func noJump():
	velocity = Vector2.ZERO
func _on_sensor_player_detected(player: Node2D) -> void:
	followAt = player
	print(followAt)
	animation_player.play("walking")



func _on_sensor_player_lost() -> void:
	followAt = null
	animation_player.play("idle")
	noJump()


func _on_health_component_on_damage_took() -> void:
	hit_flash_animation_player.play("hit_flash")
	print("xdddddd")

func _on_health_component_on_dead() -> void:
	animation_player.play("dead")
