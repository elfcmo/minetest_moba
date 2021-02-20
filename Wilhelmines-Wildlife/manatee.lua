mobs:register_mob("wwildlife:manatee", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 1,
	hp_min = 5,
	hp_max = 30,
	armor = 200,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 0.95, 0.7},
	visual = "mesh",
	mesh = "Manatee.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturemanatee.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.5,
	run_velocity = 2,
        fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"wwildlife:bear", "wwildlife:crocodile", "wwildlife:tiger"},
	jump = false,
	stepheight = 0.0,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 75,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 250,
		fly_start = 100, -- swim animation
		fly_end = 250,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"default:kelp", "seaweed", "xocean:kelp",
		"default:grass", "farming:cucumber", "farming:cabbage"
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
	name = "wwildlife:manatee",
	nodes = {"default:water_source"}, {"default:river_water_source"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 10,
	day_toggle = true,
})
end

mobs:register_egg("wwildlife:manatee", ("Manatee"), "amanatee.png")
