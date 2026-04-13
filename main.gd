extends Node2D

func tilemap():
	return self.get_child(0)

func _ready():
	print("bruh!")
	var width:int = 3
	var height:int = 4
	for i in range(width):
		for j in range(height):
			tilemap().set_cell(Vector2(1,1),0,Vector2(0,0),0)
			print(tilemap().get_cell_tile_data(Vector2(i,j)))
			#self.get_child(0).set_cell(Vector2(3,3),0,Vector2(0,0),0)

	
func _process(delta = 0.1):
	pass
