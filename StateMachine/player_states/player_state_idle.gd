extends StateBase
func on_physics_process(delta: float) -> void:
	var animation_player = controlled_node.get_node("AnimationPlayer") if controlled_node.has_node("AnimationPlayer") else null

	if animation_player:
		animation_player.play("idle")
	else:
		push_error("Error: No se encontró AnimationPlayer en " + controlled_node.name)
	
	controlled_node.move_and_slide()
func on_input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right"):
			state_machine.change_to("PlayerStateRunning")
	
