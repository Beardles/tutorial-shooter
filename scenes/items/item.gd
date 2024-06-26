extends Area2D

var rotation_speed: int = 4
var available_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]
var type_to_color_map = {
	'laser': Color(0.1, 0.2, 0.8),
	'grenade': Color(0.8, 0.2, 0.1),
	'health': Color(0.1, 0.8, 0.1)
}
var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	$Sprite2D.modulate = type_to_color_map.get(type)
	
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0,0))


func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	if type == 'health':
		Globals.health += 10
	queue_free()
