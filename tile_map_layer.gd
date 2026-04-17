extends TileMapLayer

func _ready():
	pass


func _on_button_pressed() -> void:
	print("button pressed!!!")
	self.set_cell(Vector2(5,1),0,Vector2(0,0),0)
