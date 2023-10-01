extends Node2D

var numBalls = 0
var numBlocks = 0
var numLives = 0

var nodo_ball = preload("res://scenes/ball.tscn")
var nodo_block = preload("res://scenes/tiles.tscn")


func _ready():
	numBalls = 0
	numBlocks = 0
	numLives = 3
	generar_mapa()
	pass 


func _process(delta):
	pass


# Una cadena de ejemplo que representa el mapa
# 'N' es un bloque normal, 'F' es un bloque fuerte, ' ' es un espacio vacío
# Usamos \n para indicar el final de una fila
var mapa_str = """
RRRRRRRRRRRRRR
_GGGGGGGGGGGG_
BBBBBBBBBBBBBB
_____SPPS_____     
"""

# Dimensiones de cada bloque en píxeles
var ancho_bloque = 111
var alto_bloque = 40



func generar_mapa():
	var x = 0
	var y = 0
	
	# Dividimos la cadena en líneas y luego iteramos a través de ellas
	var filas = mapa_str.strip_edges().split("\n")
	for fila in filas:
		x = 0  # Reiniciar la posición x para cada nueva fila
		for i in range(fila.length()):
			var c = fila[i]
			
			# Decidir qué bloque instanciar según el carácter
			var bloque = null
			
			if c == 'R' || c == 'G' || c == 'B' || c == 'P' || c == 'S':
					bloque = nodo_block.instantiate()
						
			# Si se creó un bloque, añadirlo a la escena y posicionarlo
			if bloque != null:
				bloque.set_tile_type(c)
				add_child(bloque)
				bloque.z_index = 255
				bloque.position = Vector2(75 + x * ancho_bloque, 100 + y * alto_bloque)
			
			# Actualizar la posición x para el siguiente bloque
			x += 1
		# Incrementar la posición y para la próxima fila
		y += 1
