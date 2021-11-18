extends KinematicBody2D

var movimiento_caja = Vector2()
var caja_objetivo = false
func _physics_process(delta):
		move_and_slide(movimiento_caja)
		movimiento_caja.y = 0
		movimiento_caja.x = 0

func _on_collision(movimiento):
	if !caja_objetivo:
		movimiento_caja = movimiento
	


func _on_Area2D_caja_objetivo():
	caja_objetivo = true
	pass # Replace with function body.
