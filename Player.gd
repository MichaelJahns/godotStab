extends KinematicBody2D

var score : int = 0
var speed : int = 200
var jumpforce : int = 600
var gravity : int = 800

var velocity : Vector2 = Vector2()
onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	velocity.x = 0
	
	#movement inputs 
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		
		#applying velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta
	
	#jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpforce
		
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
