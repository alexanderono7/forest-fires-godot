extends Node2D

func tilemap():
	return self.get_child(0)

func checkValid(foo : Vector2):
	pass
	
func _ready():
	# tree = [5,5]
	# tree = custom data layer of 1 in forest_fire_dl
	# fire = [8,8]
	# fire = custom data layer of 2 in forest_fire_dl
	print("hello!")
	var width:int = 3
	var height:int = 4
	for i in range(width):
		for j in range(height):
			tilemap().set_cell(Vector2(i,j),0,Vector2(5,5),0)
			#print(tilemap().get_cell_tile_data(Vector2(i,j)))
			#print(tilemap().get_cell_atlas_coords(Vector2(i,j)))
			#self.get_child(0).set_cell(Vector2(3,3),0,Vector2(0,0),0)
	tilemap().set_cell(Vector2(3,3),0,Vector2(8,8),0)
	print(tilemap().get_cell_tile_data(Vector2(3,3)))
	print(tilemap().get_cell_atlas_coords(Vector2(3,3)))
	print(tilemap().get_cell_tile_data(Vector2(3,3)).get_custom_data("forest_fire_dl")) # get name of tile at given coords of the actual "game grid"

	
func _process(delta):
	pass
