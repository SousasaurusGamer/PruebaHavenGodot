extends CharacterBody2D

@export var velocidad = 400.0

func _physics_process(delta):
	# Obtiene la dirección del teclado (flechas o WASD)
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Si hay dirección, la multiplica por la velocidad
	if direccion != Vector2.ZERO:
		velocity = direccion * velocidad
	else:
		# Fricción para que se detenga suavemente
		velocity = velocity.move_toward(Vector2.ZERO, velocidad * 2 * delta)
	
	# ¡Esta línea es la que hace que el personaje se mueva y choque!
	move_and_slide()
	
