extends Spatial
class_name SpatialOptimized

export (float) var hide_distance = 75.0
export (bool) var show_in_cutscenes = false

func _process(delta):
	if not G.TrueCam or not G.Render: return
	
	if G.mode == 0:
		var p1 = Vector2(global_transform.origin.x, global_transform.origin.z)
		var p2 = Vector2(G.TrueCam.global_transform.origin.x, G.TrueCam.global_transform.origin.z)
		visible = p1.distance_to(p2) < (hide_distance * G.Render.OptimizationStep)
	
