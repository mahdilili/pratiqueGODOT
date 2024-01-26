extends KinematicBody2D

const MAXSPEED = 200
const UP = Vector2(0,-1)
const GRAVITY= 1000
const ACCELERER = 5
var vel = Vector2()

func _ready():
	pass 

func _process(delta):
	pass

func _physics_process(delta):
#	vel.x = 0
	vel.y += GRAVITY * delta
	movement_loop()
	
	
	vel = move_and_slide(vel, UP) #UP indique le plafond 

func movement_loop(): 
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump  = Input.is_action_just_pressed("jump")
	var dirx = int(right)-int(left)
	print(dirx)
	
	if dirx == -1 : 
		vel.x =max(vel.x - ACCELERER , -MAXSPEED)
		$Sprite.flip_h = true
	elif dirx == 1 : 
#		vel.x +=SPEED
		$Sprite.flip_h = false
		vel.x = min(vel.x+ACCELERER, MAXSPEED)
	else : #pour le cas d'un 0 
		vel.x = 0
	if jump == true and is_on_floor(): #Empecher le double saut 
		vel.y = -700
	
	
