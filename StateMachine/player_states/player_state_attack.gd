extends StateBase
func on_physics_process(delta: float) -> void:
	pass

	
func on_input(event):
	if controlled_node.direction == Vector2(1,0):
		controlled_node.animation_player.play("attack_right")
		await controlled_node.animation_player.animation_finished
		attackToIdle()
	if controlled_node.direction == Vector2(-1,0):
		controlled_node.animation_player.play("attack_left")
		await controlled_node.animation_player.animation_finished
		attackToIdle()
	if controlled_node.direction == Vector2(0,1):
		controlled_node.animation_player.play("attack_up")
		#state_machine.change_to("PlayerStateIdle")
		await controlled_node.animation_player.animation_finished
		attackToIdle()
	if controlled_node.direction == Vector2(0,-1):
		controlled_node.animation_player.play("attack_down")
		#state_machine.change_to("PlayerStateIdle")
		await controlled_node.animation_player.animation_finished
		attackToIdle()
 	
func attackToIdle():
	state_machine.change_to("PlayerStateIdle")
