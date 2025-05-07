extends CanvasLayer

@onready var hearts := [$HBoxContainer4/Heart,$HBoxContainer4/Heart2,$HBoxContainer4/Heart3]
@onready var game_over: Label = $GameOver
@onready var n_round: Label = $Rounds2/NRound

var lifeCounter=0;
func update_hearts():
	hearts[lifeCounter].visible =  false
	lifeCounter+=1;
	
func showGameOver():
	game_over.visible = true

func _on_spawner_changing_round(nRound) -> void:
	n_round.text = str(nRound)
