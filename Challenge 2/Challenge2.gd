extends Node2D


var x
var y
var z


func get_most():
	if x > y and x > z:
		return x
	elif y > x and y > z:
		return y
	else:
		return z
	

func get_least():
	if x < y and x < z:
		return x
	elif y < x and y < z:
		return y
	else:
		return z
