extends Node
var has_apple = false
var etage = 1
func getOutside():
	
	match etage:
		1:
			get_tree().change_scene_to_file("res://scenes/game.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/water_lvl.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/castillo.tscn")
