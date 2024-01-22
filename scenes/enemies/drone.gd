extends CharacterBody2D

var direction: String = "right"
var directionMap = {
	"left": -250,
	"right": 250
}

func _process(_delta):
	# direction
	var direction = Vector2.RIGHT
	
	# velocity
	velocity = direction * 100

	# move_and_slide
	move_and_slide()
