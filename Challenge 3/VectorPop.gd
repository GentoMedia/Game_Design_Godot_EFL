extends Popup


var regex = RegEx.new()
var x
var y
signal new_pos


func _ready():
	regex.compile("[0-9]")
	

func _on_Button_pressed():
	var check_x = regex.search($VBoxContainer2/HBoxContainer/LineEditx.text)
	var check_y = regex.search($VBoxContainer2/HBoxContainer/LineEdity.text)
	
	if !check_x or !check_y:
		pass
	else:
		x = $VBoxContainer2/HBoxContainer/LineEditx.text
		y = $VBoxContainer2/HBoxContainer/LineEdity.text
		emit_signal("new_pos", Vector2(x, y))
	
	$VBoxContainer2/HBoxContainer/LineEditx.clear()
	$VBoxContainer2/HBoxContainer/LineEdity.clear()
	

func _input(event):
	if event is InputEventKey:
		if visible and event.pressed:
			if event.scancode == KEY_ENTER or event.scancode == KEY_KP_ENTER:
				_on_Button_pressed()
	
