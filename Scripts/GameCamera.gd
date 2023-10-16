extends Spatial

export (NodePath) var target
export (NodePath) var look_at_node
export (int) var mode

func _ready():
	G.cam = self


func _process(delta):
	if !get_node_or_null(target): return
	if mode == -1: return
	
	if get_node_or_null(target) and mode != -1:
		global_transform.origin.x = lerp(global_transform.origin.x,get_node(target).global_transform.origin.x, 0.1)
		global_transform.origin.y = lerp(global_transform.origin.y,get_node(target).global_transform.origin.y+0.2, 0.1)
		global_transform.origin.z = lerp(global_transform.origin.z,get_node(target).global_transform.origin.z, 0.1)
		
		rotation_degrees = Vector3(0,0,0)
	
	$Ray.cast_to = $camera.translation
	

