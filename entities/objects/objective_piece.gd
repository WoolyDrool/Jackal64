extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#EventBus.connect("was_collected", self, )
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_grab():
	EventBus.emit_signal("was_collected")
	queue_free()
