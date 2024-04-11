extends Node2D

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)
	


func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = Vector2.UP * 100
	$Projectiles.add_child(grenade)
