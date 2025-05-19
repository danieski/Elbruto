extends StateBase
func on_physics_process(delta: float) -> void:
	pass

	
func on_input(event):

	match controlled_node.direction:
		Vector2(1,0):
			controlled_node.animation_player.play("attack_right")
		Vector2(-1,0):
			controlled_node.animation_player.play("attack_left")
		Vector2(0,1):
			controlled_node.animation_player.play("attack_up")
		Vector2(0,-1):
			controlled_node.animation_player.play("attack_down")
	await controlled_node.animation_player.animation_finished
	state_machine.change_to("PlayerStateRunning")

func attackToIdle():
	state_machine.change_to("PlayerStateIdle")
