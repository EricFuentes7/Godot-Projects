extends KinematicBody2D

var speed = 200
var maxspeed = 300
var minspeed = -300
var velocity = Vector2()
var last_direction = ""  # Variable para guardar la última dirección

func _physics_process(delta):
	handle_input()
	move_and_slide(velocity * speed)

func handle_input():
	velocity = Vector2()
	
	# Movimiento con Shift (más rápido)
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("shift"):
		velocity.y -= 2
		$AnimatedSprite.play("up")
		last_direction = "up"
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("shift"):
		velocity.y += 2
		$AnimatedSprite.play("down")
		last_direction = "down"
	elif Input.is_action_pressed("ui_left") and Input.is_action_pressed("shift"):
		velocity.x -= 2
		$AnimatedSprite.play("left")
		last_direction = "left"
	elif Input.is_action_pressed("ui_right") and Input.is_action_pressed("shift"):
		velocity.x += 2
		$AnimatedSprite.play("right")
		last_direction = "right"

	# Movimiento normal
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimatedSprite.play("up")
		last_direction = "up"
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimatedSprite.play("down")
		last_direction = "down"
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.play("left")
		last_direction = "left"
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.play("right")
		last_direction = "right"
	
	# Cambiar a animación "idle" si no hay movimiento
	if velocity == Vector2():
		match last_direction:
			"up":
				$AnimatedSprite.play("up_idle")
			"down":
				$AnimatedSprite.play("down_idle")
			"left":
				$AnimatedSprite.play("left_idle")
			"right":
				$AnimatedSprite.play("right_idle")
