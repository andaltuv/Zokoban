extends Area2D

signal caja_en_objetivo()
onready var caja = preload("res://misc/Caja.tscn")

func _on_caja_target_area_entered(area):
	area.detener_caja()
	emit_signal("caja_en_objetivo")
