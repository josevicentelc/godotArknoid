extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tile_type(_type):
	if _type == 'R':
		$Area2D/Sprite2D.frame = 0	
	if _type == 'G':
		$Area2D/Sprite2D.frame = 2	
	if _type == 'B':
		$Area2D/Sprite2D.frame = 4	
	if _type == 'P':
		$Area2D/Sprite2D.frame = 6	
	if _type == 'S':
		$Area2D/Sprite2D.frame = 8	

func _on_area_2d_body_entered(body):
	if body.get_name() == 'ball':
		queue_free()
	pass # Replace with function body.
