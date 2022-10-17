extends Node2D

var speed = 200
var direction = Vector2(0, 0)
var move_up = false
var move_down = false
var move_left = false
var move_right = false


func _process(delta):
	direction = Vector2(0, 0)
	
	if move_up:
		direction.y -= 1
	if move_down:
		direction.y += 1
	if move_left:
		direction.x -= 1
	if move_right:
		direction.x += 1
	
	$Ball.move_and_slide(direction * speed)


func _input(event):
	if event is InputEventKey and event.scancode == KEY_UP:
		move_up = event.pressed
	if event is InputEventKey and event.scancode == KEY_DOWN:
		move_down = event.pressed
	if event is InputEventKey and event.scancode == KEY_LEFT:
		move_left = event.pressed
	if event is InputEventKey and event.scancode == KEY_RIGHT:
		move_right = event.pressed

