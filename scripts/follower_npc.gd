extends CharacterBody2D
@export var stats : CharacterStats
@onready var player: CharacterBody2D = $"../Player"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer


const SPEED = 30.0

func _ready() -> void:
	selectColor()
	pass
func _physics_process(delta: float) -> void:
	
	pass
func selectColor():
	match stats.color:
		0:
			animated_sprite_2d.modulate = Color(255,1,0)
		1:
			animated_sprite_2d.modulate = Color(0,0,255)
