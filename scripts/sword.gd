extends Node2D
@export var TTL = .5
@onready var marker_2d: Marker2D = $Marker2D

func _ready() -> void:
	var direction =get_global_mouse_position()-global_position
	marker_2d.rotation = direction.angle()
	await get_tree().create_timer(TTL).timeout
	queue_free()
