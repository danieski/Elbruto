extends CharacterBody2D


const SPEED = 2530.0
const JUMP_VELOCITY = -300.0
@onready var actionable_finder: Area2D = $Marker2D/ActionableFinder
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $Marker2D
var last_animation: String = "walk_down"


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
