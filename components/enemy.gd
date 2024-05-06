class_name EnemyComponent
extends Node

@export var hittable_component: HittableComponent
@export var notice_area: Area2D
@export var attack_area: Area2D

signal notice_player(noticed: bool)
signal attack_player(attack: bool)

func _ready():
	notice_area.connect("body_entered", _look_at_player)
	notice_area.connect("body_exited", _ignore_player)
	attack_area.connect("body_entered", _start_attack)
	attack_area.connect("body_exited", _stop_attack)
	

func _look_at_player(_body):
	hittable_component.actor.look_at(Globals.player_pos)

func _ignore_player(_body):
	print('ignored')

func _start_attack(_body):
	print('attacking')

func _stop_attack(_body):
	print('stop attack')
