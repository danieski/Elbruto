extends Area2D
var base_y := 0.0


func _ready():
	base_y = position.y  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = base_y + sin(Time.get_ticks_msec() / 1000.0 * 2.0)


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	print("xd")
	queue_free()
