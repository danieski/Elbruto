extends Node
var etage = 1
var money = 50
var round = 1
var loop = 1
var introduction = true
var player_stats = preload("res://resources/player_stats_resource.tres")
signal change_round(nRound)
signal updateHUD()
signal openShop()
func on_player_damage(damage):
	player_stats.hp = player_stats.hp-damage
	pass
func on_player_heal(heal):
	player_stats.hp = player_stats.hp+heal
	pass
func on_player_mpUp(mp):
	player_stats.mp = player_stats.mp+mp
	pass
func getInside():
	await get_tree().create_timer(2).timeout
	etage+=1
	get_tree().change_scene_to_file("res://scenes/interior.tscn")
func getOutside():
	if etage > 4:
		etage = 1
	match etage:
		1:
			get_tree().change_scene_to_file("res://scenes/game.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/water_lvl.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/castillo.tscn")
		4:
			get_tree().change_scene_to_file("res://scenes/boss_chambre.tscn")
			loop += 1
func openShopFunc():
	openShop.emit()
