extends Label

var score = 0
var text_string = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(text_string)
	pass # Replace with function body.

func _process(delta):
	text_string = "Score: {0}".format({0: score})
	set_text(text_string)
	
func edit_text():
	score += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
