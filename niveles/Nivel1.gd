extends Node2D

onready var cajas_nivel = get_tree().get_nodes_in_group("Cajas").size()
var cajas_en_posicion = 0

func _on_caja_target_caja_en_objetivo():
	cajas_en_posicion += 1
	if(cajas_en_posicion == cajas_nivel):
		get_tree().change_scene_to(load("res://niveles/Nivel2.tscn"))
