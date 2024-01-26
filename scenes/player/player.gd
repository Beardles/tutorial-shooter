extends CharacterBody2D

signal laser(pos)
signal grenade

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		# randomly selected a marker 2D for the laser starting position
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		# emit the position we selected
		laser.emit(selected_laser.global_position)
		
	# grenade launching input
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade.emit(pos)





func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true
