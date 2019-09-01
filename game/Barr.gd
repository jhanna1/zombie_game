extends Area2D

var timer = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.

func _process(delta):
	
	if timer == 0:
		queue_free()
	timer -= 1


func _on_Barr_body_entered(body):
	print(body.name)