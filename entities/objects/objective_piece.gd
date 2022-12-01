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
	if !recycling:
		EventBus.E_O_COLLECT_TRASH.emit()
	else:
		EventBus.E_O_COLLECT_RECYCLE.emit()
	queue_free()
