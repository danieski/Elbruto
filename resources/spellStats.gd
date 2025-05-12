extends Resource
class_name SpellStats

enum TYPES{
	FIRE,
	WIND,
	ICE,
	EARTH
}
@export var type: TYPES
@export var damage:int
@export var Speed:float
@export var cooldown: float
@export var cost: int
@export var sprite: Texture
@export var spriteCD: Texture
