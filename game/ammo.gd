extends Label

var ammo = 3
var text_string = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	text_string = "Ammo: {0}".format({0: 3})
	set_text(text_string)
	pass # Replace with function body.

func _process(delta):
	pass

func set_text0(amount):
	text_string = "Ammo: {0}".format({0: amount})
	set_text(text_string)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
