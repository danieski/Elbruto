extends CharacterBody2D
const SPEED = 10
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var anim: AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var followAt: CharacterBody2D
@export var stats: CharacterStats
@onready var gizmo: AnimatedSprite2D = $Gizmo
@onready var hit_flash: AnimationPlayer = $HitFlash

var slime_scene: PackedScene = preload("res://scenes/miniSlime.tscn")
func _ready() -> void:
	selectColor()
func selectColor():

	match stats.color:
		0:
			gizmo.frame=0
		1:
			gizmo.frame=1
		2:
			gizmo.frame=2


func _on_health_component_on_damage_taken() -> void:
	animated_sprite_2d.play("hit")
