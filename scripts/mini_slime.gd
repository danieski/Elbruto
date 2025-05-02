extends CharacterBody2D
var followAt: CharacterBody2D
func _physics_process(delta: float) -> void:
	jump()
	move_and_slide() 
	pass
func jump():
	#Vector2 playerPos = get_parent().get_node("")
	if(followAt!=null):
		var direction =(followAt.position-position).normalized()
		velocity=direction*10
	else:
		velocity = Vector2.ZERO
	
	pass
func _on_sensor_player_detected(player: Node2D) -> void:
	followAt = player
	print(followAt)
	pass
