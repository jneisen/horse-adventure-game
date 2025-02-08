extends Node2D

@export var regularCollider : Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(!body is StaticBody2D):
		body._collide_with_cliff(regularCollider)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(!body is StaticBody2D):
		body._leave_cliff(regularCollider)
