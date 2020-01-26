extends Control

onready var Score = get_node("Score")

func increase_score(amount):
	Score.score += amount
	pass
	