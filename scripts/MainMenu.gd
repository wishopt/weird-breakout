extends Control

onready var Globals = get_node("/root/Globals")

var switchable = true

func _ready():
	Globals.camera_rotating = false
	Globals.camera_zooming = false
	Globals.camera_squish = false
	Globals.funky_velocity = false
	Globals.indecisive_ball = false
	
func _physics_process(delta):
	$Camera2D.position += Vector2(-3, -1)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")


func _on_Rotation_toggled(button_pressed):
	Globals.camera_rotating = button_pressed


func _on_Zoom_toggled(button_pressed):
	Globals.camera_zooming = button_pressed


func _on_Squish_toggled(button_pressed):
	Globals.camera_squish = button_pressed


func _on_Funky_toggled(button_pressed):
	Globals.funky_velocity = button_pressed


func _on_Indecisive_toggled(button_pressed):
	Globals.indecisive_ball = button_pressed


func _on_Madness_toggled(button_pressed):
	Globals.camera_rotating = button_pressed
	update_button($CanvasLayer/Rotation, button_pressed)
	
	Globals.camera_zooming = button_pressed
	update_button($CanvasLayer/Zoom, button_pressed)
	
	Globals.camera_squish = button_pressed
	update_button($CanvasLayer/Squish, button_pressed)
	
	Globals.funky_velocity = button_pressed
	update_button($CanvasLayer/Funky, button_pressed)
	
	Globals.indecisive_ball = button_pressed
	update_button($CanvasLayer/Indecisive, button_pressed)

func update_button(button, state):
	button.toggle_mode = state
