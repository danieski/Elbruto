extends Node
@onready var slime: CharacterBody2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var animation_tree: AnimationTree = $"../AnimationTree"


func _ready() -> void:
	slime.anim.play("walking")
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
	#slime.anim.play("idle")
	slime.velocity = Vector2.ZERO



func _on_health_component_on_damage_took() -> void:
	slime.anim.play("hit")
	await slime.anim.animation_finished
	slime.anim.play("walking")



func _on_health_component_on_dead() -> void:
	slime.anim.play("dead")
	pass # Replace with function body.


func _on_sensor_player_detected() -> void:
	slime.actuallyFollowing = slime.followAt


func _on_sensor_player_lost() -> void:
	slime.actuallyFollowing = null
