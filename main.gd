extends Node2D

enum tiletypes {FIRE, TREE, EMPTY}

func tilemap():
	return self.get_child(0)	
	
func playAudio(foo : int):
	match foo:
		0:
			self.get_child(1).play()
		1:
			self.get_child(2).play()
			
# given (x,y) coordinates of the world grid, get tile name as string
func getTileType(foo : Vector2):
	var x = foo[0]
	var y = foo[1]
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
			tilemap().set_cell(Vector2(i,j),0,Vector2(8,8),0)
			playAudio(1)
		"tree":
			tilemap().set_cell(Vector2(i,j),0,Vector2(5,5),0)
			playAudio(0)
		"empty":
			tilemap().erase_cell(Vector2(i,j))
		_:
			print("How did this happen?")

func getNeighbors(x, y):
	#var neighbors = [Vector2(x+1,y),Vector2(x,y+1),Vector2(x-1,y),Vector2(x,y-1)]
	var neighbors = []
	if(x > 0):
		neighbors.append(Vector2(x-1,y))
	if(x < width - 1):
		neighbors.append(Vector2(x+1,y))
	if(y > 0):
		neighbors.append(Vector2(x,y-1))
	if(y < height - 1):
		neighbors.append(Vector2(x,y+1))	
	return neighbors

# spread! either tree or fire
func spread(i,j, tiletype : String):
	var neighbors = getNeighbors(i,j)
	match tiletype:
		"fire":
			for neighbor in neighbors:
				if(getTileType(neighbor) == "tree"):
					setCell(neighbor[0], neighbor[1], "fire")
			setCell(i,j,"empty")
		"tree":
			for neighbor in neighbors:
				if(getTileType(neighbor) == "empty"):
					if getRandBool(0.003):
						setCell(neighbor[0], neighbor[1], "tree")
var width:int = 26
var height:int = 26

func _process(delta):
	# tree = [5,5]
	# fire = [8,8]
	var mytile
	for i in range(width):
		for j in range(height):
			var coords = Vector2(i,j)
			mytile = getTileType(coords)
			match mytile:
				"fire":
					setCell(i,j,"empty")
					spread(i,j, "fire")
				"tree":	
					spread(i,j, "tree")
					if getRandBool(0.0003):
						setCell(i,j,"fire")
				"empty":
					if getRandBool(0.00007):
						setCell(i,j,"tree")
	#print(tilemap().get_cell_tile_data(Vector2(3,3)).get_custom_data("forest_fire_dl")) # get name of tile at given coords of the actual "game grid"

#func _on_tile_map_layer_ready() -> void:
#	mainThread(10,10)
