extends Quest


func start():
	pass

func update_objectives(sticks, candles, grasses) -> bool:
	State.sticks_count += sticks
	State.candles_count += candles
	State.grass_count += grasses
	return not (sticks == 0 and candles == 0 and grasses == 0)

func update():
	if State.sticks_count == 3 and State.candles_count == 3 and State.grass_count == 3:
		objective_completed = true
		QuestSystem.complete_quest(self)

func get_progress() -> String:
	return "%s/3 брёвен
	%s/3 свечек
	%s/3 травы" % [State.sticks_count, State.candles_count, State.grass_count]

func complete():
	pass

