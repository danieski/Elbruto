extends CharacterBody2D

@export var stats : SpellStats 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurt_box: HurtBox = $HurtBox

var target : Vector2
var isFromPlayer : bool
func _ready() -> void:
	selectType()
	animated_sprite_2d.play()
	if isFromPlayer:
		hurt_box.remove_from_group("enemy")
		hurt_box.add_to_group("player")
		var direction =get_global_mouse_position() - position
		rotation = direction.angle()
		velocity = direction * stats.Speed

	else:
		hurt_box.remove_from_group("player")
		hurt_box.add_to_group("enemy")
		var direction = target - position
		rotation = direction.angle()
		velocity = direction * stats.Speed


	await get_tree().create_timer(3).timeout
	queue_free()
func _physics_process(delta: float) -> void:
	move_and_slide()
func selectType():
	match stats.type:
		0:
			animated_sprite_2d.animation="fire"
		1:
			animated_sprite_2d.animation="wind"
		2:
			animated_sprite_2d.animation="ice"
		3:
			animated_sprite_2d.animation="earth"
