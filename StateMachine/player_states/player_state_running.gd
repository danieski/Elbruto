extends StateBase


func on_physics_process(delta):
	controlled_node.velocity=Vector2.ZERO
			
	if Input.is_action_pressed("ui_right"):
		controlled_node.velocity.x = controlled_node.SPEED*delta
		controlled_node.animation_player.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		controlled_node.velocity.x = -controlled_node.SPEED*delta
		controlled_node.animation_player.play("walk_left")
	elif Input.is_action_pressed("ui_up"):
		controlled_node.velocity.y = -controlled_node.SPEED*delta
		controlled_node.animation_player.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		controlled_node.velocity.y = controlled_node.SPEED*delta
		controlled_node.animation_player.play("walk_down")	
	if controlled_node.velocity == Vector2.ZERO:
		state_machine.change_to("PlayerStateIdle")
