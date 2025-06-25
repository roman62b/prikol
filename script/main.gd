extends Control

var sprite := Sprite2D.new()
@onready var sp := $SP
@onready var i : int = 1
var circle_tex := load("res://figuri/circle.png")
var triangle_tex := load("res://figuri/triangle.png")

@onready var color_rect := $ColorRect

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("circle"):
		sp.add_child(sprite)
		sprite.name = str("sprite" + str(i))
		i += 1
		sprite.position = get_viewport().get_mouse_position()
		sprite.texture = circle_tex
		
		sprite = Sprite2D.new()
	if Input.is_action_just_pressed("triangle"):
		sp.add_child(sprite)
		sprite.name = str("sprite" + str(i))
		i += 1
		sprite.position = get_viewport().get_mouse_position()
		sprite.texture = triangle_tex
		
		sprite = Sprite2D.new()

func _on_button_pressed() -> void:
	for n in sp.get_children():
		sp.remove_child(n)
		n.queue_free()

func _on_color_picker_button_color_changed(ColorBack) -> void:
	color_rect.color = ColorBack
