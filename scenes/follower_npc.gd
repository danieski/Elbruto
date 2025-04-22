extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer


const SPEED = 30.0
const JUMP_VELOCITY = -400.0
const TRAKING_RADIUS = 50

func _physics_process(delta: float) -> void:
	
	pass
