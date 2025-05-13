
extends CharacterBody2D


class_name player
const SPEED = 3000.0
const JUMP_VELOCITY = -300.0
@onready var actionable_finder: Area2D = $ActionMarker/ActionableFinder
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $ActionMarker
@onready var hud: CanvasLayer = $HUD
@export var stats: PlayerStats
@onready var hit_flash_anim: AnimationPlayer = $HitFlashAnim
@onready var thinking: Sprite2D = $Thinking

const SPELL = preload("res://scenes/spell.tscn")


#var test : PackedScene = preload("res://resources/ice_spell.tres")
@export var spellArray: Array[SpellStats]
var selectionSpellCounter = 0
var direction: Vector2 = Vector2(0,-1)
var isReloading = false
signal playerHurt
signal idle_to_talking
func _ready() -> void:

	Global.updateHUD.emit()
	
func hasShoot():
	isReloading=true
	%SkillCD.wait_time=spellArray[selectionSpellCounter].cooldown
	%SkillCD.start()
	await %SkillCD.timeout
	isReloading=false
	
	pass
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			idle_to_talking.emit()
			return
			
	if Input.is_action_just_pressed("changeSpell"):
		selectionSpellCounter += 1
		if selectionSpellCounter>spellArray.size()-1:
			selectionSpellCounter = 0
		Global.updateHUD.emit()
		
	if Input.is_action_just_pressed("shoot"):
		if stats.mp >= 1:
			if !isReloading:
				stats.mp -= 1
				hasShoot()
				var spell = SPELL.instantiate()
				spell.global_position = position
				#print("player position? ", position)
				spell.stats = spellArray[selectionSpellCounter]
				spell.isFromPlayer = true
				get_parent().add_child(spell)
				Global.updateHUD.emit()

	
func on_damage_taken(value) -> void:
	hit_flash_anim.play("hit")
	stats.hp = stats.hp + value
	Global.updateHUD.emit()
	
