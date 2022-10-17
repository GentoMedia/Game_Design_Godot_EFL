extends KinematicBody2D

signal win
signal ouch

func _process(delta):
	if move_and_collide(Vector2(0,0)):
		emit_signal("ouch")


func _on_Hole_body_entered(body):
	if body == self:
		emit_signal("win")
