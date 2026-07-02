-- Client-only schema-wide gamemode hooks.
-- Add custom HUD painting, intro screens, or menu tweaks here as the schema grows.

function SCHEMA:LoadFonts(font, genericFont)
	surface.CreateFont("elysiyum.title", {
		font = genericFont,
		size = 42,
		weight = 800
	})
end
