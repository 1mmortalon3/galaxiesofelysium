# Galaxies of Elysium — a WIP Helix schema

A custom [Helix](https://github.com/NebulousCloud/helix) roleplay schema built around refrence concept art:
seven civilizations spread across six galaxies, all circling one prize — **the six Elysian Keys**.

## The game mode, in one paragraph

Six Elysian Keys exist, one per galaxy (Orionis, Xandrale, Vyralis, Zhyrin, Thalorian, and Elysiyum
itself). They spawn as items out in the world (you place them as ground loot, quest rewards, or admin
spawns — the schema doesn't lock you into one method). Any character who picks one up can **Claim** it
for their faction. Claiming broadcasts a server-wide message and permanently records that galaxy as
"held" by that faction until someone else claims it. If one faction ever holds **all six Keys at
once**, a **Convergence** fires: a server-wide announcement, a credit reward for every online member
of that faction, and the board resets for a new "Age." It's a persistent, server-wide tug-of-war
that gives every faction — militaristic Dominion, scholarly Synod, wild Assembly, secretive Enclaves,
honor-bound Clans, plus the rarer Seraphic Order and AI Collectives — a reason to interact, fight,
trade, or scheme, without needing round timers or lobbies. Standings persist across restarts and are
checkable any time with `/keys`.

## What's included

```
elysiyum.txt                     — Source engine gamemode info (rename target, see Installation)
schema/
  sh_schema.lua                  — Schema info, currency, and the ELYSIYUM key-system table
  sh_hooks.lua / sv_hooks.lua / cl_hooks.lua — shared/server/client gamemode hooks
  sv_schema.lua                  — Elysian Keys logic: claiming, persistence, Convergence
  cl_schema.lua                  — client helper stub
  meta/sh_character.lua          — example character meta-table extension
  factions/                      — the 7 Major Civilizations from your concept art
  classes/                       — 4 example classes showing the pattern (Trooper, Officer, Scholar, Warrior)
  items/
    base/sh_consumables.lua      — reusable "use to consume" base
    base/sh_keys.lua             — reusable "claim for faction" base used by the 6 Keys
    keys/                        — the six Elysian Key items
    weapons/                     — 2 example faction weapons (base_weapons)
    relics/                      — flavor items each faction starts with
    consumables/sh_medkit.lua    — example consumable
  attributes/                    — Might, Wit, Grit (swap/add your own)
  languages/sh_english.lua       — UI phrase strings
```

## Installation

1. Install the Helix framework itself into `garrysmod/gamemodes/helix` (see
   [the Helix getting-started guide](https://docs.gethelix.co/manual/getting-started/)) if you haven't already.
2. Copy this whole `elysiyum` folder into `garrysmod/gamemodes/`.
3. It's already named and structured correctly — `elysiyum.txt` is the gamemode info file Source engine
   reads to list "Galaxies of Elysiyum" in the gamemode picker.
4. Restart your server and select **Galaxies of Elysiyum** as the active gamemode.
5. Pick a map with some open, explorable areas (any HL2-style RP map works) — you'll want physical
   spots to place the six Key items.

## Placing the Keys in the world

The item files in `schema/items/keys/` are ready to use but aren't spawned anywhere yet — that's a
deliberate map/story decision left to you the owner. Options, roughly in order of effort:
- **Simplest:** as an admin, spawn one of each Key item near a location that fits its galaxy's theme
  (a ruin for the Zhyrin Key, a trade hub for the Xandrale Key, etc.), then leave them for players to find.
- **More game-like:** wrap each Key spawn in a quest, a locked door, an NPC vendor who trades for one,
  or a `timer.Create` that respawns a Key on a random Notable World location after a Convergence resets
  the board.
- **Most ambitious:** since the concept art useda s a refrence names eight Notable Worlds (Aurelon Prime, Nova Veridia,
  Kael-7, Vaeloris, Drakenfall, Seraph Prime, The Convergence, Elysiyum Prime), you could build those
  out as actual named zones on your map (or separate maps travelled between via a "warp" trigger) and
  tie each Key to its matching world.

## Extending it further

- **More classes per faction** — only 4 example classes are included; copy the pattern in
  `schema/classes/` for the other 3 civilizations.
- **Custom SWEPs** — the two weapon items currently reuse stock HL2 weapons (`weapon_pistol`,
  `weapon_stunstick`) as placeholders. Swap `ITEM.class` once you have sci-fi weapon models/SWEPs.
- **Plugins** — Helix has a large library of free community plugins (inventory UIs, character
  progression, doors, businesses, etc.) at the [Helix Plugin Center](https://docs.gethelix.co) that
  drop straight into a `plugins/` folder alongside `schema/`.
- **Balance the Convergence reward** — 500 credits per member is a placeholder; tune it (or replace it
  with a title, a unique item, or a temporary server-wide buff) to fit your economy.

## A note on accuracy

Helix's API does shift between versions. Everything here was checked against the current Helix
documentation and source at the time this was built, but if anything throws a Lua error on your
server, check `docs.gethelix.co` for the exact function signature — it's usually a one-line fix.
