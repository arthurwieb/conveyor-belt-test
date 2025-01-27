extends Area2D

@export var direction := Vector2.UP # Direction of the conveyor
@export var speed := 100
@onready var animated_sprite = $animated_sprite

func _physics_process(delta):
    # play animation
    animated_sprite.play("default")

    # Move all overlapping bodies
    for body in get_overlapping_bodies():
        if body.has_method("move_on_conveyor"):
            body.move_on_conveyor(direction, speed, delta)

# Track bodies currently on the conveyor
var overlapping_bodies := []

func _ready():
    # Connect signals to track when bodies enter and exit
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D):
    if body.has_method("move_on_conveyor"):
        overlapping_bodies.append(body)

func _on_body_exited(body: Node2D):
    if body.has_method("move_on_conveyor"):
        overlapping_bodies.erase(body)

