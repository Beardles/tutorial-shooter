extends CharacterBody2D

@export var movement_speed: int = 100

@onready var bug_sprite = $AnimatedSprite2D
@onready var hittable_component = $HittableComponent
@onready var attack_area = $AttackArea
@onready var notice_area = $NoticeArea
@onready var attack_timer = $AttackTimer
@onready var cool_guy_text = $CoolGuyText

var player_in_vision: bool = false
var player_in_range: bool = false
var can_attack: bool = false


func hit():
	hittable_component.hit()

func _ready():
	notice_area.connect("body_entered", _notice_player)
	notice_area.connect("body_exited", _ignore_player)
	attack_area.connect("body_entered", _start_attack)
	attack_area.connect("body_exited", _stop_attack)
	attack_timer.connect("timeout", _on_attack_timer_timeout)
	hittable_component.connect("on_hit", _on_hit)

func _process(delta):
	if player_in_vision:
		look_at(Globals.player_pos)
		var direction = global_position.direction_to(Globals.player_pos)
		var velocity = direction * movement_speed
		move_and_collide(velocity * delta)
		
		if not player_in_range:
			bug_sprite.play("walk")
		
		if can_attack and player_in_range:
			if bug_sprite.animation == "walk":
				bug_sprite.stop()
			can_attack = false
			bug_sprite.play("attack")
			attack_timer.start()
	
func _notice_player(_body):
	player_in_vision = true
	cool_guy_text.visible = true
	

func _ignore_player(_body):
	player_in_vision = false
	cool_guy_text.visible = false
	bug_sprite.stop()

func _start_attack(_body):
	player_in_range = true
	can_attack = true

func _stop_attack(_body):
	player_in_range = false
	can_attack = false

func _on_attack_timer_timeout():
	can_attack = true
	if bug_sprite.animation == "attack":
		bug_sprite.stop()

func _on_hit(is_hit: bool):
	if is_hit:
		bug_sprite.material.set_shader_parameter("progress", 1)
	else:
		bug_sprite.material.set_shader_parameter("progress", 0)
