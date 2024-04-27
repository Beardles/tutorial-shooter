extends Area2D

var rotation_speed: int = 4
var available_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]
var type_to_color_map = {
	'laser': Color(0.1, 0.2, 0.8),
	'grenade': Color(0.8, 0.2, 0.1),
	'health': Color(0.1, 0.8, 0.1)
}

func _ready():
	$Sprite2D.modulate = type_to_color_map.get(type)


func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
