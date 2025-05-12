extends StateBase
func on_input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_accept"):
			state_machine.change_to("PlayerStateIdle")

func end():
	controlled_node.thinking.visible = false
	controlled_node.isReloading = false
	pass
func start():
	controlled_node.isReloading = true
	controlled_node.thinking.visible = true
	pass
