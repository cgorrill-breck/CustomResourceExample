extends Resource
class_name Stats

@export var _health: int = 25
@export var _damage: int = 5
@export var _defense: int = 35
@export var _speed_factor: float = 1.0
@export var _jump_factor: float = 1.0

# Getters
func get_health() -> int:
	return _health

func get_damage() -> int:
	return _damage

func get_defense() -> int:
	return _defense

func get_speed_factor() -> float:
	return _speed_factor

func get_jump_factor() -> float:
	return _jump_factor

# Setters
func set_health(value: int) -> void:
	_health = max(0, value)  # Ensure health is never negative

func set_damage(value: int) -> void:
	_damage = max(0, value)  # Prevent negative damage

func set_defense(value: int) -> void:
	_defense = max(0, value)  # Prevent negative defense

func set_speed_factor(value: float) -> void:
	_speed_factor = max(0.1, value)  # Prevent zero or negative speed

func set_jump_factor(value: float) -> void:
	_jump_factor = max(0.1, value)  # Prevent zero or negative jump
