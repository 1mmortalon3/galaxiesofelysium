CLASS.name = "Trooper"
CLASS.description = "Standard Dominion infantry, equipped for planetary garrison duty."
CLASS.faction = FACTION_DOMINION
CLASS.isDefault = true
CLASS.color = Color(180, 40, 40)
CLASS.pay = 5 -- additional pay bonus on top of the faction's base salary

function CLASS:OnSpawn(client)
	client:SetMaxHealth(100)
	client:SetHealth(100)
end

function CLASS:OnCanBe(client)
	return true -- anyone in the Dominion can become a Trooper without staff approval
end
