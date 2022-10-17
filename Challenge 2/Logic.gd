extends Control


onready var challenge2 = get_node("/root/Challenge2")
var regex = RegEx.new()
var next_button = false


func _ready():
	$VBoxContainer.visible = true
	regex.compile("[0-9]")
	var propList = (challenge2.get_property_list())
	var varList = []
	for i in propList:
		varList.append(i.name)
	if !varList.has("x") or !varList.has("y") or !varList.has("z"):
		script_error("Missing variable.", true)
	$Label.text = "What are 'x', 'y', and 'z'?"
	

func _on_Button_pressed():
	if next_button:
		for box in $VBoxContainer/InputBoxes.get_children():
			box.editable = true
			box.clear()
		$VBoxContainer/Button.text = "Submit"
		$Label.text = "What are 'x', 'y', and 'z'?"
		next_button = false
		
	else:
		$VBoxContainer/Button.disabled = true
		for box in $VBoxContainer/InputBoxes.get_children():
			box.editable = false
			var text_check = regex.search(box.text)
			if !text_check:
				script_error("Numbers only!", false)
				return
				
		challenge2.x = int($VBoxContainer/InputBoxes/xInput.text)
		challenge2.y = int($VBoxContainer/InputBoxes/yInput.text)
		challenge2.z = int($VBoxContainer/InputBoxes/zInput.text)
		
		if challenge2.has_method("get_most") && challenge2.has_method("get_least"):
			$Label.text = "The most is " + str(challenge2.get_most()) + "\n\n" + "The least is " + str(challenge2.get_least())
			next_button = true
			$VBoxContainer/Button.text = "Next"
			$VBoxContainer/Button.disabled = false
		else:
			script_error("Incorrect function.", true)
	

func script_error(errorText : String, crash : bool):
	$Label.text = errorText
	$Label.add_color_override("font_color", Color.red)
	if !crash:
		yield(get_tree().create_timer(3), "timeout")
		$Label.text = "Try again."
		$Label.add_color_override("font_color", Color.white)
		for box in $VBoxContainer/InputBoxes.get_children():
			box.editable = true
			box.clear()
		$VBoxContainer/Button.disabled = false

