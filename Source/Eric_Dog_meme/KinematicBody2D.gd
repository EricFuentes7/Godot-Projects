extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 1
var Gravity = 20
var JumpPower = 200
var friction = 20
var maxspeed = 150
var maxfallspeed = 200

func _physics_process(delta):
	velocity.y += Gravity
	if velocity.y > maxfallspeed:
		velocity.y = maxfallspeed
		
		
	velocity.x = clamp(velocity.x,-maxspeed,maxspeed)
	if Input.is_action_pressed("ui_right"):
		velocity.x = maxspeed
		$AnimatedSprite.play("dere")
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("izq")
		velocity.x = -maxspeed
	else:
		velocity.x = 0
		if is_on_floor():
			if Input.is_action_just_pressed("jump"):
				velocity.y = -JumpPower
				$AudioStreamPlayer2.play()
			
	velocity = move_and_slide(velocity, Vector2.UP)









