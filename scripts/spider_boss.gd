extends CharacterBody2D
class_name SpiderBoss
@export var stats : CharacterStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit_flash_animation_player: AnimationPlayer = $HitFlashAnimationPlayer
@export var spell_resource : SpellStats
@export var playerReference : player
@onready var path_follow_2d: PathFollow2D = $".."
@onready var boss_chambre: Node2D = $"../../.."
const SpiderSuperAtyackScene = preload("res://scenes/atack_spider.tscn")
const SPAWN_PARTICLES = preload("res://scenes/spawn_particles.tscn")
const spell = preload("res://scenes/spell.tscn")

func _ready() -> void:
	#shoot()
	pass
func _process(delta: float) -> void:
	path_follow_2d.progress += 1
	pass
func _on_health_component_on_dead() -> void:
	animation_player.stop()
	$Timer.stop()
	$".".set_process(false)
	animation_player.play("dead")
	var particles = SPAWN_PARTICLES.instantiate()
	particles.position = global_position
	particles.emitting = true
	get_parent().add_child(particles)
	await animation_player.animation_finished
	Global.getInside()
	queue_free()
	

func test(value) -> void:
	hit_flash_animation_player.play("hit_flash")

func shoot():
	animation_player.play("atack_down")
	
func shootLogic():
	var bullet = spell.instantiate()
	bullet.isFromPlayer = false
	bullet.target = playerReference.global_position
	bullet.stats = spell_resource
	bullet.position = global_position
	get_parent().get_parent().get_parent().add_child(bullet)

func _on_timer_timeout() -> void:
	shoot()

func areaAtack():
	pass


func _on_spider_super_atack_timeout() -> void:
	var attackSpider = SpiderSuperAtyackScene.instantiate()
	get_parent().get_parent().get_parent().add_child(attackSpider)
