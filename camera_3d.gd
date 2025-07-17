extends Camera3D

@export var player:CharacterBody3D
@export var offset:Vector3

func _physics_process(delta):
	position = lerp(position, player.position + offset, 0.05)
