extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const SPEED = 30.0
const JUMP_VELOCITY = -400.0
const TRAKING_RADIUS = 50

func _physics_process(delta: float) -> void:

	pass
	#var direction = (player.position - position).normalized()
	#velocity = direction * SPEED
	#var distance = position.distance_to(player.position)
	#if distance < TRAKING_RADIUS:
	#	velocity = Vector2.ZERO


	#move_and_slide()
