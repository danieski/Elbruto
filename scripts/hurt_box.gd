extends Area2D
class_name HurtBox
@export var damage: int = 1
func _ready() -> void:
	area_entered.connect(hit)
	#if(get_parent().stats.damage != null):
	#	damage=get_parent().stats.damage

func hit(area):
	#Gotta check that you are in different group 
	if area is HitBox and !area.is_in_group(self.get_groups()[0]) 	:
		area.take_damage(damage)
