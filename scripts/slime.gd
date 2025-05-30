extends CharacterBody2D

# ─── Ajustes generales ─────────────────────────────────────────
const SPEED := 80.0                     # velocidad del salto
const JUMP_DURATION := 0.22             # cuánto dura el impulso del salto
const JUMP_INTERVAL := 1.1              # tiempo entre un salto y el siguiente

# ─── Knock-back ────────────────────────────────────────────────
const KNOCKBACK_FORCE := 180.0
const KNOCKBACK_TIME  := 0.18
var   knockback_timer := 0.0
var   knockback_vel   := Vector2.ZERO

# ─── Saltos ────────────────────────────────────────────────────
var jump_timer  := 0.0          # tiempo restante del impulso actual
var cooldown    := 0.0          # tiempo hasta el próximo salto

# ─── Referencias en la escena ─────────────────────────────────
@onready var animation_player     : AnimationPlayer   = $AnimationPlayer
@onready var animated_sprite_2d   : AnimatedSprite2D  = $AnimatedSprite2D
@onready var gizmo                : AnimatedSprite2D  = $Gizmo
@onready var hit_flash            : AnimationPlayer   = $HitFlash

@export var followAt  : CharacterBody2D      # objetivo
@export var stats     : CharacterStats
#Pushback variables
var pushback_velocity: Vector2 = Vector2.ZERO
var pushback_time: float = 0.1
var pushback_timer: float = 0.0

# ─── Escenas auxiliares ───────────────────────────────────────
var slime_scene         : PackedScene = preload("res://scenes/miniSlime.tscn")
var hit_particles_scene : PackedScene = preload("res://scenes/HitParticles.tscn")

# ─── Ready ────────────────────────────────────────────────────
func _ready() -> void:
	selectColor()

func selectColor() -> void:
	match stats.color:
		0: gizmo.frame = 0
		1: gizmo.frame = 1
		2: gizmo.frame = 2

# ─── Físicas ──────────────────────────────────────────────────
func _physics_process(delta: float) -> void:
	
	# 1) Si estamos retrocediendo
	if knockback_timer > 0.0:
		knockback_timer -= delta
		velocity = knockback_vel
		move_and_slide()
		return

	# 2) Si estamos en medio de un salto
	if jump_timer > 0.0:
		jump_timer -= delta
		move_and_slide()            # mantenemos la velocidad actual
		if jump_timer <= 0.0:
			velocity = Vector2.ZERO  # termina el salto
		return

	# 3) Esperamos al próximo salto
	cooldown -= delta
	if cooldown <= 0.0 and followAt != null:
		_start_jump()
	else:
		velocity = Vector2.ZERO
		move_and_slide()

# ──────────────────────────────────────────────────────────────
func _start_jump() -> void:

	var dir := (followAt.global_position - global_position).normalized()
	velocity    = dir * SPEED
	jump_timer  = JUMP_DURATION
	cooldown    = JUMP_INTERVAL
	animated_sprite_2d.play("move")

# ─── Señales de daño / muerte ─────────────────────────────────
func _on_health_component_on_damage_taken(damage):

	animated_sprite_2d.play("hit")

	var particles = hit_particles_scene.instantiate()
	particles.global_position = global_position

	# Si hay followAt (el jugador), rota en dirección opuesta
	if followAt:
		var to_attacker = (global_position - followAt.global_position).normalized()
		particles.rotation = to_attacker.angle()
		# ← aquí asignamos el knock-back
		knockback_vel   = to_attacker * KNOCKBACK_FORCE
		knockback_timer = KNOCKBACK_TIME
	else:
		particles.rotation = 0.0
	get_tree().current_scene.add_child(particles)
	particles.restart()
func _on_health_component_on_dead() -> void:
	animation_player.play("dead")
	followAt = null


func player_detected(body) -> void:
	followAt = body
	cooldown = 0.0  # ← fuerza que salte ya en el próximo frame
