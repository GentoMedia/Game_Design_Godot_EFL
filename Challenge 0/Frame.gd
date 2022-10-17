extends Node2D


var lines = []


func _ready():
	lines = [$LeftLine, $RightLine, $TopLine, $BottomLine]
	for line in lines:
		line.scale.x = 1.5
	$TopLine.rotate(1.5708)
	$BottomLine.rotate(1.5708)
	

func change_scale(new_scale : Vector2):
	$LeftLine.scale.y = new_scale.y * 2
	$RightLine.scale.y = new_scale.y * 2
	$TopLine.scale.y = new_scale.x * 2
	$BottomLine.scale.y = new_scale.x * 2
	
	$LeftLine.position.x = new_scale.x * -70
	$RightLine.position.x = new_scale.x * 70
	$TopLine.position.y = new_scale.y * -70
	$BottomLine.position.y = new_scale.y * 70
	
	$TopLeft.position = (new_scale * -70) - Vector2(4, 4)
	$TopRight.position = (new_scale * Vector2(70, -70)) + Vector2(4, -4)
	$BottomRight.position = (new_scale * 70) + Vector2(4, 4)
	$BottomLeft.position = (new_scale * Vector2(-70, 70)) + Vector2(-4, 4)
	
	$Top.position.y = (new_scale.y * -70) - 6
	$Bottom.position.y = (new_scale.y * 70) + 6
	$Left.position.x = (new_scale.x * -70) - 6
	$Right.position.x = (new_scale.x * 70) + 6
