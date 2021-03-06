--Stuff from vessels

-- -
-- Copyright (C) 2012 Vanessa Ezekowitz
-- Copyright (C) 2012 celeron55, Perttu Ahola <celeron55@gmail.com>

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

--changes so that bottles can't stack
minetest.override_item("vessels:glass_bottle", {
	description = "Small Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle_inv.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_glass_defaults(),
})

local vessels_shelf_formspec =
	"size[8,7;]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[context;vessels;0,0.3;8,2;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	"listring[context;vessels]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0,2.85)

minetest.register_node("witchcraft:shelf", {
	description = "Potion shelf",
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png^vessels_shelf.png^vessels_shelf_overlay.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", vessels_shelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8*2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("vessels")
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "vessels" then
			if minetest.get_item_group(stack:get_name(), "potion") ~= 0 or minetest.get_item_group(stack:get_name(), "potion2") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "vessels" then
			if minetest.get_item_group(stack:get_name(), "potion") ~= 0 
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff in vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff to vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " takes stuff from vessels shelf at "..minetest.pos_to_string(pos))
	end,
})

--my stuff

-- Copyright (C) 2016 DOOmed <heiselong@gmx.com>

-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

--ingredients

minetest.register_node("witchcraft:bottle_eyes", {
	description = "Jar of eyes",
	drawtype = "plantlike",
	tiles = {"witchcraft_jar_eyes.png"},
	inventory_image = "witchcraft_jar_eyes.png",
	wield_image = "witchcraft_jar_eyes.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("witchcraft:bottle_slime", {
	description = "Jar of Slime",
	drawtype = "plantlike",
	tiles = {"witchcraft_jar_slime.png"},
	inventory_image = "witchcraft_jar_slime.png",
	wield_image = "witchcraft_jar_slime.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craftitem("witchcraft:herb", {
	description = "herb",
	inventory_image = "witchcraft_herbs.png"
})

--crafting

minetest.register_craft({
	output = 'witchcraft:shelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:potion', 'group:potion', 'group:potion'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

if minetest.get_modpath("moreplants") then
minetest.register_craft({
	output = 'witchcraft:bottle_eyes',
	recipe = {
		{'moreplants:eye'},
		{'moreplants:eye'},
		{'vessels:drinking_glass'},
	}
})


minetest.register_craft({
	output = "moreplants:eye 2",
	type = "shapeless",
	recipe = {"witchcraft:bottle_eyes"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"moreplants:bush"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"moreplants:weed"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"moreplants:groundfung"}
})
else
minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"default:grass_5"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"default:grass_4"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"default:grass_3"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"default:grass_2"}
})

minetest.register_craft({
	output = "witchcraft:herb 4",
	type = "shapeless",
	recipe = {"default:grass_1"}
})

minetest.register_craft({
	output = 'witchcraft:bottle_eyes',
	recipe = {
		{'default:bucket_water'},
		{'vessels:drinking_glass'},
	}
})
end

minetest.register_craft({
	output = 'witchcraft:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', '', 'default:copper_lump'},
		{'', 'default:copper_lump', ''},
	}
})

--splash potions crafting

minetest.register_craft({
	output = 'witchcraft:splash_yellwgrn',
	recipe = {
		{'vessels:glass_fragments'},
		{'witchcraft:potion_yellgrn'},
	}
})

minetest.register_craft({
	output = 'witchcraft:splash_orange',
	recipe = {
		{'vessels:glass_fragments'},
		{'witchcraft:potion_orange'},
	}
})



--the all important cooking pot

minetest.register_node("witchcraft:pot", {
	description = "magic cooking pot",
	tiles = {
		"witchcraft_pot_top.png",
		"witchcraft_pot_bottom.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "bucket:bucket_water" or
				wield_item == "bucket:bucket_river_water" then
			minetest.set_node(pos, {name="witchcraft:pot_blue", param2=node.param2})
			item:replace("bucket:bucket_empty")
			elseif wield_item == "vessels:drinking_glass" then
			item:replace("witchcraft:bottle_slime")
		end
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1}
})

