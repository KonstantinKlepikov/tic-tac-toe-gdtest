extends Node2D
var player: int = 1
var screensize: Vector2
var offset: Vector2


func _ready():
	screensize = get_viewport().get_visible_rect().size
	position = screensize / 2
	offset = position
	$PlayerNum.text = str(player)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			create_symbol(player, event.position)
			update_player()


func create_symbol(next_player: int, new_position):
	if next_player == 1:
		var create_x = preload("res://gameplay/x.tscn")
		var get_x = create_x.instantiate()
		add_child(get_x)
		get_x.position = new_position - offset
	else:
		var create_o = preload("res://gameplay/o.tscn")
		var get_o = create_o.instantiate()
		add_child(get_o)
		get_o.position = new_position - offset
		
		
func update_player():
	if player == 1:
		player = 2
	else:
		player = 1
	$PlayerNum.text = str(player)
