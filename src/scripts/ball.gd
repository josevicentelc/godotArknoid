extends Node2D

var velx = 200
var vely = 500

func _ready():
	pass # Replace with function body.

func _process(delta):
	position.y += vely * delta;
	position.x += velx * delta;
	pass

func _on_area_2d_body_entered(body):
	var _name = body.get_name();
	
	print(_name)
	
	if _name == 'CharacterBody2D' || _name == 'limit_top':
		vely *= -1
		
	if _name == 'limit_left' || _name == 'limit_right':
		velx *= -1	
			
	if _name == 'limit_bottom':
		print('Bola destruida')
		queue_free()
		
	
	pass # Replace with function body.
