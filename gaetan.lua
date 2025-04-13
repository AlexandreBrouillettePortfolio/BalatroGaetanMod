SMODS.Atlas {
	-- Key for code to find it with
	key = "Gaetan",
	-- The name of the file, for the code to pull the atlas from
	path = "gaetan.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.Joker {
    key = 'gaetan',
    loc_txt = {
        name = 'Gaetan',
        text =  {
                "This Joker gains {X:mult,C:white} X#2# {} Mult",
			    "per booster pack opened,",
			    "{C:inactive}(Currently {X:mult,C:white} X#1# {} Mult)",
        }
    },
    config = {extra = {Xmult = 1, Xmult_mod = 0.1}},
    blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = true,
    rarity = 2,
	cost = 6,
    atlas = 'Gaetan',
	pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_mod } }
	end,
    calculate = function (self, card, context)
        if context.open_booster then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = card
			}
        end
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
				Xmult_mod = card.ability.extra.Xmult
            }
        end
    end,
}
