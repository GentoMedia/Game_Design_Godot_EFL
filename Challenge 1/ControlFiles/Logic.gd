extends VBoxContainer


onready var studentScript = get_node("/root/Challenge1")
onready var x = studentScript.get("x")
onready var y = studentScript.get("y")
onready var z = studentScript.get("z")

func _ready():
	if studentScript.get("class_number_name"):
		$nameLabel.text = $nameLabel.text + studentScript.class_number_name
		$nameLabel.add_color_override("font_color", Color.green)
		$xLabel.text = "Checking x ... "
		yield(get_tree().create_timer(3.0), "timeout")
		if x:
			if studentScript.x == 5:
				x = true
				$xLabel.text = "x = " + str(studentScript.x) + "  -->  Good!"
				$xLabel.add_color_override("font_color", Color.green)
			else:
				x = false
				$xLabel.text = "x = " + str(studentScript.x) + "  -->  Try again!"
				$xLabel.add_color_override("font_color", Color.red)
		else:
			$xLabel.text = "no x  -->  Try again!"
			$xLabel.add_color_override("font_color", Color.red)
		
		$yLabel.text = "Checking y ... "
		yield(get_tree().create_timer(3.0), "timeout")
		if y:
			if studentScript.y == 4:
				y = true
				$yLabel.text = "y = " + str(studentScript.y) + "  -->  Good!"
				$yLabel.add_color_override("font_color", Color.green)
			else:
				y= false
				$yLabel.text = "y = " + str(studentScript.y) + "  -->  Try again!"
				$yLabel.add_color_override("font_color", Color.red)
		else:
			$yLabel.text = "no y  -->  Try again!"
			$yLabel.add_color_override("font_color", Color.red)

		$zLabel.text = "Checking z ... "
		yield(get_tree().create_timer(3.0), "timeout")
		if z:
			if studentScript.z == 7:
				z = true
				$zLabel.text = "z = " + str(studentScript.z) + "  -->  Good!"
				$zLabel.add_color_override("font_color", Color.green)
			else:
				z = false
				$zLabel.text = "z = " + str(studentScript.z) + "  -->  Try again!"
				$zLabel.add_color_override("font_color", Color.red)
		else:
			$zLabel.text = "no z  -->  Try again!"
			$zLabel.add_color_override("font_color", Color.red)
			
		if x and y and z:
			if studentScript.has_method("add_numbers"):
				studentScript.add_numbers()
				$funcLabel.text = "add_numbers ... running ..."
				yield(get_tree().create_timer(3.0), "timeout")
				if studentScript.z == 9:
					studentScript.x = 1
					studentScript.y = 2
					studentScript.z = 0
					studentScript.add_numbers()
					if studentScript.z == 3:
						$funcLabel.text = "FUNCTION: z = 9  -->  Good!"
						$funcLabel.add_color_override("font_color", Color.green)
					else:
						$funcLabel.text = "Function incorrect  -->  Try again!"
						$funcLabel.add_color_override("font_color", Color.red)
				else:
					$funcLabel.text = "Function incorrect  -->  Try again!"
					$funcLabel.add_color_override("font_color", Color.red)
			else:
				$funcLabel.text = "No 'add_numbers' function  -->  Try again!"
				$funcLabel.add_color_override("font_color", Color.red)
		else:
			$funcLabel.text = "Variables incomplete  -->  Try again!"
			$funcLabel.add_color_override("font_color", Color.red)
	else:
		$nameLabel.text = $nameLabel.text + "No Class, Number, Name!"
		$nameLabel.add_color_override("font_color", Color.red)
		$xLabel.text = "No Class, Number, Name!"
		$xLabel.add_color_override("font_color", Color.red)
		$yLabel.text = "No Class, Number, Name!"
		$yLabel.add_color_override("font_color", Color.red)
		$zLabel.text = "No Class, Number, Name!"
		$zLabel.add_color_override("font_color", Color.red)
		$funcLabel.text = "No Class, Number, Name!"
		$funcLabel.add_color_override("font_color", Color.red)
