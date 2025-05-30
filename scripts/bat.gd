extends CharacterBody2D
@export var stats : CharacterStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer
@onready var gizmo: AnimatedSprite2D = $Gizmo

var isDead : bool = false

var followAt

const SPEED = 30.0
# ---------- NUEVO (knock-back) ----------
const KNOCKBACK_FORCE    := 180.0      # ajusta a tu gusto
const KNOCKBACK_TIME     := 0.18       # cuánto dura el retroceso
var   knockback_timer    := 0.0
var   knockback_velocity := Vector2.ZERO
var hit_particles_scene = preload("res://scenes/HitParticles.tscn")
# ----------------------------------------

func _ready() -> void:

	selectColor()
	pass
func _physics_process(delta: float) -> void:
	if isDead:
		animation_player.play("death")
		return

	# ¿Estamos todavía en knock-back?
	if knockback_timer > 0.0:
		knockback_timer -= delta
		velocity = knockback_velocity
		move_and_slide()
		return          # saltamos la IA normal mientras retrocede

	# ---------- IA normal ----------
	if followAt != null:
		animation_player.play("running_left")
		var dir = (followAt.position - position).normalized()
		velocity = dir * SPEED
	else:
		animation_player.play("idle")
		velocity = Vector2.ZERO
	move_and_slide()
	# --------------------------------
func selectColor():
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
	
	


func _on_health_component_on_damage_taken(damage) -> void:
	hit_flash_animation_player.play("hit_flash")

	var particles = hit_particles_scene.instantiate()
	particles.global_position = global_position

	# Si hay followAt (el jugador), rota en dirección opuesta
	if followAt != null:
		var dir = (position - followAt.position).normalized()
		knockback_velocity = dir * KNOCKBACK_FORCE
		knockback_timer    = KNOCKBACK_TIME
		var to_attacker = (global_position - followAt.global_position).normalized()
		particles.rotation = to_attacker.angle()


	
	get_tree().current_scene.add_child(particles)
	particles.restart()
