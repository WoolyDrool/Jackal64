extends Area3D

enum depositType {GARB, REC, ALL}
@export var DepositType : depositType

# Called when the node enters the scene tree for the first time.
func _ready():
	match typeof(DepositType):
		0:
			$"Interact".interactText = "Garbage Deposit"
		1:
			$"Interact".interactText = "Recycle Deposit"
		2:
			$"Interact".interactText = "All Deposit"
		_:
			$"Interact".interactText = "Depositor"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _deposit():
	match typeof(DepositType):
		0:
			_deposit_garbage()
		1:
			_deposit_recycle()
		2:
			_deposit_all()
		_:
			print("No deposit type specified")

func _deposit_garbage():
	print("Garbage Deposited")
	# Do Thing
	pass

func _deposit_recycle():
	print("Recycle Deposited")
	# Do Thing
	pass

func _deposit_all():
	print("All Deposited")
	# Do Thing
	pass