extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var actionable_finder: Area2D = $Marker2D/ActionableFinder


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
		#DialogueManager.show_dialogue_balloon(load("res://dialog/dialogue.dialogue"), "start")
		#DialogueManager.show_dialogue_balloon_scene(load("res://dialog/dialogue.dialogue"),null)
		return
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		direction.y = 0
	elif Input.is_action_pressed("ui_down") || Input.is_action_pressed("ui_up"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
	
	direction = direction.normalized()
	
	velocity = (direction * SPEED)
	
	move_and_slide()
