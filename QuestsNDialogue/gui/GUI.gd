extends CanvasLayer

var _quest: Quest

func _ready() -> void:
	QuestSystem.quest_accepted.connect(set_current_quest)
	QuestSystem.quest_completed.connect(finish_quest)


func _process(_delta: float) -> void:
	if _quest == null:
		%Control.hide()
		return
	else:
		%Control.show()
		%CurrentQuest.text = _quest.quest_name
		%Progress.text = _quest.get_progress()
		

func set_current_quest(quest: Quest) -> void:
	_quest = quest
	%Control.show()

func finish_quest(quest: Quest) -> void:
	%Control.hide()
	_quest = null

