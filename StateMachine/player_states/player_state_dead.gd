extends StateBase
func on_physics_process(delta: float) -> void:
	controlled_node.velocity = Vector2.ZERO
	controlled_node.animation_player.play("dead")
	await controlled_node.animation_player.animation_finished
	get_tree().quit()
func end():
	pass
func start():
	pass
