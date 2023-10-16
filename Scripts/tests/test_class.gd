extends Node
class_name TestClass

var count : float

func printf(content):
	print(content)

func _process(delta):
	count += delta
	if count >= 2:
		print("Count == 2")
		count = 0
	