--level 1 potions from cooking pot

local witchcraft = {}
witchcraft.pot = {
	{"blue", "brown", "default:dirt", "blue2", "moreplants:bullrush", "red", "purple"},
	{"blue2", "yellow", "default:steelblock", "yellow", "default:copperblock", "green2", "aqua"},
	{"darkpurple", "cyan", "flowers:mushroom_red", "green", "moreplants:weed", "yellow", "redbrown"},
	{"purple", "blue2", "flowers:waterlily", "gpurple", "default:mese_crystal", "magenta", "darkpurple"},
	{"magenta", "purple", "witchcraft:bottle_eyes", "darkpurple", "moreplants:mushroom", "purple", "darkpurple"},
	{"red", "grey", "default:gravel", "gred", "default:mese_crystal", "blue", "purple"},
	{"redbrown", "magenta", "flowers:mushroom_brown", "magenta", "default:stone", "grey", "brown"},
	{"brown", "red", "witchcraft:herb", "grey", "moreplants:bush", "red", "redbrown"},
	{"orange", "redbrown", "witchcraft:bottle_slime", "yellow", "moreplants:curlyfruit", "green", "yllwgrn"},
	{"yellow", "yllwgrn", "tnt:tnt", "", "", "darkpurple", "redbrown"},
	{"yllwgrn", "green", "default:gold_lump", "orange", "mobs:lava_orb", "grey", "magenta"},
	{"green2", "darkpurple", "default:glass", "red", "default:gold_lump", "blue2", "aqua"},
	{"green", "green2", "default:apple", "ggreen", "default:mese_crystal", "orange", "yllwgrn"},
	{"aqua", "", "", "", "", "blue", "cyan"},
	{"cyan", "aqua", "default:diamond", "gcyan", "default:mese_crystal", "green", "yellow"},
	{"grey", "orange", "default:torch", "brown", "default:apple", "yllwgrn", "magenta"},
	{"ggreen", "", "", "", "", "", ""},
	{"gpurple", "", "", "", "", "", ""},
	{"gred", "", "", "", "", "", ""},
	{"gcyan", "", "", "", "", "", ""},
}

--the pot itself

for _, row in ipairs(witchcraft.pot) do
local color = row[1]
local newcolor = row[2]
local newcolor2 = row[4]
local ingredient = row[3]
local ingredient2 = row[5]
local combine = row[6]
local cresult = row[7]
minetest.register_node("witchcraft:pot_"..color, {
	tiles = {
		{ name = "witchcraft_pot_"..color..".png",
			animation = {type="vertical_frames", length=3.0} },
		"witchcraft_pot_bottom.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	drop = {
		items = {
			{items = {'witchcraft:pot'}, rarity = 1},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "vessels:glass_bottle" then
			item:replace("witchcraft:potion_"..color)
			minetest.set_node(pos, {name="witchcraft:pot", param2=node.param2})
		else
		if wield_item == ingredient then
			minetest.set_node(pos, {name="witchcraft:pot_"..newcolor, param2=node.param2})
			item:take_item()
		elseif wield_item == ingredient2 then
			minetest.set_node(pos, {name="witchcraft:pot_"..newcolor2, param2=node.param2})
			item:take_item()
		elseif wield_item == "bucket:bucket_water" then
			minetest.set_node(pos, {name="witchcraft:pot_blue", param2=node.param2})
			item:replace("bucket:bucket_empty")
		elseif wield_item == "witchcraft:potion_"..combine then
			minetest.set_node(pos, {name="witchcraft:pot_"..cresult, param2=node.param2})
			item:replace("vessels:glass_bottle")
		end
	end
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1}
})
end

--pot effects
minetest.register_abm({
	nodenames = {"witchcraft:pot_water", "witchcraft:pot_redbrown", "witchcraft:pot_blue2", "witchcraft:pot_cyan", "witchcraft:pot_green", "witchcraft:pot_green2", "witchcraft:pot_aqua", "witchcraft:pot_yellow", "witchcraft:pot_yllwgrn", "witchcraft:pot_red", "witchcraft:pot_magenta", "witchcraft:pot_brown"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 2,
			maxsize = 3,
			collisiondetection = false,
			texture = "witchcraft_bubbles.png"
		})
	end
})

