extends Node2D

var pos: Vector2 = Vector2.ZERO
var test_scale: float = 1

const speed: int = 200

func _ready():
	pos = Vector2(300, 200)
	position = pos
	
	var test_rotation = 45
	rotation_degrees = rad_to_deg(test_rotation)
	
	test_scale = 2
	scale = Vector2(test_scale,test_scale)
	print($"..".test_array)
	$"..".test_function()

func _process(delta):
	pos.x += speed * delta
	position = pos

	 #test_scale += 0.1
	 #set_scale(Vector2(test_scale, test_scale))
