extends Node
var has_apple = false
var etage = 1
var player_max_hp = 3
var player_current_hp = 3
func updateHp():
	print("global informed")
	player_current_hp -= 1
func getOutside():
	
	match etage:
		1:
			get_tree().change_scene_to_file("res://scenes/game.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/water_lvl.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/castillo.tscn")
