Events.OnGameStart.Add(function()
	if BookLearning and not BookLearning.allowedSkills
	then
		-- simple list of items. skill name is game internal name!
		BookLearning.allowedSkills = {
			"Woodwork", "Electricity", "MetalWelding", "Mechanics"
		};

		local oldXPFn = BookLearning["gainXP"];

		BookLearning["gainXP"] = function(self)
			local trainedStuff = SkillBook[self.item:getSkillTrained()];

			if trainedStuff
			then
				if #BookLearning.allowedSkills > 0
				then
					local isAllowed = false;

					for _,skill in ipairs(BookLearning.allowedSkills)
					do
						if tostring(trainedStuff.perk) == skill
						then
							isAllowed = true;
							break;
						end
					end

					if not isAllowed
					then
						--print("is NOT allowed");

						return;
					end

					--print("is allowed");
				end
			end

			oldXPFn(self);
		end
	end
end);