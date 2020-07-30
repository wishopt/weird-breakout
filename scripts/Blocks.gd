extends Node2D

signal victory

onready var Globals = get_node("/root/Globals")
onready var BlockScene = load("res://scenes/Block.tscn")
var level_margin = 50
var block_margin = 10

var num_blocks = 0

func _ready():	
	var columns = (Globals.WINDOW.x - level_margin * 2) / (Globals.BLOCK_SIZE.x + block_margin) - 2
	var rows = 5
	for y in range(rows):
		for x in range(int(columns)):
			var Block = BlockScene.instance()
			Block.position.y = level_margin + y * (Globals.BLOCK_SIZE.y + block_margin)
			Block.position.x = level_margin* 1.5 / 2 + x * (Globals.BLOCK_SIZE.x + block_margin * 2)
			num_blocks += 1
			add_child(Block)



func _on_Game_hit(body):
	body.queue_free()
	num_blocks -= 1
	if num_blocks == 0:
		emit_signal("victory")
