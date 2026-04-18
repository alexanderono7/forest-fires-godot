extends Node2D

enum tiletypes {FIRE, TREE, EMPTY}

func tilemap():
	return self.get_child(0)

func checkValid(x, y, width, height):
	pass
	
# given (x,y) coordinates of the world grid, get tile name as string
func getTileType(x, y):
	var tile = tilemap().get_cell_tile_data(Vector2(x,y))
	if !tile:
		return "empty"
	else:
		return tile.get_custom_data("forest_fire_dl")
	
# e.g. given 0.7, return "true" 70% of the time
func getRandBool(chance : float):
	var randfloat = randf()
	if randfloat < chance:
		return true
	else:
		return false
		
func setCell(i : int, j : int, mytype : String):
	match mytype:
		"fire":
			tilemap().set_cell(Vector2(i,j),0,Vector2(5,5),0)
		"tree":
			tilemap().set_cell(Vector2(i,j),0,Vector2(8,8),0)
		"empty":
			tilemap().erase_cell(Vector2(i,j))
		_:
			print("How did this happen?")
	

func mainThread(width, height):
	for i in range(width):
		for j in range(height):
			setCell(i,j,"fire")
			setCell(1,1,"empty")
				
	#print(tilemap().get_cell_tile_data(Vector2(3,3)).get_custom_data("forest_fire_dl")) # get name of tile at given coords of the actual "game grid"
	print(getTileType(3,3))
	print(getTileType(10,10))
	
		
func _ready():
	# tree = [5,5]
	# fire = [8,8]
	print("hello!")
	#randomize() # necessary for rng?
	var width:int = 3
	var height:int = 4
	mainThread(10, 10)
	
	
func _process(delta):
	pass
