extends Node2D

enum tiletypes {FIRE, TREE, EMPTY}

func tilemap():
	return self.get_child(0)

func checkValid(x, y, width, height):
	pass
	
func playAudio():
	self.get_child(1).play()
	
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
	var thread: Thread
	match mytype:
		"fire":
			tilemap().set_cell(Vector2(i,j),0,Vector2(8,8),0)
		"tree":
			tilemap().set_cell(Vector2(i,j),0,Vector2(5,5),0)
			thread = Thread.new()
			playAudio()
		"empty":
			tilemap().erase_cell(Vector2(i,j))
		_:
			print("How did this happen?")

	
	

func _ready():
	pass

func _process(delta):
	# tree = [5,5]
	# fire = [8,8]
	#randomize() # necessary for rng?
	var width:int = 10
	var height:int = 10
	var mytile
	for i in range(width):
		for j in range(height):
			mytile = getTileType(i,j)
			match mytile:
				"fire":
					setCell(i,j,"empty")
				"tree":
					pass
				"empty":
					if getRandBool(0.0005):
						setCell(i,j,"tree")
	#print(tilemap().get_cell_tile_data(Vector2(3,3)).get_custom_data("forest_fire_dl")) # get name of tile at given coords of the actual "game grid"

#func _on_tile_map_layer_ready() -> void:
#	mainThread(10,10)
