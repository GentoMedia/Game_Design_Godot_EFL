extends Node2D


func _ready():
	start_game()


func _on_Button_pressed():
	$VectorPop.popup()
	$Button.hide()


func _on_VectorPop_new_pos(_pos : Vector2):
	$VectorPop.hide()
	$Button.show()


func _on_Hole_body_entered(body):
	if body.name == "Ball":
		var hole_pos = $Hole.position + Vector2(32, 32)
		hole_pos /= 64
		body.set_next_pos(hole_pos)
		$Button.hide()
		$VectorPop.hide()
		$Ball.finished = true
		yield(get_tree().create_timer(1), "timeout")
		$Finish.show()
		

func start_game():
	$Finish.text = "Put the\nball in\nthe hole."
	yield(get_tree().create_timer(3),"timeout")
	$Button.show()
	$Finish.hide()
	$Finish.text = "Good job!"


func _on_Ball_ball_hit():
	$Ouch.show()
	$Button.hide()
	$VectorPop.hide()
	$Ball.queue_free()
	yield(get_tree().create_timer(3), "timeout")
	if get_tree().reload_current_scene() == null:
		print("Error reloading scene")
	

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
