extends Area2D

@export var iron_scene: PackedScene # The iron resource to spawn
@export var spawn_offset := Vector2(0, -20) # Offset for spawning iron
@export var click_cooldown := 1.0 # Cooldown time in seconds
var can_click := true

func _process(_delta):
    if Input.is_action_just_pressed("l_click"):
        print('mouse entered')
        spawn_iron()
        can_click = false
        await get_tree().create_timer(click_cooldown).timeout
        can_click = true
        $AnimationPlayer.play("shake")
        

func spawn_iron():
    if iron_scene:
        var iron = iron_scene.instantiate()
        iron.position = position + spawn_offset # Spawn iron near the mine
        get_parent().add_child(iron) # Add iron to the scene
        print("Iron spawned!") # Debug message