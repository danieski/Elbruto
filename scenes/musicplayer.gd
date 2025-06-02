extends Node

func _ready():
	set_process(false)
	get_tree().get_root().add_child(self)
	self.owner = null  # Evita que se borre al cambiar de escena