minetest.register_abm({
	nodenames = {"witchcraft:pot_ggreen", "witchcraft:pot_gred", "witchcraft:pot_gpurple", "witchcraft:pot_gcyan"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "witchcraft_light_over.png"
		})
	end
})

minetest.register_abm({
	nodenames = {"witchcraft:pot_purple"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 5,
			maxsize = 8,
			collisiondetection = false,
			texture = "witchcraft_smoke.png"
		})
	end
})

minetest.register_abm({
	nodenames = {"witchcraft:pot_darkpurple"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 2,
			maxsize = 3,
			collisiondetection = false,
			texture = "witchcraft_symbol.png"
		})
	end
})

minetest.register_abm({
	nodenames = {"witchcraft:pot_orange"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 2,
			maxsize = 3,
			collisiondetection = false,
			texture = "witchcraft_flame.png"
		})
	end
})

--potions and splash potions (level1)

minetest.register_node("witchcraft:potion_red", {
	description = "Tasty Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_red.png"},
	wield_image = "witchcraft_potion_red.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_red.png",
	on_use = minetest.item_eat(30, "vessels:glass_bottle"),
})

minetest.register_node("witchcraft:potion_red_2", {
	description = "Tasty Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_red.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_red.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_red.png^[colorize:black:50",
	on_use = minetest.item_eat(100, "vessels:glass_bottle"),
})

minetest.register_node("witchcraft:potion_darkpurple", {
	description = "Shady Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_darkpurple.png"},
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	stack_max = 1,
	wield_image = "witchcraft_potion_darkpurple.png",
	inventory_image = "witchcraft_potion_darkpurple.png",
	on_use = function(itemstack, user)

		local pos = user:getpos()

		-- make player invisible
		invisible(user, true)

		-- play sound
		minetest.sound_play("pop", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5
		})

		-- display 10 second warning
		minetest.after(50, function()

			if user:getpos() then

				minetest.chat_send_player(user:get_player_name(),
					">>> You have 10 seconds before invisibility wears off!")
			end
		end)

		-- make player visible 5 minutes later
		minetest.after(60, function()

			if user:getpos() then

				-- show aready hidden player
				invisible(user, nil)

				-- play sound
				minetest.sound_play("pop", {
					pos = pos,
					gain = 1.0,
					max_hear_distance = 5
				})
			end
		end)

	--effect
	local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		
		-- take item
		if not minetest.setting_getbool("creative_mode") then

			itemstack:take_item()

			return {name = "vessels:glass_bottle"}
		end
	end,
})


minetest.register_node("witchcraft:potion_darkpurple_2", {
	description = "Shady Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_darkpurple.png^[colorize:black:50"},
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	stack_max = 1,
	wield_image = "witchcraft_potion_darkpurple.png^[colorize:black:50",
	inventory_image = "witchcraft_potion_darkpurple.png^[colorize:black:50",
	on_use = function(itemstack, user)

		local pos = user:getpos()

		-- make player invisible
		invisible(user, true)

		-- play sound
		minetest.sound_play("pop", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5
		})

		-- display 10 second warning
		minetest.after(140, function()

			if user:getpos() then

				minetest.chat_send_player(user:get_player_name(),
					">>> You have 10 seconds before invisibility wears off!")
			end
		end)

		-- make player visible 5 minutes later
		minetest.after(150, function()

			if user:getpos() then

				-- show aready hidden player
				invisible(user, nil)

				-- play sound
				minetest.sound_play("pop", {
					pos = pos,
					gain = 1.0,
					max_hear_distance = 5
				})
			end
		end)

	--effect
	local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		
		-- take item
		if not minetest.setting_getbool("creative_mode") then

			itemstack:take_item()

			return {name = "vessels:glass_bottle"}
		end
	end,
})

minetest.register_node("witchcraft:potion_brown", {
	description = "Murky Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_brown.png"},
	wield_image = "witchcraft_potion_brown.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_brown.png",
	on_use = minetest.item_eat(-5, "vessels:glass_bottle"),
})

