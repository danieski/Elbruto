extends StateBase
func on_physics_process(delta: float) -> void:
	controlled_node.velocity = Vector2.ZERO
	controlled_node.animation_player.play("idle")
#	var distance = controlled_node.position.distance_to(controlled_node.player.position)
#	if distance > controlled_node.TRAKING_RADIUS:
#		state_machine.change_to("NPCStateRunning")


func _on_health_component_on_damage_took() -> void:
	state_machine.change_to("NPCStateDamaged")
	


func _on_health_component_on_dead() -> void:
	state_machine.change_to("NPCStateDead")
	


func _on_sensor_player_detected() -> void:
	print("destected")
	state_machine.change_to("NPCStateRunning")
