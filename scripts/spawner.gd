extends Node

@export var enemyStats: Resource
var currentRound = 1
var nEnemysRound = 2
var maxNRounds = 3 * Global.loop
var particle_scene: PackedScene = preload("res://scenes/spawn_particles.tscn")
var slime_scene: PackedScene = preload("res://scenes/slime.tscn")
var bat_scene: PackedScene = preload("res://scenes/bat_enemy.tscn")
var barrel_scene: PackedScene = preload("res://scenes/barrel.tscn")
@onready var spawnPoints: Array[Node2D] = [$Spawner,$Spawner2,$Spawner3,$Spawner4]
signal changeScene

var spawnOffset: Array[Vector2] = [Vector2(20,20),Vector2(-20,20),Vector2(20,-20),Vector2(-20,-20)]
var enemys_spawned = 0
#var lastEnemysWave
var EnemyPool = []




func _ready() -> void:
	currentRound = 0
	spawn_barrels()
	init_pool()
	
func init_pool():
	for i in maxNRounds*nEnemysRound:
		match randi_range(1,2):
			1:
				EnemyPool.append(slime_scene.instantiate())
			2:
				EnemyPool.append(bat_scene.instantiate())

func spawn_round():
	if (maxNRounds <= currentRound): return
	for i in range(nEnemysRound):		
		spawn_enemy(enemys_spawned ,spawn_location())
		enemys_spawned += 1
	currentRound += 1
	Global.round = currentRound
	Global.updateHUD.emit()
	#if(maxNRounds >= Global.round):
		#Global.updateHUD.emit()
		#Global.round += 1
		#lastEnemysWave = enemysSpawned
func spawn_enemy(enemys_spawned,spawnPos):
	if (enemys_spawned<EnemyPool.size()):
		#Particulas Spawneo
		var spawn_particles =  particle_scene.instantiate()
		spawn_particles.global_position = spawnPos
		spawn_particles.emitting = true
		get_parent().add_child(spawn_particles)
		await spawn_particles.finished
		#Enemigo Spawneo
		var enemy = EnemyPool[enemys_spawned]
		enemy.position = spawnPos
		enemy.stats = enemyStats
		get_parent().add_child(enemy)


func spawn_location():
	return spawnPoints[randi_range(0,3)].position + spawnOffset[randi_range(0,3)]
func spawn_barrels():
	for i in spawnPoints:
		var barrel = barrel_scene.instantiate()
		barrel.position = i.global_position
		add_child(barrel)

func check_enemys_alive() -> void:
	var enemysAlive = 0
	for i in EnemyPool:
		if i != null:
			enemysAlive += 1
	if enemysAlive == 0:
		Global.etage += 1
		changeScene.emit()
		
	

func next_round_timer() -> void:
	spawn_round()
