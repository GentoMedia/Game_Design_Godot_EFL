extends Node2D


var current_task = false
var directions = ""
var zoom_target = Vector2(1, 1)
var zoom_out_set = false
signal complete


func _process(delta):
	$Camera2D.current = current_task
	if $Camera2D.zoom.x <= zoom_target.x and $Camera2D.zoom.y <= zoom_target.y:
		zoom_target = Vector2(4, 4)
		zoom_out_set = true
		$Label.text = "Zoom out."
	if zoom_out_set:
		if $Camera2D.zoom.x >= zoom_target.x and $Camera2D.zoom.y >= zoom_target.y:
			$Camera2D.zoom = Vector2(1, 1)
			$Camera2D.current = false
			emit_signal("complete")
	$Camera2D.zoom.x = min($Camera2D.zoom.x, 4)
	$Camera2D.zoom.x = max($Camera2D.zoom.x, .8)
	$Camera2D.zoom.y = min($Camera2D.zoom.y, 4)
	$Camera2D.zoom.y = max($Camera2D.zoom.y, .8)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and event.pressed:
			$Camera2D.zoom	-= Vector2(0.1, 0.1)
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
			$Camera2D.zoom	+= Vector2(0.1, 0.1)
	
