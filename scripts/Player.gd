extends KinematicBody2D

var movimiento = Vector2()
var velocidad_movimiento = 200
onready var ray = get_node("RayCast2D")


var ray_active = false
var mov_x = false
var mov_y = false

func _physics_process(delta):
	tecla_presionada()
	animar_personaje()
	detectar_colision()
	move_and_slide(movimiento)

func tecla_presionada():
	if Input.is_action_pressed("ui_up") and !mov_x:
		mov_y = true
		movimiento.y = -velocidad_movimiento
		ray.cast_to = Vector2(0, -30)
	elif Input.is_action_pressed("ui_down") and !mov_x:
		mov_y = true
		movimiento.y = +velocidad_movimiento
		ray.cast_to = Vector2(0, 30)
	elif Input.is_action_pressed("ui_left") and !mov_y:
		mov_x = true
		movimiento.x = -velocidad_movimiento
		ray.cast_to = Vector2(-25,0)
	elif Input.is_action_pressed("ui_right") and !mov_y:
		mov_x = true
		movimiento.x = +velocidad_movimiento
		ray.cast_to = Vector2(30,0)
	else:
		ray.cast_to = Vector2(0,0)
		movimiento.x = 0
		movimiento.y = 0
		if mov_x:
			mov_x = false
		if mov_y:
			mov_y = false
			
func animar_personaje():
	if movimiento.x < 0:
		$AnimatedSprite.play("left")
	elif movimiento.x > 0:
		$AnimatedSprite.play("right")
	elif movimiento.y < 0:
		$AnimatedSprite.play("up")
	elif movimiento.y > 0:
		$AnimatedSprite.play("down")
	else:
		$AnimatedSprite.play("idle")

func detectar_colision():
	if ray.is_colliding():
		var collider = ray.get_collider()
		collider._on_collision(movimiento)

