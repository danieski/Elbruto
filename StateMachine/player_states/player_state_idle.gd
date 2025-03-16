extends StateBase
func on_physics_process(delta: float) -> void:

	match controlled_node.last_animation:
		"walk_right":
			controlled_node.animation_player.play("idle_right")
			controlled_node.last_animation="idle_right"
		"walk_left":
			controlled_node.animation_player.play("idle_left")
			controlled_node.last_animation="idle_left"
		"walk_up":
			controlled_node.animation_player.play("idle_up")
			controlled_node.last_animation="idle_up"
		"walk_down":
			controlled_node.animation_player.play("idle_down")
			controlled_node.last_animation="idle_down"
		#_:
		#	controlled_node.animation_player.play("idle_down")
		#	controlled_node.last_animation="idle_down"

func on_input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right"):
			state_machine.change_to("PlayerStateRunning")
	elif Input.is_action_pressed("ui_accept"):
			state_machine.change_to("PlayerStateAttack")
func end():
	pass
func start():
	pass
