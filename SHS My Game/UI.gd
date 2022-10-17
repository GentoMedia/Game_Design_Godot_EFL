extends Control



func _on_Ball_win():
	$WinLabel.show()
	get_tree().paused = true
	$WinSound.play()


func _on_Ball_ouch():
	$OuchLabel.show()
	get_tree().paused = true
	$OuchSound.play()
