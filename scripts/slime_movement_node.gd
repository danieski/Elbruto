extends Node
@onready var slime: CharacterBody2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var animation_tree: AnimationTree = $"../AnimationTree"
signal kill_confirm

func _ready() -> void:
	animation_player.play("walking")
	pass
	
func _physics_process(delta: float) -> void:
	slime.move_and_slide()

func jump():
	if(slime.followAt != null):
		var direction = (slime.followAt.position - slime.position).normalized()
		slime.velocity = direction * slime.SPEED
	else:
		noJump()
	
func noJump():
	slime.velocity = Vector2.ZERO



func _on_health_component_on_damage_took() -> void:
	slime.anim.play("hit")
	await slime.anim.animation_finished
	slime.anim.play("walking")



func _on_health_component_on_dead() -> void:
	var slimeMinion = slime.slime_scene.instantiate()
	slimeMinion.position = slime.position + Vector2(25, 5)
	slime.get_parent().add_child(slimeMinion)
	kill_confirm.emit()
	slime.anim.play("dead")



func _on_sensor_player_detected(body: Node) -> void:
	slime.followAt = body
	jump()

func _on_sensor_player_lost() -> void:
	slime.followAt = null


func _on_health_component_on_damage_taken() -> void:
	pass # Replace with function body.
