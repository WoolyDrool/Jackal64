extends Area2D

var canClick : bool = false
var isHeld : bool = false
var mousePos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isHeld:
		position = mousePos
	pass

func _on_mouse_entered():
	canClick = true
	pass # Replace with function body.



func _on_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if canClick && event.is_action_pressed("tool_primary"):
		position = Input.mouse
	
	mousePos = Vector2(event.relative.x, event.relative.y)
	
