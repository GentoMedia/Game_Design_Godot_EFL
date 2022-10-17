extends Node2D


var tasks
var taskCounter
signal tab

var ballMove = preload("res://BallMove.tscn")
var ballStretch = preload("res://BallStretch.tscn")
var zooming = preload("res://Zooming.tscn")
var moveViewport = preload("res://MoveViewport.tscn")

func _ready():
	tasks = [ballMove, ballStretch, zooming, moveViewport]
	taskCounter = 0
	next_task()

func set_text(text : String, color : Color):
	$Control/Label.text = text
	$Control/Label.add_color_override("font_color", color)
	

func next_task():
	$current_task.queue_free()
	if taskCounter >= tasks.size():
		set_text("You finished!\nGreat job!\n\n(Tell Your Teacher)", Color.green)
	else:
		set_text("Good job!\n\n\n(Press Tab)", Color.green)
		yield(self, "tab")
		var task = tasks[taskCounter].instance()
		add_child(task)
		task.connect("complete", self, "next_task")
		task.name = "current_task"
		set_text(task.directions, Color.white)
		task.visible = true
		task.current_task = true
	taskCounter += 1
	

func _input(event):
	if event is InputEventKey:
		if event.physical_scancode == KEY_TAB and event.pressed:
			emit_signal("tab")
