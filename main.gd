extends Node2D

func _ready():
	print("bruh!")
	var width = 4
	var height = 4
	self.get_child(0).set_cell(Vector2(3,3),0,Vector2(0,0),0)
	self.get_child(0).set_cell(Vector2(1,1),0,Vector2(0,0),0)
	self.get_child(0).set_cell(Vector2(2,2),0,Vector2(0,0),0)

	
func _process(delta = 0.1):
	pass
