extends Node

const MAXN = 30;

@onready var Box = get_node("../Box");
@onready var noise = FastNoiseLite.new();
@onready var camera = get_node("../Camera3D");
@onready var Home = self;

var active:Array[Vector2i];

func _ready():
	noise.set_seed(randi());

func _process(delta):
	for i in range(-MAXN, MAXN):
		for j in range(-MAXN, MAXN):
			var real_position = Vector2i(camera.position.x, camera.position.z) + Vector2i(i,j);
			if (real_position in active):
				continue;
			print(real_position)
			active.append(real_position);
			var new_box = Box.duplicate();
			new_box.position = Vector3(real_position.x ,noise.get_noise_2d(real_position.x, real_position.y) * 10, real_position.y);
			Home.add_child(new_box);
