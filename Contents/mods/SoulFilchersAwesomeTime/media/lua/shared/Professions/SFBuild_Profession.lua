function SFBuild_AddProfession()
	local metalworker = ProfessionFactory.getProfession("metalworker");
	if metalworker then
		metalworker:getFreeRecipes():add("Make Metal Stairs");
		metalworker:getFreeRecipes():add("Make Antique Oven");
	end
end


Events.OnGameBoot.Add(SFBuild_AddProfession);