minetest.register_node("witchcraft:potion_brown_2", {
	description = "Murky Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_brown.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_brown.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_brown.png^[colorize:black:50",
	on_use = minetest.item_eat(-10, "vessels:glass_bottle"),
})


--cannot get the potion to be removed from inventory on use?
minetest.register_node("witchcraft:potion_yellgrn", {
	description = "Dodgy Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_yellgrn.png"},
	wield_image = "witchcraft_potion_yellgrn.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_yellgrn.png",
	on_use = function(pos, placer)
	local pos = placer:getpos();
	tnt.boom(pos, {damage_radius=5,radius=3,ignore_protection=false})
	end,
})

minetest.register_node("witchcraft:potion_yellgrn_2", {
	description = "Dodgy Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_yellgrn.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_yellgrn.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_yellgrn.png^[colorize:black:50",
	on_use = function(pos, placer)
	local pos = placer:getpos();
	tnt.boom(pos, {damage_radius=10,radius=4,ignore_protection=false})
	end,
})



minetest.register_entity("witchcraft:fire", {
	textures = {"witchcraft_flame.png"},
	velocity = 0.1,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "witchcraft:fire" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4, snappy=4, choppy=4},
						}, nil)
					self.object:remove()
					end
				end
			end
			for dx=0,1 do
						for dy=0,1 do
							for dz=0,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "witchcraft:fire" and n ~= "air" and n ~="default:dirt_with_grass" and n ~="default:dirt_with_dry_grass" and n ~="default:stone"  then	
									minetest.env:set_node(t, {name="fire:basic_flame"})
								elseif n =="default:dirt_with_grass" or n =="default:dirt_with_dry_grass" then
									self.object:remove()
									return
								end
							end
						end
					end
			hit_node = function(self, pos, node)
     	local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 35 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="fire:basic_flame"})
					end
				end
			end
		end
		end

		local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			10, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			1, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_flame.png" --texture
		)
	end,
})



minetest.register_entity("witchcraft:tnt_splash", {
	textures = {"witchcraft_splash_yellgrn.png"},
	velocity = 0.1,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "witchcraft:tnt_splash" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=3},
						}, nil)
					self.object:remove()
					end
				end
			end
			for dx=0,1 do
						for dy=0,1 do
							for dz=0,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "witchcraft:tnt_splash" and n ~="default:obsidian" and n ~= "air" then	
									local pos = self.object:getpos()
									minetest.sound_play("default_break_glass.1.ogg", {
									pos = self.object:getpos(),
									gaint = 1.0,
									max_hear_distance = 20,
									})
									tnt.boom(pos, {damage_radius=5,radius=3,ignore_protection=false})
										self.object:remove()
									return
								end
							end
						end
					end
			hit_node = function(self, pos, node)
    local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 35 then
						tnt.boom(n, {damage_radius=5,radius=3,ignore_protection=false})
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="fire:basic_flame"})
					end
				end
			end
		end
		end
		
	end,
})


minetest.register_entity("witchcraft:fire_splash", {
	textures = {"witchcraft_splash_orange.png"},
	velocity = 0.1,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "witchcraft:fire_splash" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
					self.object:remove()
					end
				end
			end
			for dx=0,1 do
						for dy=0,1 do
							for dz=0,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "witchcraft:fire_splash" and n ~= "air" then
										minetest.env:set_node(t, {name="fire:basic_flame"})
									minetest.sound_play("default_break_glass.1", {
									pos = self.object:getpos(),
									max_hear_distance = 20,
									gain = 10.0,
									})
										self.object:remove()
								elseif n =="default:dirt_with_grass" or n =="default:dirt_with_dry_grass" then
									self.object:remove()
									return
								end
							end
						end
					end
			hit_node = function(self, pos, node)
    local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 1 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="fire:basic_flame"})
					end
				end
			end
		end
		end
		
	end,
})

