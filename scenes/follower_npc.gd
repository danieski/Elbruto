extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const SPEED = 30.0
const JUMP_VELOCITY = -400.0
const TRAKING_RADIUS = 50
var vida = 1
func _physics_process(delta: float) -> void:

	pass
	#var direction = (player.position - position).normalized()
	#velocity = direction * SPEED
	#var distance = position.distance_to(player.position)
	#if distance < TRAKING_RADIUS:
	#	velocity = Vector2.ZERO


	#move_and_slide()
func death():
	queue_free()



func _on_hitbox_area_entered(area: Area2D) -> void:
	vida -= 1
	if vida <= 0:
		death()
	
