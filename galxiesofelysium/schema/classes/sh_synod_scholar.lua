CLASS.name = "Scholar"
CLASS.description = "A Synod archivist devoted to the study of the Elysian Keys and the old galaxies."
CLASS.faction = FACTION_SYNOD
CLASS.isDefault = true
CLASS.color = Color(220, 180, 90)
CLASS.pay = 8

function CLASS:OnSpawn(client)
	client:SetMaxHealth(90)
	client:SetHealth(90)
end

function CLASS:OnCanBe(client)
	return true
end
