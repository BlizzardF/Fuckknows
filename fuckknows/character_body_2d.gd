extends CharacterBody2D
signal hit
@export var speed = 200
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # Replace with function body.
pass
func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity == Vector2.ZERO:
		$Sprite2D/AnimatedSprite2D.play("Blink")
	else:
		$Sprite2D/AnimatedSprite2D.stop()
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
		

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func _physics_process(delta):
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
pass	
