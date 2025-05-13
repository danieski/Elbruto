extends Node2D
@export var stats : CharacterStats
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("shoot")
