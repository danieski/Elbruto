extends StateBase
func on_physics_process(delta: float) -> void:
	controlled_node.velocity = Vector2.ZERO
	controlled_node.animation_player.play("idle")
	var distance = controlled_node.position.distance_to(controlled_node.player.position)
	#print(distance)
	if distance > controlled_node.TRAKING_RADIUS:
		state_machine.change_to("NPCStateRunning")
