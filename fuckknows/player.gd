extends Area2D

@export var speed = 3
@export var velocity = 1
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # Replace with function body.
pass
func get_input():
	var input_direction = Input.get_vector("move_down","move_left","move_right","move_up")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
pass
