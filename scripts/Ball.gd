extends RigidBody2D

onready var Globals = get_node("/root/Globals")

export var standard_speed = 350
export var funky_velocity = false
export var indecisive_ball = false

var reset = false
var speed
var rng

func _ready():
	connect("body_shape_entered", get_parent(), "_on_Ball_body_shape_entered")
	funky_velocity = Globals.funky_velocity
	indecisive_ball = Globals.indecisive_ball

func _integrate_forces(state):
	speed = standard_speed
	
	if linear_velocity.x > 250:
		linear_velocity.x = 250
	if linear_velocity.y > 250:
		linear_velocity.y = 250
		

	if funky_velocity:
		speed = (randi() % (speed * 2) + 20)
	
	if indecisive_ball:
		rng = randi() % 100
		if rng < 1:
			linear_velocity = -linear_velocity
		linear_velocity = linear_velocity * (randi() % 500 + 100)
	
	linear_velocity = linear_velocity.normalized() * speed

func _on_Game_game_start():
	funky_velocity = Globals.funky_velocity
	indecisive_ball = Globals.indecisive_ball

