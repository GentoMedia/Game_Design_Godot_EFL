extends Node2D

func _process(delta):
	var move_vector = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		move_vector.y -= 200
	if Input.is_action_pressed("ui_down"):
		move_vector.y += 200
	if Input.is_action_pressed("ui_left"):
		move_vector.x -= 200
	if Input.is_action_pressed("ui_right"):
		move_vector.x += 200
		
	$Player.move_and_slide(move_vector*2)
	
