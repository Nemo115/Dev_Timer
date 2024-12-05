extends TextureProgressBar
class_name Loading_Bar

@export_group("Test Time")
@export var test_min: float
@export var test_hour: int

@onready var timer: Timer = $Timer

var max_time: float

func _ready() -> void:
	#start_time(test_hour, test_min)
	Globals.loading_bar = self

func _process(delta):
	if !timer.is_stopped():
		value = max_value - timer.time_left

func start_time(h:float, m:float):
	var t: float = 60 * m + 3600 * h
	max_time = t
	max_value = t
	timer.wait_time = t
	timer.start()# need to convert hours and minutes to seconds

func timeout() -> void:
	Globals.update_task(Globals.task_state.FINISHED)
