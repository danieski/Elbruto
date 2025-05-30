#extends Node
#@onready var slime: CharacterBody2D   = $".."
#@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
#@onready var animation_tree: AnimationTree     = $"../AnimationTree"
#signal kill_confirm
#
## ────────── NUEVO: constantes y estado del knock-back ──────────
#const KNOCKBACK_FORCE := 180.0      # Ajusta fuerza
#const KNOCKBACK_TIME  := 0.18       # Ajusta duración (seg.)
#var   knockback_timer := 0.0
#var   knockback_vel   := Vector2.ZERO
## ────────────────────────────────────────────────────────────────
#
#func _ready() -> void:
	#animation_player.play("walking")
#
#func _physics_process(delta: float) -> void:
	## 1️⃣ Si estamos retrocediendo, ignora la IA hasta que termine.
	#if knockback_timer > 0.0:
		#knockback_timer -= delta
		#slime.velocity   = knockback_vel
		#slime.move_and_slide()
		#return
#
	## 2️⃣ Lógica normal de movimiento (la que ya tenías).
	#slime.move_and_slide()
#
#func jump():
	#if slime.followAt != null:
		#var dir := (slime.followAt.position - slime.position).normalized()
		#slime.velocity = dir * slime.SPEED
	#else:
		#noJump()
##func noJump():
	#slime.velocity = Vector2.ZERO
#
## ----------------------------------------------------------------
## ANIMACIONES DE DAÑO / MUERTE (ya existían)
## ----------------------------------------------------------------
#func _on_health_component_on_damage_took() -> void:
	#animation_player.play("hit")
	#await animation_player.animation_finished
	#animation_player.play("walking")
#
#func _on_health_component_on_dead() -> void:
	#animation_player.play("dead")
#
## ----------------------------------------------------------------
## DETECCIÓN DEL JUGADOR
## ----------------------------------------------------------------
#func _on_sensor_player_detected(body: Node) -> void:
	#slime.followAt = body
	#jump()
#
#func _on_sensor_player_lost() -> void:
	#slime.followAt = null
#
## ----------------------------------------------------------------
## 🚩 AQUÍ IMPLEMENTAMOS EL KNOCK-BACK
## ----------------------------------------------------------------
## (Si tu señal de daño ya pasa la posición del atacante, usa attacker_pos.)
#func _on_health_component_on_damage_taken(attacker_pos := null) -> void:
	## Animación de impacto
	#animation_player.play("hit")
#
	#var dir: Vector2
	#if attacker_pos != null:
		#dir = (slime.position - attacker_pos).normalized()
	#elif slime.followAt != null:
		#dir = (slime.position - slime.followAt.position).normalized()
	#else:
		#dir = Vector2.LEFT        # valor por defecto, por si acaso
#
	#knockback_vel   = dir * KNOCKBACK_FORCE
	#knockback_timer = KNOCKBACK_TIME
