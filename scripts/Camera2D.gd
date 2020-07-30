extends Camera2D

onready var Globals = get_node("/root/Globals")

export var camera_rotating = false
export var camera_zooming = false
export var camera_squish = false

export var spin_degrees = 20
export var zoom_amount = Vector2(0.05, 0.05)

func _on_Game_hit(body):	
	if camera_rotating:
		rotation_degrees += spin_degrees
	
	if camera_zooming:
		zoom += zoom_amount
	
	if camera_squish:
		zoom.x += zoom_amount.x


func _on_Game_game_start():
	camera_rotating = Globals.camera_rotating
	camera_zooming = Globals.camera_zooming
	camera_squish = Globals.camera_squish
