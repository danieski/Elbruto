extends Node
var slime_scene: PackedScene = preload("res://scenes/slime.tscn")
var bat_scene: PackedScene = preload("res://scenes/bat_enemy.tscn")
var round: int = 1
var arrayEnemigos = []
@export var number_of_enemys = 0
@export var nEnemysEachRound = 2
@export var maxNRounds = 3
var enemysSpawned =0
var lastEnemysWave
signal changingRound


func _ready() -> void:
	
	preparePool()
	print(arrayEnemigos.size())
	pass
	
func preparePool():
	for i in number_of_enemys:
		arrayEnemigos.append(slime_scene.instantiate())
		
func spawnRound():
	var nEnemysRound = round * nEnemysEachRound
	
	for i in range(nEnemysRound):		
		spawnSlime(enemysSpawned ,selectSpawner())
		enemysSpawned += 1

	if(maxNRounds>= round):
		changingRound.emit(round)
		round += 1
		lastEnemysWave = enemysSpawned
func spawnSlime(enemysSpawned,spawnPos):
	if (enemysSpawned<arrayEnemigos.size()):
		var slime = arrayEnemigos[enemysSpawned]
		slime.position = spawnPos
		slime.stats = load("res://resources/red.tres")
		add_child(slime)


func selectSpawner():
	return Vector2(randi_range(-50,50),randi_range(-50,50))
	



func _on_round_timer_2_timeout() -> void:
	spawnRound()




func _on_check_enemys_2_timeout() -> void:
	var enemysAlive = 0
	for i in arrayEnemigos:
		if i != null:
			enemysAlive += 1
	if enemysAlive == 0:
		Global.etage += 1
		get_tree().change_scene_to_file("res://scenes/interior.tscn")
	
