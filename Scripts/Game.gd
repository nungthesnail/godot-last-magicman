extends Node


var inventory : Array = ['Fireball','','','']
var CurWeap : String
var ItemId : int

var PlayerParams : Dictionary = {"maxHp": 200}
var Abilities : Dictionary = {"Run": false, "Fireballs":false}

var CurStage : int = 0


func setCurWeap(numb : int):
	CurWeap = inventory [numb]
	ItemId = numb

func getWeapType(Name : String):
	match Name:
		"BlueSword": return "sword"
		"Fireball": return "magic"

func getPath2object(Name : String):
	match Name:
		"BlueSword": return "res://Objects/weapon/sword1.tscn"
		"Fireball": return "res://Objects/weapon/energyBall.tscn"
	return -1;

func getPath2item(Name : String):
	match Name:
		"BlueSword": return "res://Objects/items/Drops/BlueSword_DI.tscn"
		#"Fireball": return "res://Objects/weapon/energyBall.tscn"
	return -1;

func _ready():
	G.SetMode(0)
	CurWeap = ""

func _process(delta):
	if G.player:
		if G.player.score > 15:
			Abilities ["Run"] = true
		if G.player.score > 25:
			Abilities ["Fireballs"] = true
		

