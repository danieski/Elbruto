extends Area2D
signal player_detected
signal player_lost

func _on_body_entered(body: Node2D) -> void:
	player_detected.emit(body)
	print(get_parent().name ," has detected: ", body.name )

func _on_body_exited(body: Node2D) -> void:
	player_lost.emit()
