extends CharacterBody3D

@export var speed:float = 2
@export var fall_acceleration:float = 100
@export var speed_multiplier: float = 2

var target_velocity:Vector3 = Vector3.ZERO


func _physics_process(delta):
	var direction:Vector3 = Vector3.ZERO
	if Input.is_action_pressed("move_right"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.z -= 1
	if Input.is_action_pressed("move_up"):
		direction.x += 1
	if Input.is_action_pressed("move_down"):
		direction.x -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.rotated(Vector3.UP, deg_to_rad(-45))
		direction = direction.normalized()
		rotation.y = lerp_angle(rotation.y, atan2(position.x - (position.x+direction.x), position.z - (position.z+direction.z)), 0.1)
	
	if Input.is_action_pressed("Shift"):
		target_velocity.x = direction.x * speed * speed_multiplier
		target_velocity.z = direction.z * speed * speed_multiplier
	else:
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

	if !is_on_floor():
		target_velocity.y -= fall_acceleration * delta
	
	velocity = target_velocity;
	move_and_slide()
	
	
