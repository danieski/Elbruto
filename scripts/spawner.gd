extends Node
var slime_scene: PackedScene = preload("res://scenes/slime.tscn")
var bat_scene: PackedScene = preload("res://scenes/bat_enemy.tscn")
var round: int = 1
var arrayEnemigos = []
@export var number_of_enemys = 5
@export var nRoundsMax = 3
signal changingRound


func _ready() -> void:
	var test = slime_scene.instantiate()
	test.stats = load("res://resources/red.tres")
	add_child(test)
	preparePool()
	pass
	
func preparePool():
	for i in number_of_enemys:
		arrayEnemigos.append(slime_scene.instantiate())
		
func spawnRound():
	match round:
		1:
			for i in int(number_of_enemys/3):
				print("Round1")
				spawnSlime(i ,selectSpawner())
		2:
			for i in range(number_of_enemys/3,number_of_enemys/3+number_of_enemys/3):
				print("Round2")
				spawnSlime(i, selectSpawner())
		3:
			for i in range(number_of_enemys/3-number_of_enemys,number_of_enemys):
				print("round3")
				spawnSlime(i, selectSpawner())
func spawnSlime(numberSpawn,spawnPos):
	var slime = arrayEnemigos[numberSpawn]
	slime.position = spawnPos
	slime.stats = load("res://resources/red.tres")
	add_child(slime)

func selectSpawner():
	return Vector2(randi_range(-50,50),randi_range(-50,50))
	



func _on_round_timer_2_timeout() -> void:
	if nRoundsMax>round:
			spawnRound()
			round+=1
			changingRound.emit(round)



func _on_check_enemys_2_timeout() -> void:
	
	var nEnemysAlive = 0
	
	for i in arrayEnemigos:
		if i != null:
			return
		else:
			nEnemysAlive+=1
			
	if nEnemysAlive == arrayEnemigos.size():
		
		Global.etage += 1
		get_tree().change_scene_to_file("res://scenes/interior.tscn")
