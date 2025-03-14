class_name StateBase extends Node

#ref generica para rutilizar nodos

@onready var controlled_node:Node = self.owner

#ref maquina de estados

var state_machine:StateMachine

#Metodos en comun

func start():
	pass
func end():
	pass
