extends KinematicBody2D

onready var Globals = get_node("/root/Globals")

var speed = 13
var move_direction

func _physics_process(delta):
	move_direction = -int(Input.is_action_pressed("left")) + int(Input.is_action_pressed("right"))
	position.x = max($CollisionShape2D.shape.extents.x, min(position.x + speed * move_direction, Globals.WINDOW.x - $CollisionShape2D.shape.extents.x))
