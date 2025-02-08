extends CharacterBody2D

@export var speed = 400
@export var sprite : AnimatedSprite2D
var heldItem = "ladder"
var right

func _process(delta):
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_right")):
		velocity.x += 1;
	if(Input.is_action_pressed("move_left")):
		velocity.x -= 1;
	if(Input.is_action_pressed("move_down")):
		velocity.y += 1;
	if(Input.is_action_pressed("move_up")):
		velocity.y -= 1;
		
	if(Input.is_action_pressed("exit")):
		get_tree().quit()
		
	if(pow(velocity.x, 2) + pow(velocity.y, 2) > 1):
		velocity = velocity.normalized()
	velocity *= speed;
	
	if(velocity.x < 0 && right):
		sprite.flip_h = false
		right = false
		
	if(velocity.x > 0 && !right):
		sprite.flip_h = true
		right = true
	

func _physics_process(delta: float) -> void:
	move_and_slide()

func _collide_with_cliff(collider):
	#if we collide and our held item is the ladder,
	#spawn ladder object above us
	if(heldItem == "ladder"):
		print("spawn ladder")
		collider.get_node("CollisionShape2D").set_deferred("disabled", true)
		
func _leave_cliff(collider):
	#despawn the ladder object
	print("despawn ladder")
	collider.get_node("CollisionShape2D").set_deferred("disabled", false)
