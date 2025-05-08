
extends CharacterBody2D


class_name player
const SPEED = 3000.0
const JUMP_VELOCITY = -300.0
@onready var actionable_finder: Area2D = $ActionMarker/ActionableFinder
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $ActionMarker
@onready var hud: CanvasLayer = $HUD
@export var stats: CharacterStats
@onready var hit_flash_anim: AnimationPlayer = $HitFlashAnim
@onready var sword: Node2D = $Sword
const SWORD = preload("res://scenes/sword.tscn")
var direction: Vector2 = Vector2(0,-1)
var isReloading = false
@export var reloadTime = .1

func hasShoot():
	isReloading=true
	await get_tree().create_timer(reloadTime).timeout
	isReloading=false


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return


func _on_health_component_on_damage_took() -> void:
	hit_flash_anim.play("hit")
