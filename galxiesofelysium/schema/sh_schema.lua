-- Galaxies of Elysiyum
-- Core shared schema file. Fill out schema info and include everything that isn't auto-loaded.

Schema.name = "Galaxies of Elysiyum"
Schema.author = "Your Name"
Schema.description = "A universe of wonders, a future of choice. Seven civilizations, six galaxies, and " ..
	"one relic - the Elysian Keys - that could reshape everything."

-- Files in factions/, classes/, items/, attributes/, languages/, and plugins/ are auto-loaded by Helix.
-- Everything else needs to be included manually here.
ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("meta/sh_character.lua")

-- The Elysian Keys game-mode system. See sv_schema.lua for the server-side logic and sh_hooks.lua /
-- sv_hooks.lua for where it hooks into character/item events.
ELYSIYUM = ELYSIYUM or {}
ELYSIYUM.galaxies = {
	{id = "orionis", name = "Orionis Cluster"},
	{id = "xandrale", name = "Xandrale Belt"},
	{id = "vyralis", name = "Vyralis Expanse"},
	{id = "zhyrin", name = "Zhyrin Nebula"},
	{id = "thalorian", name = "Thalorian Descent"},
	{id = "elysiyum", name = "Elysiyum"}
}
-- ELYSIYUM.holders[galaxyID] = factionIndex once a faction claims that galaxy's Key.
ELYSIYUM.holders = ELYSIYUM.holders or {}

-- Currency shown throughout the UI (money, vendors, salaries, dropped cash entities).
ix.currency.symbol = "cr"
ix.currency.singular = "Credit"
ix.currency.plural = "Credits"
-- ix.currency.model defaults to the stock cash prop; override it if you have a custom credit-chit model.
