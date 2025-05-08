extends CharacterBody2D
const SPEED = 10
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var anim: AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var followAt: CharacterBody2D
@export var stats: CharacterStats
var slime_scene: PackedScene = preload("res://scenes/miniSlime.tscn")
func _ready() -> void:
	print(stats.color)
	match stats.color:
		1:
			animated_sprite_2d.modulate = Color(0,0,1)
		2:
			animated_sprite_2d.modulate = Color(0,1,1,1)
		3:
			animated_sprite_2d.modulate = Color(0,1,0)
	pass
