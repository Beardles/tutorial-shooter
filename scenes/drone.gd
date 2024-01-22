extends Node2D

var direction: String = "right"
var directionMap = {
	"left": -250,
	"right": 250
}

func _process(delta):
	
	if position.x > 1100:
		direction = "right"
	elif position.x == 0:
		direction = "left"
		
	print(directionMap[direction])
	position.x += directionMap[direction] * delta
