CLASS.name = "Officer"
CLASS.description = "A commissioned Dominion officer with authority to direct Trooper squads."
CLASS.faction = FACTION_DOMINION
CLASS.isDefault = false
CLASS.color = Color(220, 60, 60)
CLASS.pay = 15

function CLASS:OnSpawn(client)
	client:SetMaxHealth(110)
	client:SetHealth(110)
end

function CLASS:OnCanBe(client)
	-- Return false so regular players can't self-assign; an admin must promote them
	-- with the character's flags or a staff-only command instead.
	return false
end
