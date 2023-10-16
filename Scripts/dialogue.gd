extends Node
"""
class_name DialogueManager


export (String, FILE) var resource
export (NodePath) var camPos


var tokens = null
var is_active = false

var currentLine = 0



func loadDialogue(file : String = ""):
	var fileName : String = ""
	var res = []
	
	var s : String
	
	if file != "": fileName = file;
	else: fileName = resource;
	
	var F = File.new()
	
	if not F.file_exists(fileName): return
	F.open(fileName, File.READ)
	
	s = F.get_as_text()
	
	F.close()
	
	res = parse(s)
	tokens = res
	


func parse(Str : String):
	var ret = []
	
	var s = Str.split('\n')
	
	var S = ''
	for l in len(s):
		var mode = 0
		ret.append([])
		
		for C in len(s [l]):
			var c = s [l] [C]
			if c == " " and S != "" and mode == 0:
				ret [l].append(S)
				S = ""
			elif c == '"':
				match mode:
					0: mode = 1
					1: mode = 0
				
			else:
				S += c
			
		
		
		if S != "" and mode == 0:
				ret [l].append(S)
				S = ""
			
		
	return ret



func start():
	loadDialogue()
	activate()
	

func activate():
	if G.dialObject: return
	
	is_active = true
	
	G.dialObject = self
	G.cutScene = true
	
	if camPos: G.camPos = camPos
	

func deactivate():
	is_active = false
	G.dialObject = null
	G.cutScene = false
	G.camPos = null
	


func _ready():
	pass
	#loadDialogue()
	#activate()
	


func _process(delta):
	if is_active and G.Gui ["csLabel"]:
		var lab = G.Gui ["csLabel"]
		
		if len(tokens) < currentLine: return;
		
		if len(tokens [currentLine]) <= 1:
			if tokens [currentLine] [0] == "END": deactivate()
		
		if len(tokens [currentLine]) < 3: return;
		
		if tokens [currentLine] [1] == ":":
			
			lab.text = (tokens [currentLine] [0] + ": " + tokens [currentLine] [2])
			
		
	
	if Input.is_action_just_pressed("ui_accept"):
		currentLine += 1
		
	


"""

