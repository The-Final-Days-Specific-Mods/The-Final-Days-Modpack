--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRepairWindow = ISBaseTimedAction:derive("ISRepairWindow");

function ISRepairWindow:isValid()
	return true;
end

function ISRepairWindow:update()
	self.character:faceThisObject(self.thump)
end

function ISRepairWindow:start()
	self.character:PlayAnim("Idle")
	local hammer = self.character:getInventory():getItemFromType("HammerStone");
	if self.character:getInventory():contains("Hammer") then
		hammer = self.character:getInventory():getItemFromType("Hammer");
	end
    	forceDropHeavyItems(self.character)
	self.character:setPrimaryHandItem(hammer);
end

function ISRepairWindow:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISRepairWindow:perform()
        self.sound = self.character:getEmitter():playSound("PZ_Hammer", true)
        local radius = 20 * self.character:getHammerSoundMod()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
	self.thump:setSmashed(false);
	local sealant = self.character:getInventory():getItemFromType("SFSealant");
	sealant:Use();
	self.character:getInventory():RemoveOneOf("SFGlassPanel");
	self.character:getXp():AddXPNoMultiplier(Perks.Woodwork, 3)

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISRepairWindow:new(character, thump)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.thump = thump
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 50
	if character:HasTrait("Handy") then
		o.maxTime = 30;
    	end
    	o.caloriesModifier = 8;
	return o;
end
