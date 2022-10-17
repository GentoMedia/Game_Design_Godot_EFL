extends Node2D


var current_task = false
var directions = "Look at the ball."
var camera_captured = false
var mouse_start
signal complete


func _process(delta):
	$Camera2D.current = current_task
	if current_task and camera_captured:
		$Camera2D.position -= get_global_mouse_position() - mouse_start
		$Camera2D.position.x = min($Camera2D.position.x, 1024)
		$Camera2D.position.x = max($Camera2D.position.x, 0)
		$Camera2D.position.y = min($Camera2D.position.y, 600)
		$Camera2D.position.y = max($Camera2D.position.y, 0)
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_MIDDLE and event.pressed:
			camera_captured = true
			mouse_start = get_global_mouse_position()
		if event.button_index == BUTTON_MIDDLE and !event.pressed:
			camera_captured = false
	

func _on_GoalArea_area_entered(area):
	if area.name == "Ball":
		yield(get_tree().create_timer(1.5), "timeout")
		camera_captured = false
		$Camera2D.position = Vector2(512, 300)
		emit_signal("complete")
	
