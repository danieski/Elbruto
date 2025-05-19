extends CanvasLayer
@onready var player: player = $".."
@onready var hp: ProgressBar = $Panel/HBoxContainer/hp
@onready var n_round: Label = $Panel/HBoxContainer/PanelContainer/HBoxContainer/nRound
@onready var mp: ProgressBar = $Panel/HBoxContainer/mana
@onready var hp_stats: Label = $Panel2/HBoxContainer5/VBoxContainer/HBoxContainer/hp
@onready var dmg_stats: Label = $Panel2/HBoxContainer5/VBoxContainer/HBoxContainer3/dmg
@onready var mp_stats: Label = $Panel2/HBoxContainer5/VBoxContainer/HBoxContainer2/mp
@onready var atackspeed_stats: Label = $Panel2/HBoxContainer5/VBoxContainer/HBoxContainer4/atackspeed

func _ready() -> void:
	Global.updateHUD.connect(updateHUD)
	#hp.max_value = Global.player_max_hp 
	#hp.value = Global.player_current_hp
func _process(delta: float) -> void:
	%TextureProgressBar.value = %SkillCD.time_left
func updateHUD() -> void:
#Top 
	n_round.text = str(Global.round)
	hp.value = player.stats.hp
	hp.max_value = player.stats.max_hp
	mp.value = player.stats.mp
	mp.max_value = player.stats.max_mp
	
#Left
	hp_stats.text = str(player.stats.max_hp)
	mp_stats.text = str(player.stats.max_mp)
	dmg_stats.text = str(player.stats.damage)
	atackspeed_stats.text = str(player.stats.atackspeed)
	%TextureProgressBar.max_value = %SkillCD.wait_time
	%TextureProgressBar.texture_under = player.spellArray[player.selectionSpellCounter].sprite
	%TextureProgressBar.texture_progress = player.spellArray[player.selectionSpellCounter].spriteCD
	#%TextureProgressBar.
	#%TextureProgressBar.texture_under = player.spellArray[player.selectionSpellCounter].sprite
	#%TextureProgressBar.texture_progress = player.spellArray[player.selectionSpellCounter].sprite
