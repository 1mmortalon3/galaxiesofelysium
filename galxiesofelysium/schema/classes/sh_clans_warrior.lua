CLASS.name = "Warrior"
CLASS.description = "A blooded Thalorian fighter, hardened by the lawless Outer Rim."
CLASS.faction = FACTION_CLANS
CLASS.isDefault = true
CLASS.color = Color(200, 90, 30)
CLASS.pay = 6

function CLASS:OnSpawn(client)
	client:SetMaxHealth(120)
	client:SetHealth(120)
end

function CLASS:OnCanBe(client)
	return true
end