minetest.register_node("witchcraft:potion_orange", {
	description = "Dragon Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_orange.png"},
	wield_image = "witchcraft_potion_orange.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_orange.png",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*2,y=dir.y*2.5,z=dir.z*2}
	local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fire")
	obj:setvelocity(vec)
	local part = minetest.add_particlespawner(
			10, --amount
			0.3, --time
			{x=playerpos.x-0.3, y=playerpos.y+1.5, z=playerpos.z-0.3}, --minpos
			{x=playerpos.x+0.3, y=playerpos.y+1.5, z=playerpos.z+0.3}, --maxpos
			{x=dir.x*3,y=dir.y*3,z=dir.z*3}, --minvel
			{x=dir.x*3,y=dir.y*3,z=dir.z*3}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			1, --minexptime
			2, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_flame.png" --texture
		)
	
		item:replace("vessels:glass_bottle")
		return item
	end,
})

minetest.register_node("witchcraft:potion_orange_2", {
	description = "Dragon Potion (v2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_orange.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_orange.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_orange.png^[colorize:black:50",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*3,y=dir.y*3.5,z=dir.z*3}
	local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fire")
	obj:setvelocity(vec)
	local part = minetest.add_particlespawner(
			10, --amount
			0.3, --time
			{x=playerpos.x-0.3, y=playerpos.y+1.5, z=playerpos.z-0.3}, --minpos
			{x=playerpos.x+0.3, y=playerpos.y+1.5, z=playerpos.z+0.3}, --maxpos
			{x=dir.x*3,y=dir.y*3,z=dir.z*3}, --minvel
			{x=dir.x*3,y=dir.y*3,z=dir.z*3}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			1, --minexptime
			2, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_flame.png^[colorize:blue:200" --texture
		)
	
		item:replace("vessels:glass_bottle")
		return item
	end,
})

minetest.register_node("witchcraft:splash_orange", {
	description = "Dragon Splash Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_splash_orange.png"},
	wield_image = "witchcraft_splash_orange.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_splash_orange.png",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*6,y=dir.y*3.5,z=dir.z*6}
	local acc = {x=0,y=-9.8,z=0}
	local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fire_splash")
	obj:setvelocity(vec)
	obj:setacceleration(acc)
		item:take_item()
		return item
	end,
})

minetest.register_node("witchcraft:splash_yellwgrn", {
	description = "Dodgy Splash Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_splash_yellgrn.png"},
	wield_image = "witchcraft_splash_yellgrn.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_splash_yellgrn.png",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*7,y=dir.y*3.5,z=dir.z*7}
	local acc = {x=0,y=-9.8,z=0}
	local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:tnt_splash")
	obj:setvelocity(vec)
	obj:setacceleration(acc)
		item:take_item()
		return item
	end,
})

minetest.register_node("witchcraft:potion_purple", {
	description = "Smokey Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_purple.png"},
	wield_image = "witchcraft_potion_purple.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_purple.png",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*2,y=dir.y*2.5,z=dir.z*2}
	local part = minetest.add_particlespawner(
			20, --amount
			0.5, --time
			{x=playerpos.x-1, y=playerpos.y, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y, z=playerpos.z+1}, --maxpos
			{x=0,y=0.5,z=0}, --minvel
			{x=0,y=0.6,z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0,y=0.5,z=0}, --maxacc
			1, --minexptime
			3, --maxexptime
			10, --minsize
			15, --maxsize
			false, --collisiondetection
			"witchcraft_smoke.png^[colorize:magenta:50" --texture
		)
	
		item:replace("vessels:glass_bottle")
		return item
	end,
})



if minetest.get_modpath("hud_hunger") ~= nil then
local register_food = hunger.register_food
minetest.register_node("witchcraft:potion_gpurple", {
	description = "Filling Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_gpurple.png"},
	wield_image = "witchcraft_potion_gpurple.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_gpurple.png",
	on_use = function(item, placer, pos)
		item:replace("vessels:glass_bottle")
		return item
	end,
})

minetest.register_node("witchcraft:potion_gred", {
	description = "Hunger Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_gred.png"},
	wield_image = "witchcraft_potion_gred.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_gred.png",
	on_use = function(item, placer, pos)
		item:replace("vessels:glass_bottle")
		return item
	end,
})

