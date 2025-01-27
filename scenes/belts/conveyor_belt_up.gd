extends Area2D

@export var direction := Vector2.RIGHT  # Direction of the conveyor (e.g., RIGHT, LEFT, UP, DOWN)
@export var speed := 100                # Speed of the conveyor

func _physics_process(delta):
    # Move all overlapping bodies
    for body in get_overlapping_bodies():
        if body.has_method("move_on_conveyor"):
            body.move_on_conveyor(direction, speed, delta)