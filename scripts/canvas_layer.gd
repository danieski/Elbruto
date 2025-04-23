extends CanvasLayer

@onready var hearts := [$Heart,$Heart2,$Heart3]
@onready var game_over: Label = $GameOver

var lifeCounter=0;
func update_hearts():
	hearts[lifeCounter].visible =  false
	lifeCounter+=1;
	
func showGameOver():
	game_over.visible = true
