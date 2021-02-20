mobs:register_mob("wwildlife:kangaroo", {
	stepheight = 2,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Kangaroo.b3d",
	textures = {
		{"texturekangaroo.png"},
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 5,
	run_velocity = 5,
	runaway = true,
        runaway_from = {"wwildlife:bear", "wwildlife:crocodile", "wwildlife:tiger", "player"},
	jump = true,
	jump_height = 8,
	pushable = true,
	follow = {"default:grass_3", "default:dry_grass_3"},
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

local spawn_on = {"default:desert_sand", "default:dry_dirt_with_dry_grass"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:desert_sand", "default:dry_dirt_with_dry_grass"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grass_grove"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wwildlife:kangaroo",
	nodes = {"default:desert_sand", "default:dry_dirt_with_dry_grass"},
	neighbors = spawn_by,
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 100,
	day_toggle = true,
})
end

mobs:register_egg("wwildlife:kangaroo", ("Kangaroo"), "akangaroo.png")


mobs:alias_mob("wwildlife:kangaroo", "wwildlife:kangaroo") -- compatibility

