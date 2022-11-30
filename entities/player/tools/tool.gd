# Base class defining core functionality of all usable tools
# Handles boilerplate like input checking and some basic control booleans

extends Node3D

class Tool:
	
	var toolName = "Default"
	var isEquip : bool = false
	var canUSe : bool = true

	func _process(delta):
		pass
	
	func _process_input():
		if Input.is_action_just_pressed("tool_primary"):
			_tool_primary()
		if Input.is_action_just_pressed("tool_secondary"):
			_tool_secondary()
		if Input.is_action_just_pressed("tool_tertiary"):
			_tool_tertiary()
		pass
	
	# Actions
	func _tool_primary():
		pass
	
	func _tool_secondary():
		pass
	
	func _tool_tertiary():
		pass