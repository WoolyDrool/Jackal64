extends Node3D

@export var interactText : String = "Default Message"
@export var methodName : String
var parent

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Interact():
	parent.call(methodName)
