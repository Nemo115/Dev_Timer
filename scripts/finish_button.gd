extends Button

func _ready() -> void:
	Globals.finish_button = self


func _on_pressed() -> void:
	Globals.update_task(Globals.task_state.MENU)
