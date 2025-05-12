extends Control
func _ready() -> void:
	%CanvasLayer.visible = false


func _on_exit_pressed() -> void:
	%CanvasLayer.visible = false
func shop_open():
	%CanvasLayer.visible = true
	%Money.text = str(Global.money)


func hpUp() -> void:

	if(Global.money >= 1 && Global.player_stats.max_hp > Global.player_stats.hp):

		Global.money -= 1
		Global.on_player_heal(1)
		%Money.text = str(Global.money)
		Global.updateHUD.emit()



func mpUp() -> void:
	if(Global.money >= 1 && Global.player_stats.max_mp > Global.player_stats.mp):
		Global.money -= 1
		Global.on_player_mpUp(1)
		%Money.text = str(Global.money)
		Global.updateHUD.emit()
