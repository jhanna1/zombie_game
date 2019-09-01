extends Node

var loot = load("res://Loot.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn(pos):
	var choose = randi()%9+0
	
	var l = loot.instance()
	
	if choose == 0:
		l.set_color("#9f6934")
	
	else:
		l.set_color("#CC00FF")
		
	l.position = pos
	add_child(l)