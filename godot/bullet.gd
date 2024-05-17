extends CharacterBody2D

var SPEED = 600
var default_direction = Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if velocity == Vector2.ZERO:
		velocity = default_direction * SPEED
	move_and_slide()
