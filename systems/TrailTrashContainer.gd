extends Node3D

@export var itemsInTree : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	itemsInTree = get_child_count()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
