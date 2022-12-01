extends Area3D

class_name GameItemObjective

@export var itemName : String = "Default"
@export var recycling : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#EventBus.connect("was_collected", self, )
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_grab():
	EventBus.emit_signal("E_O_COLLECT")
	queue_free()
