extends Node
@onready var player: CharacterBody2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")
enum STATE {
	IDLE,
	RUNNING,
}

var current_state:STATE = STATE.IDLE
func _physics_process(delta: float) -> void:
	match current_state:
		STATE.IDLE:
			if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right"):
				current_state = STATE.RUNNING
			player.velocity=Vector2.ZERO
			animation_player.stop()
		STATE.RUNNING:	
			player.velocity=Vector2.ZERO
			
			if Input.is_action_pressed("ui_right"):
				player.velocity.x = player.SPEED*delta
				animation_player.play("walk_right")
			elif Input.is_action_pressed("ui_left"):
				player.velocity.x = -player.SPEED*delta
				animation_player.play("walk_left")
			elif Input.is_action_pressed("ui_up"):
				player.velocity.y = -player.SPEED*delta
				animation_player.play("walk_up")
			elif Input.is_action_pressed("ui_down"):
				player.velocity.y = player.SPEED*delta
				animation_player.play("walk_down")
			
			if player.velocity == Vector2.ZERO:
				current_state = STATE.IDLE
	
	player.move_and_slide()		
	
