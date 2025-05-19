extends Node2D
@export var stats : CharacterStats
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var boomRadio: CollisionShape2D = $HurtBox/CollisionShape2D2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var coin: PackedScene = preload("res://scenes/coin.tscn")

func _on_health_component_on_damage_taken() -> void:
	print("damege took barrel")


func _on_health_component_on_dead() -> void:
	animation_player.play("destroying")
	await animation_player.animation_finished
	reward()
	
func reward():
	animation_player.play("boom")
	#match randi_range(0,1):
		#0:
			#animation_player.play("boom")
		#1:
			#var reward = coin.instantiate()
			#reward.position = position
			#get_parent().get_parent().add_child(reward)
			#queue_free()
