class_name HitBox
extends Area2D
@export var damage = 1

func set_damage(val : int):
	damage = val
	
func _on_area_entered(hurtbox : HurtBox):
	print("hit entered")
	if not hurtbox is HurtBox:
		return
	hurtbox.take_hit(self, damage)
