extends Control
class_name Menu

@export var hour_entry: LineEdit
@export var min_entry: LineEdit
@export var task_name: LineEdit

func _ready() -> void:
	Globals.menu = self

func button_pressed() -> void:
	if(hour_entry.text != "" or min_entry.text != ""):
		var min: float = min_entry.text.to_float()
		var hour: float = hour_entry.text.to_float()
		Globals.update_task(Globals.task_state.LOADING)
		Globals.loading_bar.start_time(hour, min)
		Globals.task_label.text = task_name.text
