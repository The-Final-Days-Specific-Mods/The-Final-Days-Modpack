-- SORE LEGS PAIN WHILE FITNESS
function ISFitnessAction:exeLooped()
	local player = self.character;
	if self.exercise == "squats" then
		if player:HasTrait("SoreLegsTrait")then
		MSTApplyPain(player, ZombRand(4), "UpperLeg_L", ZombRand(4)+1);	
		MSTApplyPain(player, ZombRand(4), "UpperLeg_R", ZombRand(4)+1);	
		MSTApplyPain(player, ZombRand(4), "LowerLeg_L", ZombRand(4)+1);	
		MSTApplyPain(player, ZombRand(4), "LowerLeg_R", ZombRand(4)+1);
		end	
		elseif self.exercise == "burpees" then
		if player:HasTrait("SoreLegsTrait")then
		MSTApplyPain(player, ZombRand(4), "UpperLeg_L", ZombRand(4)+2);	
		MSTApplyPain(player, ZombRand(4), "UpperLeg_R", ZombRand(4)+2);	
		MSTApplyPain(player, ZombRand(4), "LowerLeg_L", ZombRand(4)+2);	
		MSTApplyPain(player, ZombRand(4), "LowerLeg_R", ZombRand(4)+2);
		MSTApplyPain(player, ZombRand(3), "Foot_L", ZombRand(3)+2);	
		MSTApplyPain(player, ZombRand(3), "Foot_R", ZombRand(3)+2);		
		end
	end
	self.repnb = self.repnb + 1;
	self.fitness:exerciseRepeat();
	self:setFitnessSpeed();
end