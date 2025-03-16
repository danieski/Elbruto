extends StateBase
func on_physics_process(delta: float) -> void:
	pass

	
func on_input(event):
	if controlled_node.last_animation == "idle_right" or controlled_node.last_animation == "walk_right" :
		controlled_node.animation_player.play("attack_right")
		state_machine.change_to("PlayerStateIdle")
	if controlled_node.last_animation == "idle_left" or controlled_node.last_animation == "walk_left" :
		controlled_node.animation_player.play("attack_left")
		state_machine.change_to("PlayerStateIdle")
	if controlled_node.last_animation == "idle_up" or controlled_node.last_animation == "walk_up" :
		controlled_node.animation_player.play("attack_up")
		state_machine.change_to("PlayerStateIdle")
	if controlled_node.last_animation == "idle_down" or controlled_node.last_animation == "walk_down" :
		controlled_node.animation_player.play("attack_down")
		state_machine.change_to("PlayerStateIdle")
	
func end():
	#print("Endfunc")
	pass
func start():
	pass
