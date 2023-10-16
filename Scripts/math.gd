extends Node


func getSlope(pos1: Vector3, pos2: Vector3):
	var x = (pos1.x - pos2.x)
	var y = (pos1.z - pos2.z)
	
	return atan2(x, y)

func getSlope2d(pos1: Vector2, pos2: Vector2):
	var x = (pos1.x - pos2.x)
	var y = (pos1.y - pos2.y)
	
	return atan2(x, y)
