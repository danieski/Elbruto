extends StateBase
func on_physics_process(delta):
	var direction = (controlled_node.player.position - controlled_node.position).normalized()
	controlled_node.velocity = direction * controlled_node.SPEED
	var distance = controlled_node.position.distance_to(controlled_node.player.position)
	controlled_node.animation_player.play("running_right")
	if distance < controlled_node.TRAKING_RADIUS:
		state_machine.change_to("NPCStateIdle")
		
	controlled_node.move_and_slide()
