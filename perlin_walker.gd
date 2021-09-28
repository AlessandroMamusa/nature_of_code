extends Node2D

export (Vector2) var starting_pos = Vector2(150, 150)
var noise = OpenSimplexNoise.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# Configure the OpenSimplexNoise instance.
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.1

	self.position = starting_pos

func move(delta):
	self.position.x += noise.get_noise_1d(delta)
	self.position.y += noise.get_noise_1d(delta+10000)

func _process(delta):
	move(delta)
