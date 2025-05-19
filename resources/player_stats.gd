class_name PlayerStats
extends Resource

@export var hp := 5
@export var mp := 5
@export var max_hp := 5
@export var max_mp := 5
@export var damage := 1.0
@export var atackspeed := 1.0

@export var spell: SPELLS

enum SPELLS{
	Fire,
	Wind,
	Earth,
	Ice
}
