extends Node
@export var enemyStats: Resource
@export var number_of_enemys = 0
@export var nEnemysEachRound = 2
@export var maxNRounds = 3
var particle_scene: PackedScene = preload("res://scenes/spawn_particles.tscn")
var slime_scene: PackedScene = preload("res://scenes/slime.tscn")
var bat_scene: PackedScene = preload("res://scenes/bat_enemy.tscn")
@onready var spawnPoints: Array[Node2D] = [$Spawner,$Spawner2,$Spawner3,$Spawner4]


var spawnOffset: Array[Vector2] = [Vector2(20,20),Vector2(-20,20),Vector2(20,-20),Vector2(-20,-20)]
var enemysSpawned =0
var lastEnemysWave
var arrayEnemigos = []




func _ready() -> void:
	#$Spawner/SpawnParticles.restart()
	preparePool()
	Global.round = 1
	pass
	
func preparePool():
	for i in number_of_enemys:
		match randi_range(1,2):
			1:
				arrayEnemigos.append(slime_scene.instantiate())
			2:
				arrayEnemigos.append(bat_scene.instantiate())
		
func spawnRound():
	var nEnemysRound = Global.round * nEnemysEachRound
	
	for i in range(nEnemysRound):		
		spawnEnemy(enemysSpawned ,selectSpawner())
		enemysSpawned += 1

	if(maxNRounds >= Global.round):
		Global.updateHUD.emit()
		Global.round += 1
		lastEnemysWave = enemysSpawned
func spawnEnemy(enemysSpawned,spawnPos):
	if (enemysSpawned<arrayEnemigos.size()):
		var spawn_particles =  particle_scene.instantiate()
		spawn_particles.global_position = spawnPos
		spawn_particles.emitting = true
		get_parent().add_child(spawn_particles)
		await spawn_particles.finished

		var enemy = arrayEnemigos[enemysSpawned]
		enemy.position = spawnPos
		enemy.stats = enemyStats

			
		get_parent().add_child(enemy)


func selectSpawner():
	return spawnPoints[randi_range(0,3)].position + spawnOffset[randi_range(0,3)]


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
	
