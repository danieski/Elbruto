extends CharacterBody2D
const SPEED = 10
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var anim: AnimationPlayer
@export var followAt: CharacterBody2D
@export var stats: CharacterStats
@onready var actuallyFollowing = followAt
