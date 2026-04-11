extends TileMapLayer

func _ready():
	pass


func _on_button_pressed() -> void:
	print("button pressed!!!")
	self.set_cell(Vector2(1,1),0,Vector2(0,0),0)
