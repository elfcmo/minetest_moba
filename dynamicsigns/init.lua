dynamicsigns = {}
dynamicsigns.texts = {}
dynamicsigns.register = function(signid, text)
    dynamicsigns.texts[signid] = text
end
 

minetest.register_chatcommand("setsign", {
	params = "",
	description = "Set sign id",
    privs = {server = true},
	func = function(name, param)
        local user = minetest.get_player_by_name(name)
        local pos = user:getpos()
	    -- Find nearest sign
        local signnode = minetest.find_node_near(pos, 4, signs_lib.sign_node_list)
        if signnode == nil then
            return false, "No sign nearby."
        end

        local m=minetest.get_meta(signnode)
        m:set_string("signid",param)
        dynamicsigns.update_sign(signnode)
		return true, "Done."
	end,
})

minetest.register_chatcommand("showsign", {
	params = "",
	description = "View nearby sign metadata",
	func = function(name, param)
        local user = minetest.get_player_by_name(name)
        local pos = user:getpos()
	    -- Find nearest sign
        local signnode = minetest.find_node_near(pos, 4, signs_lib.sign_node_list)
        if signnode == nil then
            return false, "No sign nearby."
        end

        local m=minetest.get_meta(signnode)
        local stuff = minetest.serialize(m:to_table())

        if stuff ~= nil then
            return true, stuff
        end

		return true, "Done."
	end,
})
dynamicsigns.update_sign = function(pos)

		local m = minetest.get_meta(pos)
        if m == nil then
            return
        end
        local dynid = m:get_string("signid")
        if dynid ~= nil and dynid ~= "" then
            
            for k,v in pairs(dynamicsigns.texts) do
                --print("Looking for id " .. k )  
                if k == dynid then  
                    --print("Found id " .. k .. " which is a " .. type(v))            
                    if type(v) == "function" then
                        signs_lib.update_sign(pos,{text = v(k)})
                    else
                        signs_lib.update_sign(pos,{text = v})
                    end    
                    return
                end
            end
            signs_lib.update_sign(pos, {text = dynid})
        end


end
minetest.register_abm({
	nodenames = signs_lib.sign_node_list,
	interval = 15,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
        dynamicsigns.update_sign(pos)
	end
})
