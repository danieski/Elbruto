extends CanvasLayer

@onready var hp: ProgressBar = $Panel/HBoxContainer/VBoxContainer/hp

@onready var game_over: Label = $GameOver
@onready var n_round: Label = $Rounds2/NRound
var lifeCounter=0;
func _ready() -> void:
	hp.max_value = Global.player_max_hp 
	hp.value = Global.player_current_hp
func _on_spawner_changing_round(nRound) -> void:
	n_round.text = str(nRound)


func _on_health_component_on_damage_taken() -> void:
	hp.value = hp.value - 1
	Global.player_current_hp = hp.value
	


func _on_health_component_on_dead() -> void:
	hp.value = 0
	Global.player_current_hp = 0
