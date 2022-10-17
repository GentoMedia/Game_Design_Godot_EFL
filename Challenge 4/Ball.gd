extends KinematicBody2D


var in_hole = false
signal wall_hit
signal win


func _process(_delta):
	if move_and_collide(Vector2(0,0)):
		emit_signal("wall_hit")
		hide()
	
	if in_hole:
		scale -= Vector2(.04, .04)
	
	if scale.x < .1:
		hide()
		emit_signal("win")
	

func _on_Hole_body_entered(body):
	if body.name == "Ball":
		in_hole = true
