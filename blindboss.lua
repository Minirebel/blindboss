--- STEAMODDED HEADER
--- MOD_NAME: blindboss
--- MOD_ID: blindboss
--- MOD_AUTHOR: [Minirebel]
--- MOD_DESCRIPTION: makes all blinds boss blinds


--thanks myst for part of the code <3

--[[todo
after ante 8 make all blinds final bosses
]]--

-- blind_overwrite

--------------------------------
---small/big blind = boss blinds
--------------------------------

local set_blindref = Blind.set_blind
function Blind.set_blind(self, blind, reset, silent)
    if not reset and blind then
        if blind.name == "Small Blind" or blind.name == "Big Blind" then
                local blind_type = blind.name

                local keys = {}
                for k in pairs(G.P_BLINDS) do
                    if k ~= "bl_small" and k ~= "bl_big" then
                        table.insert(keys, k)
                    end
                end
                local chosen_blind = pseudorandom_element(keys, pseudoseed('boss'))
                blind = copy_table(G.P_BLINDS[chosen_blind])
                blind.is_definitely_not_boss = blind_type
            end
        end

    set_blindref(self, blind, reset, silent)
end

-----------------------------
---boss blind = showdown boss
-----------------------------
--[[
local set_blindref = Blind.set_blind
function Blind.set_blind(self, blind, reset, silent)
    if not reset and blind then
        if blind.name == "Boss Blind" then
                local blind_type = blind.name

                local keys = {}
                for k in pairs(G.P_BLINDS) do
                    if k ~= "bl_boss" then
                        table.insert(keys, k)
                    end
                end
                local chosen_blind = pseudorandom_element(keys, pseudoseed('boss_showdown'))
                blind = copy_table(G.P_BLINDS[chosen_blind])
                blind.is_definitely_not_boss = blind_type
            end
        end

    set_blindref(self, blind, reset, silent)
end
]]