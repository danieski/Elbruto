
extends CharacterBody2D


class_name player
const SPEED = 3000.0
const JUMP_VELOCITY = -300.0
@onready var actionable_finder: Area2D = $Marker2D/ActionableFinder
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $Marker2D
var direction: Vector2 = Vector2(0,-1)



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return


func _on_health_component_on_damage_took() -> void:
	animation_player.play("hit")
	$CanvasLayer.update_hearts();
	
