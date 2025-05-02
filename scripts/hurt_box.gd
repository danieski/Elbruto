extends Area2D
class_name HurtBox
@export var damage: int = 1
func _ready() -> void:
	area_entered.connect(hit)
	

func hit(area):
	print("I am: ", self.get_parent().name)
	print("Im in the group: ",self.get_groups()[0])
	print("Im colliding wiht mr ", area.get_parent().name)
	print("Im in the same group as the area im touching: ", area.is_in_group(self.get_groups()[0]))
	if area is HitBox and !area.is_in_group(self.get_groups()[0]) 	:
		area.take_damage(damage)
