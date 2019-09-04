extends Node
var barr = preload("res://Barr.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn(pos):
	var b = barr.instance()
	b.position = pos
	add_child(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
