extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 90
	
	print(test_array[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.rotation_degrees += 200 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0

	#print(Input.is_action_pressed("left"))
