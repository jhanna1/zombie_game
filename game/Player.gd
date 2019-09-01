extends KinematicBody2D

const MOVE_SPEED = 300

var Bullet = preload("res://Bullet.tscn")
var barr = load("res://Barr.tscn")

var ammo = 3

var barrc = 50

onready var raycast = $RayCast2D

func _ready():
	add_to_group("players")
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)

func _physics_process(delta):
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	if Input.is_action_pressed("build"):
		if barrc > 0:
			var b = barr.instance()
			b.position = get_global_mouse_position()
			add_child(b)
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)

	
	#if(Input.is_key_pressed(KEY_SHIFT)):
	#	MOVE_SPEED = 4504
	
	if Input.is_action_just_pressed("shoot"):
		if ammo > 0 :
			ammo -= 1
			get_tree().get_root().get_node("World/ammo").set_text0(ammo)
			var b = Bullet.instance()
			b.start(look_vec)
			add_child(b)

func add_ammo(amount):
	ammo += amount
	get_tree().get_root().get_node("World/ammo").set_text0(ammo)

func add_barr():
	barrc += 1

func kill():
	get_tree().reload_current_scene()