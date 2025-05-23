extends StateBase
func on_physics_process(delta: float) -> void:

	match controlled_node.direction:
		Vector2(1,0):
			controlled_node.animation_player.play("idle_right")
			controlled_node.direction=Vector2(1,0)
		Vector2(-1,0):
			controlled_node.animation_player.play("idle_left")
			controlled_node.direction=Vector2(-1,0)
		Vector2(0,1):
			controlled_node.animation_player.play("idle_up")
			controlled_node.direction=Vector2(0,1)
		Vector2(0,-1):
			controlled_node.animation_player.play("idle_down")
			controlled_node.direction=Vector2(0,-1)

func on_input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right"):
			state_machine.change_to("PlayerStateRunning")


func _on_health_component_on_dead() -> void:
	state_machine.change_to("PlayerStateDead")
