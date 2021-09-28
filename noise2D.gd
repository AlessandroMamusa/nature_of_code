extends Node2D

var noise = OpenSimplexNoise.new()
var noise_image = Image.new()
var texture = ImageTexture.new()


func _ready():
	randomize()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.1	

func _input(event):
	if event.is_action("ui_accept"):
		noise.seed = randi()
		refresh_image()

func refresh_image():
	noise_image = noise.get_image(1000, 1000)
	texture.create_from_image(noise_image)
	$Sprite.texture = texture

