extends KinematicBody2D


var next_pos = Vector2()
var finished = false
signal ball_hit


func _ready():
	next_pos = position
	

func _process(_delta):
	if next_pos.distance_to(position) > 2:
		var move_direction = next_pos - position
		move_direction = move_direction.normalized()
		if move_and_collide(move_direction * 4):
			emit_signal("ball_hit")
	else:
		position = next_pos
		
	if finished:
		scale -= Vector2(.04, .04)
		if scale.x < .1:
			queue_free()
	

func set_next_pos(pos : Vector2):
	next_pos = pos
	next_pos *= 64
	next_pos -= Vector2(32, 32)
	
