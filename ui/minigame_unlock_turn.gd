extends Area2D

var keyholeSprite
var rotationHelper

var clickPoint

var startingRotation
var winRotation

var isHeld : bool = false
var hasWon : bool = false
var canHold : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	keyholeSprite = $"SprMgLockBottomKeyhole"
	rotationHelper = $"RotationHelper"

	startingRotation = keyholeSprite.rotation
	winRotation = (startingRotation + 90)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !hasWon:
		if isHeld:
			# Still trying to figure out the best way to rotate the lock
			var vecToCenter = get_global_mouse_position() - rotationHelper.position
			var angle = global_position.direction_to(vecToCenter)
			var dist = global_position.distance_to(clickPoint)
			keyholeSprite.rotation = (atan2(angle.y, angle.x) / dist) * 100
			print_debug(keyholeSprite.rotation)

		if keyholeSprite.rotation >= winRotation:
			hasWon = true
			print("won minigame")


func _on_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if canHold:
			if event.pressed:
				isHeld = true
				clickPoint = get_global_mouse_position()
				print(clickPoint)
			else:
				isHeld = false
	pass # Replace with function body.

func _on_mouse_entered():
	canHold = true
	pass # Replace with function body.


func _on_mouse_exited():
	canHold = false
	pass # Replace with function body.
