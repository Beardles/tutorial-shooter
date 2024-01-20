extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

func _ready():
	$Logo.rotation_degrees = 90

func _process(delta):
	$Logo.rotation_degrees += 200 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
		
	#print(Input.is_action_pressed("left"))

func test_function():
	print('this is a test function')
