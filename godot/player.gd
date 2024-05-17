extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var direction = Vector2.ZERO

@export var bullet_scene : PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed('shoot'):
		var new_bullet = bullet_scene.instantiate()
		print(new_bullet)
		new_bullet.velocity = (direction * new_bullet.SPEED)
		new_bullet.position = self.position
		get_tree().get_root().get_child(0).add_child(new_bullet)

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = lerp(velocity, direction * SPEED, 0.3)

	move_and_slide()
