extends Node2D

var control_engaged: bool = false

@onready var mccaulley: AnimatedSprite2D = $mccaulley

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_action_pressed("control_engage"):
		control_engaged = !control_engaged
	if control_engaged and event.is_action_pressed("toggle_sprite"):
		mccaulley.visible = !mccaulley.visible

func _ready() -> void:
	Globals.task_changed.connect(update_task)
	Globals.update_task(Globals.task_state.MENU)

func _process(delta):
	if control_engaged:
		var vel: Vector2 = Vector2.ZERO
		vel.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		vel.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		DisplayServer.window_set_position(DisplayServer.window_get_position() + Vector2i(vel*5.0))

func update_task():
	Globals.loading_bar.visible = Globals.cur == Globals.task_state.LOADING or Globals.cur == Globals.task_state.FINISHED
	Globals.menu.visible = Globals.cur == Globals.task_state.MENU
	Globals.finish_button.visible = Globals.cur == Globals.task_state.FINISHED
	Globals.task_label.visible = Globals.cur != Globals.task_state.FINISHED
	
