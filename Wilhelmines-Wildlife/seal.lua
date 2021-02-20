mobs:register_mob("wwildlife:seal", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.95, 0.4},
	visual = "mesh",
	mesh = "Seal.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureseal.png"},
	},
	sounds = {
		random = "wwildlife_seal",
		attack = "wwildlife_seal",
	},
	makes_footstep_sound = true,
	walk_velocity = 0.8,
	run_velocity = 1,
	runaway = true,
	runaway = true,
        runaway_from = {"wwildlife:bear", "wwildlife:crocodile", "wwildlife:tiger"},
	jump = false,
	stepheight = 1.1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 125,
		stand_start = 0,
		stand_end = 400,
		walk_start = 400,
		walk_end = 600,
		fly_start = 650, -- swim animation
		fly_end = 850,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"ethereal:fish_raw", "wwildlife:rawfish", "mobs_fish:tropical",
		"mobs_fish:clownfish_set", "mobs_fish:tropical_set", "xocean:fish_edible"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wwildlife:seal",
	nodes = {"default:snowblock", "default_ice"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 10,
	day_toggle = true,
})
end

mobs:register_egg("wwildlife:seal", ("Seal"), "aseal.png")
