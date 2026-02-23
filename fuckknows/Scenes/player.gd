extends Node
signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_area_2d_hit() -> void:
	hit.emit()
	pass # Replace with function body.
	

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	 # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$"CharacterBody2D/Area2D/Player Collider".set_deferred("disabled", true)
	
