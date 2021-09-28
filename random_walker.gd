extends Node2D

export (Vector2) var starting_pos = Vector2(50, 50)
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	self.position = starting_pos

func move():
	self.position.x += rng.randi_range(1,-1)
	self.position.y += rng.randi_range(1,-1)	


func _process(delta):
	move()
