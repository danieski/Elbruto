extends Control
@onready var hearts := [$Heart,$Heart2,$Heart3]
@onready var game_over: Label = $GameOver

var max_health := 3
var current_health := 3

func update_hearts():
	for i in range(max_health):
		hearts[i].visible = i < current_health

func showGameOver():
	game_over.visible = true
