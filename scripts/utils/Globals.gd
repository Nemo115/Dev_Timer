extends Node

var loading_bar: Loading_Bar
var menu: Menu
var finish_button: Button
var task_label: Label

enum task_state{MENU, LOADING, FINISHED}

var cur: task_state = task_state.MENU

signal task_changed

## Call this method to change task
func update_task(new: task_state):
	cur = new
	task_changed.emit()
