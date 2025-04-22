extends CanvasLayer

@onready var hearts := [$Heart,$Heart2,$Heart3]
@onready var heart: TextureRect = $Heart
@onready var heart_2: TextureRect = $Heart2
@onready var heart_3: TextureRect = $Heart3

var max_health := 3
var current_health := 3
var test=0;
func update_hearts():
	test+=1;
	print(test);
	if (test==1):
		heart.visible=false
	elif (test==2):
		heart_2.visible=false
	elif (test==3):
		heart_3.visible=false
	
