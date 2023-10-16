extends AnimationPlayer
class_name CutsceneAnimator
#-Interface variables-
export (String, FILE) var text_location
#--Private variables--
var TextContent : Array = []
var CurrentLine : int = 0
#---------------------

#-Interface functions-
func LoadTextContent(FileName : String):
	TextContent = file.LoadFile(FileName)

func Reset():
	CurrentLine = 0

func ResetAll():
	TextContent = []
	CurrentLine = 0

func TakeText():
	if not get_parent().name.to_lower().begins_with("cutscene"): return
	if CurrentLine > (len(TextContent) - 1): return
	
	get_parent().TakeText(TextContent [CurrentLine])
	CurrentLine += 1
#---Inner functions---
func _ready():
	LoadTextContent(text_location)
