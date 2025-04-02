class_name HurtBox
extends Area2D

signal hurt(hitbox : HitBox, damage)

func take_hit(hitbox: HitBox, damage: int):
	hurt.emit(hitbox, damage)
