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
			$"Interact".interactText = "Garbage Deposit"
			print("Garbage Deposited")
		1:
			$"Interact".interactText = "Recycle Deposit"
			print("Recycle Deposited")
		2:
			$"Interact".interactText = "All Deposit"
			print("All Deposited")
		_:
			print("No deposit type specified")