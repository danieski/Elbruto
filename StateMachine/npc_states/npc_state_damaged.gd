extends StateBase
func on_physics_process(delta: float) -> void:
	controlled_node.velocity = Vector2.ZERO
	controlled_node.hit_flash_animation_player.play("hit_flash")
func change_Damaged_to_Idle():
	state_machine.change_to("NPCStateIdle")
func change_Damaged_to_Running():
	state_machine.change_to("NPCStateRunning")
