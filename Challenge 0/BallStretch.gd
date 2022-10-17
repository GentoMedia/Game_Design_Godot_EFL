extends Node2D


var current_task = false
var directions = "The ball is too big!\nMake it smaller,\nPut it in the hole."
var dragging = false
var inHole = false
var onHoleEdge = false
var stretching = false
var verticalStretch = false
var horizontalStretch = true
signal complete


func _ready():
	pass
	

func _process(delta):
	if stretching:
		change_scale()
	$Frame.change_scale($Ball.scale)
	$Frame.position = $Ball.position
	if dragging:
		$Ball.position = get_viewport().get_mouse_position()
	

func _on_Ball_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and !stretching:
		if event.button_index == BUTTON_LEFT and event.pressed:
			dragging = true
	

func change_scale():
	var mouse_movement = get_viewport().get_mouse_position() - $Ball.position
	mouse_movement = Vector2(abs(mouse_movement.x), abs(mouse_movement.y))
	var new_scale = (mouse_movement - Vector2(4, 4)) / 70
	if horizontalStretch:
		$Ball.scale.x = new_scale.x
	elif verticalStretch:
		$Ball.scale.y = new_scale.y
	else:
		$Ball.scale = new_scale

func _on_Dot_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			stretching = true
			if abs(get_viewport().get_mouse_position().x - $Ball.position.x) < 6:
				verticalStretch = true
			if abs(get_viewport().get_mouse_position().y - $Ball.position.y) < 6:
				horizontalStretch = true
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and !event.pressed:
			stretching = false
			horizontalStretch = false
			verticalStretch = false
			if inHole and !onHoleEdge:
				emit_signal("complete")
			dragging = false


func _on_Hole_area_entered(area):
	if area.name == "Ball":
		inHole = true
	


func _on_Hole_area_exited(area):
	if area.name == "Ball":
		inHole = false
	

func _on_HoleEdge_area_entered(area):
	if area.name == "Ball":
		onHoleEdge = true
	

func _on_HoleEdge_area_exited(area):
	if area.name == "Ball":
		onHoleEdge = false
	
