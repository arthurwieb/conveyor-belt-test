extends CharacterBody2D # or CharacterBody2D

var is_on_conveyor := false
var conveyor_direction := Vector2.ZERO
var conveyor_speed := 0.0

func move_on_conveyor(direction: Vector2, speed: float, delta: float):
	is_on_conveyor = true
	conveyor_direction = direction
	conveyor_speed = speed

func _physics_process(delta):
	if is_on_conveyor:
		# Move the item
		position += conveyor_direction * conveyor_speed * delta
	else:
		conveyor_direction = Vector2.ZERO
		conveyor_speed = 0.0
		
	# Reset the conveyor state for the next frame
	is_on_conveyor = false
	# print(is_on_conveyor)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print('entrou body')
