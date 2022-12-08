# Code from Godot docs FPS tutorial

extends CharacterBody3D

# Controller variables
@export var MAX_SPEED = 20
@export var JUMP_SPEED = 18
@export var ACCEL = 4.5
@export var DEACCEL= 16
@export var MAX_SLOPE_ANGLE = 40
@export var MOUSE_SENSITIVITY = 0.05

# Internal variables
var GRAVITY = -ProjectSettings.get_setting("physics/3d/default_gravity")
var vel = Vector3()
var dir = Vector3()

# Refs
var camera
var rotation_helper

# TODO ----
# 1 Make angles/sliding feel better. Its very snappy and locky and Skyrim-y, for lack of a better word
# 2 Implement a state machine of some kind
# 3 Procedural headbob/crouch animations

func _ready():
	camera = $Neck/Camera3D
	rotation_helper = $Neck

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(delta):
	# ----------------------------------
	# Walking
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()

	if Input.is_action_pressed("movement_forward"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("movement_back"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("movement_left"):
		input_movement_vector.x -= 1
	if Input.is_action_pressed("movement_right"):
		input_movement_vector.x += 1

	input_movement_vector = input_movement_vector.normalized()

	# Basis vectors are already normalized.
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	# ----------------------------------

	# ----------------------------------
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("movement_jump"):
			vel.y = JUMP_SPEED
	# ----------------------------------

	# ----------------------------------
	# Capturing/Freeing the cursor
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# ----------------------------------

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * GRAVITY

	var hvel = vel
	hvel.y = 0

	var target = dir
	target *= MAX_SPEED

	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.lerp(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	
	velocity = vel
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENSITIVITY))
		rotation_helper.rotate_y(deg_to_rad(event.relative.x * MOUSE_SENSITIVITY * -1))
		