register_food("witchcraft:potion_gpurple", 10)
register_food("witchcraft:potion_gred", -4)
end

minetest.register_node("witchcraft:potion_purple_2", {
	description = "Smokey Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_purple.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_purple.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_purple.png^[colorize:black:20",
	on_use = function(item, placer, pos)
	local dir = placer:get_look_dir();
	local playerpos = placer:getpos();
	local vec = {x=dir.x*2,y=dir.y*2.5,z=dir.z*2}
	local part = minetest.add_particlespawner(
			20, --amount
			0.5, --time
			{x=playerpos.x-1, y=playerpos.y, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y, z=playerpos.z+1}, --maxpos
			{x=0,y=0.2,z=0}, --minvel
			{x=0,y=0.2,z=0}, --maxvel
			{x=0,y=-0.1,z=0}, --minacc
			{x=0,y=0.1,z=0}, --maxacc
			5, --minexptime
			10, --maxexptime
			10, --minsize
			15, --maxsize
			false, --collisiondetection
			"witchcraft_smoke.png^[colorize:magenta:50" --texture
		)
	
		item:replace("vessels:glass_bottle")
		return item
	end,
})

minetest.register_node("witchcraft:potion_grey", {
	description = "Evil Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_grey.png"},
	wield_image = "witchcraft_potion_grey.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_grey.png",
	on_use = minetest.item_eat(-100, "vessels:glass_bottle"),
})

minetest.register_node("witchcraft:potion_grey_2", {
	description = "Evil Potion (lv2)",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_grey.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_grey.png^[colorize:black:50",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_grey.png^[colorize:black:50",
	on_use = minetest.item_eat(-200, "vessels:glass_bottle"),
})

minetest.register_node("witchcraft:potion_blue", {
	description = "Bottle of Water",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_blue.png"},
	wield_image = "witchcraft_potion_blue.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_blue.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="default:water_source"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end
		item:replace("vessels:glass_bottle")
		return item
	end
})

if minetest.get_modpath("farming") then
minetest.register_node("witchcraft:potion_green", {
	description = "Melon Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_green.png"},
	wield_image = "witchcraft_potion_green.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_green.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="farming:melon_8"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
		return item
	end
})
end

minetest.register_node("witchcraft:potion_yellow", {
	description = "Alchemy Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_yellow.png"},
	wield_image = "witchcraft_potion_yellow.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_yellow.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="default:goldblock"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
		return item
	end
})

minetest.register_node("witchcraft:potion_yellow_2", {
	description = "Alchemy Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_yellow.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_yellow.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_yellow.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="default:diamondblock"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
		return item
	end
})



if minetest.get_modpath("experience") then
minetest.register_node("witchcraft:potion_aqua", {
	description = "Complex Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_aqua.png"},
	wield_image = "witchcraft_potion_aqua.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_aqua.png",
	on_use = function(item, placer, pos)
	local pos = placer:getpos();
	minetest.add_particlespawner(
			6, --amount
			0.1, --time
			{x=pos.x-1, y=pos.y+0.5, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=2,z=-0.5}, --minacc
			{x=0.5,y=2,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"orb.png" --texture
		)
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	
		item:replace("vessels:glass_bottle")
		return item
	end
})
end

