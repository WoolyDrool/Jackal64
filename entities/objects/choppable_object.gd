extends Area3D

var health : int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_chop():
	health -= 1
	print("chopped")
	if health == 0:
		_chop_log()

func _chop_log():
	# Will eventually have it do things here
	queue_free()