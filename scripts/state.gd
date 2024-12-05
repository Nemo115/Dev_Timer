extends Node
class_name State

signal transition(new_state_name:StringName)

var sm_parent: StateMachine

func enter():
	pass
	
func exit():
	pass

func update(delta:float)->void:
	pass
