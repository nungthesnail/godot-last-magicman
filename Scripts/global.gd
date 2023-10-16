extends Node

class RenderSettings:
	var OptimizationStep : float = 1

var cam = null
var TrueCam : Camera = null
var player : KinematicBody = null

var mode : int = 0

var csObject : Cutscene_Controller
var camPos = null

var canMove : bool = true
var cutScene : bool = false

var gravity : float = 1.5
var Delta : float = 0

var Mode : Dictionary = {}

var Gui : Dictionary = {"Gui": null,
	"csLabel": null,
	"csThumb": null,
	"csInterface": null,
	"notfLabel": null,
	"scoreLabel": null,
	"msLabel": null}

var Nodes : Dictionary = {"drop": null}
var PlayerSpawns : Array = [null, null]

var Render : RenderSettings = RenderSettings.new()

var MovingDir : float = deg2rad(-90)


onready var rd : RandomNumberGenerator = RandomNumberGenerator.new()


func SetMode(m : int) -> void:
	mode = m

func AddSpawn(Spawn : PlayerSpawn) -> void:
	if len(PlayerSpawns) > Spawn.id:
		PlayerSpawns [Spawn.id] = Spawn
	

func GetCurSpawn() -> PlayerSpawn:
	if len(PlayerSpawns) >= Game.CurStage:
		return PlayerSpawns [Game.CurStage];
	else:
		return null;
	

func death() -> void:
	Reset()
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func Reset() -> void:
	cam = null
	player = null
	csObject = null
	camPos = null
	canMove = true
	cutScene = false
	Gui = {"csLabel": null,
		   "csThumb": null,
		   "csInterface": null,
		   "notfLabel": null,
		   "scoreLabel": null,
		   "msLabel": null}
	Nodes = {"drop": null}
	PlayerSpawns = [null,null]
	Render.OptimizationStep = 1

func RandChoice(arr : Array):
	return arr [rd.randi_range(0, len(arr) - 1)]

func _ready():
	rd.randomize()

func _process(delta):
	Delta = delta
	canMove = false if cutScene else true
	
	if Gui ["csInterface"]:
		if not cutScene: Gui ["csInterface"].hide()
		else: Gui ["csInterface"].show()
	
	if csObject:
		if csObject.IsActive == true:
			cutScene = true
		else:
			cutScene = false
		
	



