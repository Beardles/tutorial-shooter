class_name HittableComponent
extends Node

@export var actor: CharacterBody2D
@export var invulnerable_time: float
@export var health: int

signal on_hit(is_hit: bool)

var is_vulnerable: bool = true

func hit():
	if is_vulnerable:
		on_hit.emit(true)
		health -= 10
		is_vulnerable = false
		await get_tree().create_timer(invulnerable_time).timeout
		on_hit.emit(false)
		is_vulnerable = true
		
	if health <= 0:
		actor.queue_free()
