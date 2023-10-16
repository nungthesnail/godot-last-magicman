extends Node


onready var F = File.new()

func SaveFile(FileName : String, Content : Array):
	
	
	pass

func LoadFile(FileName : String) -> Array:
	var ContentArray : Array = []
	
	F.open(FileName, File.READ)
	ContentArray = F.get_as_text().split("\n")
	F.close()
	
	return ContentArray

