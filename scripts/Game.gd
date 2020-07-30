extends Node2D

signal hit
signal game_start
signal game_over

export var can_die = true

var lives = 3
var finished = false
var waiting = false
var Ball = load("res://scenes/Ball.tscn")

onready var HUD = $HUD

func _ready():
	HUD.get_node("Lives").text = "lives: " + str(lives)
	HUD.get_node("Victory").visible = false
	emit_signal("game_start")
	

func _physics_process(delta):
	if lives >= 0:
		HUD.get_node("Lives").text = "lives: " + str(lives)
	
	if finished:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://scenes/MainMenu.tscn")
	
	if waiting:
		if Input.is_action_pressed("ui_accept"):
			var new_ball = Ball.instance()
			add_child(new_ball)
			waiting = false

func _on_Ball_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name != "Player" && body.name != "Walls":
		emit_signal("hit", body)
		$Sounds/Hit.pitch_scale = randf() + 0.4
		$Sounds/Hit.play()
	
	if body.name == "Player":
		$Sounds/Boop.play()
		


func _on_Death_body_entered(body):
	if body.name == "Ball":
		lives -= 1
		body.queue_free()
		
		if lives < 0 && can_die:
			game_over(body)
			HUD.get_node("Lives").text = "Press Enter to go back to Main Menu"
			HUD.get_node("Victory").text = "You Lose"
			HUD.get_node("Victory").visible = true
			$Sounds/Lose.play()
		else:
			$Sounds/Ouch.play()
			waiting = true

func game_over(ball):
	emit_signal("game_over")
	finished = true
	ball.queue_free()


func _on_Blocks_victory():
	HUD.get_node("Victory").visible = true
	finished = true
	$Ball.queue_free()
	$Sounds/Victory.play()
