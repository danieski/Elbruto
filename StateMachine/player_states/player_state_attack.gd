extends StateBase
func on_physics_process(delta: float) -> void:
	pass

	
func on_input(event):
	controlled_node.hasShoot()
	var sword = controlled_node.SWORD.instantiate()
	sword.position=controlled_node.position
	controlled_node.get_parent().add_child(sword)
	state_machine.change_to("PlayerStateRunning")

func attackToIdle():
	state_machine.change_to("PlayerStateIdle")
