extends Node
class_name StateMachine

@export var current_state: State

var states : Dictionary = {}

func _ready():
	load_states()

func load_states():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.sm_parent = self
		else:
			push_warning("no states?")
	if current_state:
		current_state.enter()
