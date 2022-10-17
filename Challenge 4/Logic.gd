extends Control




func _ready():
	$Label.hide()
	$OuchLabel.hide()


func _on_Ball_wall_hit():
	$OuchLabel.show()
	get_tree().paused = true
	yield(get_tree().create_timer(3), "timeout")
	get_tree().paused = false
	if get_tree().reload_current_scene() == null:
		print("Error reloading scene.")


func _on_Ball_win():
	$Label.show()
	$Label.text = "Good job!"
	get_tree().paused = true