minetest.register_node("witchcraft:potion_magenta", {
	description = "Fast Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_magenta.png"},
	wield_image = "witchcraft_potion_magenta.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_magenta.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 2.0, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(10, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)

		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_magenta_2", {
	description = "Fast Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_magenta.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_magenta.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_magenta.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 2.5, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(10, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)

		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_cyan", {
	description = "Light Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_cyan.png"},
	wield_image = "witchcraft_potion_cyan.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_cyan.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 0.1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(10, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_gcyan", {
	description = "Air Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_gcyan.png"},
	wield_image = "witchcraft_potion_gcyan.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_gcyan.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(12)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_cyan_2", {
	description = "Light Potion (lv2)",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_cyan.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_cyan.png^[colorize:black:50",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_cyan.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 0.1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(20, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_green2", {
	description = "Volatile Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_green2.png"},
	wield_image = "witchcraft_potion_green2.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_green2.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.5, -- multiplier to default value
		gravity = 0.8, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(6, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_ggreen", {
	description = "Darkness Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_ggreen.png"},
	wield_image = "witchcraft_potion_ggreen.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_ggreen.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			2000, --amount
			1, --time
			{x=playerpos.x-20, y=playerpos.y-3, z=playerpos.z-20}, --minpos
			{x=playerpos.x+20, y=playerpos.y+3, z=playerpos.z+20}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.1,y=0,z=-0.1}, --minacc
			{x=0.1,y=0,z=0.1}, --maxacc
			5, --minexptime
			10, --maxexptime
			10, --minsize
			20, --maxsize
			false, --collisiondetection
			"witchcraft_pot_bottom.png^[colorize:black:200" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_green2_2", {
	description = "Volatile Potion (lv2)",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_green2.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_green2.png^[colorize:black:50",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_green2.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.5, -- multiplier to default value
		gravity = 0.8, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(10, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_redbrown", {
	description = "Thick Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_redbrown.png"},
	wield_image = "witchcraft_potion_redbrown.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_redbrown.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 0.5, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(10, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_redbrown_2", {
	description = "Thick Potion (lv2)",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_redbrown.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_redbrown.png^[colorize:black:50",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_redbrown.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local effect = user:set_physics_override({

		speed = 0.4, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(15, function()
			user:set_breath(11)
			local effect = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_blue2", {
	description = "Watery Potion",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_blue2.png"},
	wield_image = "witchcraft_potion_blue2.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_blue2.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath = user:get_breath()
	if breath <= 10 then
		local spd = user:set_physics_override({

		speed = 3, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
	end
		local reset = minetest.after(20, function()
			user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

minetest.register_node("witchcraft:potion_blue2_2", {
	description = "Watery Potion (lv2)",
	drawtype = "plantlike",
	stack_max = 1,
	tiles = {"witchcraft_potion_blue2.png^[colorize:black:50"},
	wield_image = "witchcraft_potion_blue2.png^[colorize:black:50",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_blue2.png^[colorize:black:50",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath = user:get_breath()
	if breath <= 10 then
		local spd = user:set_physics_override({

		speed = 3, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 4.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
	end
		local reset = minetest.after(15, function()
			user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		local playerpos = user:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"witchcraft_effect.png" --texture
		)
		item:replace("vessels:glass_bottle")
	return item
	end
})

--invisibility potion by Tenplus1(DWTFYWT V2), see darkpurple potion for on_use effect


invisibility = {}

-- reset player invisibility if they go offline

minetest.register_on_leaveplayer(function(player)

	local name = player:get_player_name()

	if invisibility[name] then
		invisibility[name] = nil
	end
end)

invisible = function(player, toggle)

	if not player then return false end

	local name = player:get_player_name()

	invisibility[name] = toggle

	local prop

	if toggle == true then

		-- hide player and name tag
		prop = {
			visual_size = {x = 0, y = 0}--,
			--collisionbox = {0, 0, 0, 0, 0, 0}
		}

		player:set_nametag_attributes({
			color = {a = 0, r = 255, g = 255, b = 255}
		})
	else
		-- show player and tag
		prop = {
			visual_size = {x = 1, y = 1},
			--collisionbox = {-0.35, -1, -0.35, 0.35, 1, 0.35}
		}

	player:set_nametag_attributes({
			color = {a = 255, r = 255, g = 255, b = 255}
		})

    local zteam=team.playerlist[name].team
if zteam=="red" then
player:set_nametag_attributes({ color = {a=255, r=255, g=11, b=11} })
team.save_to_file()
elseif zteam=="blue" then
player:set_nametag_attributes({ color = {a=255, r=11, g=102, b=255} })
team.save_to_file()
end
    
    
    
	end

	player:set_properties(prop)

end

--other stuff

dofile(minetest.get_modpath("witchcraft").."/scrolls.lua")
dofile(minetest.get_modpath("witchcraft").."/brewing_stand.lua")
