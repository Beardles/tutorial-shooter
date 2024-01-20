extends Node2D

var pos: Vector2 = Vector2.ZERO
var test_scale: float = 1

const speed: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 200)
	position = pos # Replace with function body.
	
	var test_rotation = 45
	rotation_degrees = rad_to_deg(test_rotation)
	
	test_scale = 2
	set_scale(Vector2(test_scale,test_scale))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos.x += speed
	position = pos
	test_scale += 0.1
	
	#set_scale(Vector2(test_scale, test_scale))