extends CharacterBody2D
@export var stats : CharacterStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer
@onready var gizmo: AnimatedSprite2D = $Gizmo

var isDead : bool = false

var followAt

const SPEED = 30.0


func _ready() -> void:
	#gizmo.frame=2
	selectColor()
	pass
func _physics_process(delta: float) -> void:
	if(!isDead):
		if(followAt!=null):
			animation_player.play("running_left")
			var direction = (followAt.position - position).normalized()
			velocity=direction*SPEED
			move_and_slide()
		else:
			animation_player.play("idle")
	else:
		animation_player.play("death")
	pass
func selectColor():
	print("Stats color", stats.color)
	match stats.color:
		0:
			gizmo.frame=0
		1:
			gizmo.frame=1
		2:
			gizmo.frame=2


func _on_sensor_player_detected(player: Node) -> void:
	followAt = player



func _on_health_component_on_dead() -> void:
	isDead = true
	
	


func _on_health_component_on_damage_taken() -> void:
	hit_flash_animation_player.play("hit_flash")
