extends Area2D

signal caja_objetivo()

func detener_caja():
	emit_signal("caja_objetivo")
