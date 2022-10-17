extends Node2D


var current_task = false
var directions = "Put the ball in the hole."
var dragging = false
var inHole = false
signal complete


func _ready():
	pass
	

func _process(delta):
	if dragging:
		$Ball.position = get_viewport().get_mouse_position()
	

func _on_Ball_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			dragging = true
		if event.button_index == BUTTON_LEFT and !event.pressed:
			if inHole:
				emit_signal("complete")
			dragging = false
	

func _on_Hole_mouse_entered():
	inHole = true
	

func _on_Hole_mouse_exited():
	inHole = false
	
