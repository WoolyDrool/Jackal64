using Godot;
using System;

public partial class player_controller : CharacterBody3D
{
	public const float Speed = 5.0f;
	public const float JumpVelocity = 4.5f;

	[Export] public Camera3D camera;
	[Export] public Node3D rotationHelper;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	public float gravity = ProjectSettings.GetSetting("physics/3d/default_gravity").AsSingle();

	// Vectors
	internal Vector2 _inputDirection;
	internal Vector3 _controllerDirection;

	public override void _Ready()
	{
		//camera = GetTree().Root.GetNode<Camera3D>();
	}

	public override void _Process(double delta)
	{
		_ProcessInput();
	}
	public override void _PhysicsProcess(double delta)
	{
		Vector3 velocity = Velocity;

		// Handle Jump.
		if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
			velocity.y = JumpVelocity;

		// Get the input direction and handle the movement/deceleration.
		Velocity = _MoveController(velocity, delta);
		MoveAndSlide();
	}

	private void _ProcessInput()
	{



		_inputDirection = Input.GetVector("movement_left", "movement_right", "movement_forward", "movement_back");
	}

	private Vector3 _MoveController(Vector3 velocity, double delta)
	{
		// Add the gravity.
		if (!IsOnFloor())
			velocity.y -= gravity * (float)delta;

		_controllerDirection = (Transform.basis * new Vector3(_inputDirection.x, 0, _inputDirection.y)).Normalized();
		if (_controllerDirection != Vector3.Zero)
		{
			velocity.x = _controllerDirection.x * Speed;
			velocity.z = _controllerDirection.z * Speed;
		}
		else
		{
			velocity.x = Mathf.MoveToward(Velocity.x, 0, Speed);
			velocity.z = Mathf.MoveToward(Velocity.z, 0, Speed);
		}

		return velocity;
	}
}
