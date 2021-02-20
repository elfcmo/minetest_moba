local readyra = {}
local groups={}--如果不显示就加这一行
local gr={}
function ap(player)



end

function ca(effect,player)



end
playereffects.register_effect_type("rasa", "螺旋丸冷却 rasengan cooldown", "rasen.png", groups, ap, ca, false,false)
playereffects.register_effect_type("rasada", "大玉螺旋丸冷却 oodamarasengan cooldown", "rasen.png", groups, ap, ca, false, false)
minetest.register_tool("rasengen:rasen", {
	description = "rasengan螺旋丸",
	inventory_image = "rasen.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=1,
    groups=sasa,
		damage_groups = {fleshy=6},
	},
	on_use =  function(itemstack, user, pointed_thing)
         itemstack:set_wear(1)

                 local rightflag=0
                      local zf= user:get_look_yaw()
                      local pname = user:get_player_name()
   if readyra[pname] then
       if mana.get(pname)>25 then
      if pointed_thing.type=="object" then

      readyra[pname]=false
                if manaflag[pname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(pname,"魔法上限增加! max mana increased!!")
          if mana.getmax(pname)>=150 then
            mana.setmax(pname,mana.getmax(pname)+5)
            minetest.after(3600,function()
            mana.setmax(pname,mana.getmax(pname)-5)
            
            end)
            
            elseif mana.getmax(pname)<150 then
             mana.setmax(pname,mana.getmax(pname)+5)
             manamaxx[pname]=mana.getmax(pname)
          end
          
          end
              team.save_to_file()
          end
     -- local possdd=minetest.get_pointed_thing_position(pointed_thing,true)
      local possdd=pointed_thing.ref:get_pos()
      if possdd~= nil then
      local ssdir = user:get_look_dir() 
      local rotat= {"I", "FX"}
        if pointed_thing~= nil then
                local xc = 45
 
   if user:get_player_control().RMB then
     xc=160
     rightflag=1
     if huiyao[pname] then
     minetest.chat_send_all(pname..":火耀螺旋丸!!!")
     end

      minetest.sound_play({ pos = pos, name = "rasa2", gain = 0.6, max_hear_distance = 500 })
      else
        minetest.sound_play({ pos = pos, name = "ra", gain = 1, max_hear_distance = 500 })
        end

        
        pointed_thing.ref:move_to({x=possdd.x+ssdir.x*2,y=possdd.y,z=possdd.z+ssdir.z*2},true)
         local possdd2=pointed_thing.ref:get_pos()

        local partdef={
			pos = {x=possdd2.x, y=possdd2.y, z=possdd2.z}, --minpos
			velocity ={x=0, y=0, z=0}, --maxvel
			acceleration={x=0,y=0,z=0}, --maxacc
			expirationtime =0.5, --minexptime
			size =xc, --minsize
		collisiondetection =	true, --collisiondetection
     vertical = false,
     glow = 2,
			texture ="sa.png",
automatic_rotate=math.pi*3.3
     
       }


       if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
       minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
    partdef.texture="sa2.png"
    if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
     partdef.texture="sa1.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
     partdef.texture="sa3.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
     partdef.texture="sa4.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		)  minetest.after(0.1, function()
     partdef.texture="sa5.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) 
     minetest.after(0.1, function()
     partdef.texture="sa6.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
     partdef.texture="sa7.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
		) minetest.after(0.1, function()
     partdef.texture="sa8.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa9.png"
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa10.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa11.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa12.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa1.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa2.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa3.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa4.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa5.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa6.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa7.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa8.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa9.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa10.png"
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa11.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa12.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa1.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa2.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa3.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa4.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa5.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa6.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa7.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa8.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa9.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa10.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  minetest.after(0.1, function()
     partdef.texture="sa11.png"
     if huiyao[pname] then
       
     partdef.texture= partdef.texture.."^[colorize:#FF3E1C:160"
       end
    minetest.add_particle(
       partdef
       
		)  
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    end)
    minetest.sound_play({ pos = pos, name = "rasa", gain = 1, max_hear_distance = 500 })
        pointed_thing.ref:set_look_horizontal(math.rad(90))
       pointed_thing.ref:set_velocity({x=ssdir.x*15,y=ssdir.y*15,z=ssdir.z*15})
        pointed_thing.ref:setyaw(zf+math.pi)
         pointed_thing.ref:set_look_vertical(math.rad(45)+1)
          pointed_thing.ref:set_look_horizontal(math.rad(45)-6)
            pointed_thing.ref:set_properties({automatic_rotate=math.pi*3.3})
            minetest.after(0.5, function()
            if pointed_thing ~= nil then
            pointed_thing.ref:set_pos(possdd)
            minetest.after(0.5, function()
            if pointed_thing ~= nil then
            pointed_thing.ref:set_pos(possdd)
            end
            end)
            end
            end)
           minetest.after(2.1, function()
             pointed_thing.ref:set_properties({automatic_rotate=0})--不能是false 而要是0 很奇怪
           minetest.after(0.4, function()
    --     pointed_thing.ref:set_hp(2)
    if rightflag==1 then
    if huiyao[pname] then
    pointed_thing.ref:punch(user,1.0,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(47,52), snappy=24, choppy=22}},nil)
    elseif not huiyao[pname] then
     pointed_thing.ref:punch(user,1.0,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(29,42), snappy=24, choppy=22}},nil)
    end
    else

            pointed_thing.ref:punch(user,1.0,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(14,22), snappy=14, choppy=12}},nil)
        end
           if pointed_thing~= nil and user~=nil then
           pointed_thing.ref:set_look_horizontal(math.rad(15)-6)
             pointed_thing.ref:set_velocity({x=ssdir.x*15,y=ssdir.y*15,z=ssdir.z*15})
          pointed_thing.ref:setyaw(zf+math.pi)
        pointed_thing.ref:move_to({x=possdd.x+ssdir.x*3,y=possdd.y,z=possdd.z+ssdir.z*3},true)
         pointed_thing.ref:move_to({x=possdd.x+ssdir.x*4,y=possdd.y,z=possdd.z+ssdir.z*4},true)
        pointed_thing.ref:move_to({x=possdd.x+ssdir.x*5,y=possdd.y,z=possdd.z+ssdir.z*5},true)
          pointed_thing.ref:set_look_vertical(1)
          pointed_thing.ref:set_look_horizontal(62)

         

         end
           end)
           end)
      

        end
        end
        if rightflag==1 then
        mana.subtract_up_to(pname, 35)
        if huiyao[pname] then
      mana.subtract_up_to(pname, 20)
        end
        playereffects.apply_effect_type("rasada",37.5,user)
        minetest.after(35.5, function()
        readyra[pname]=true
        rightflag=0
        end)
        else
          mana.subtract_up_to(pname, 25)
         playereffects.apply_effect_type("rasa",27.5,user)
         minetest.after(25.5, function()
        readyra[pname]=true
        end)
        end
        end
        else minetest.chat_send_player(pname,"魔法不足..")
        end
        else minetest.chat_send_player(user:get_player_name(),"冷却cooldown...")
        end


      return itemstack
	end,
	on_drop=function(itemstack, dropper, pos)
if dropper~=nil then
if dropper:is_player() then
local uname = dropper:get_player_name()
if sarinin[uname] then
return nil
else minetest.item_drop(itemstack, dropper, pos)
itemstack:take_item()
return itemstack
end
end
end

end
})


minetest.register_node("rasengen:money", {
    description = "unique money",
    -- Regular tiles, as usual
    -- The dirt tile disables palette coloring
    tiles = { {name = "rm.png"},
        {name = "rm2.png", color = "white"}},
    -- Overlay tiles: define them in the same style
    -- The top and bottom tile does not have overlay
     overlay_tiles = {"", "",
        {name = "rm.png", tileable_vertical = false}},
    -- Palette in the world
    paramtype2 = "color",
    drawtype = "normal",
    pointable = true,
    stack_max = 99
})


minetest.register_on_joinplayer(
function(player)
local name =player:get_player_name()
readyra[name]=true
end
)


minetest.register_tool("rasengen:sword_of_envy", {
	description = "Sword of Envy 与最近的单位换血(按 q 键发动) exchange hp with nearest unit(press q to use)",
	inventory_image = "sword_of_envy.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =0.9 ,
		max_drop_level=1,
		damage_groups = {fleshy=14},
	},
	on_drop = function(itemstack, dropper, pos)
          itemstack:set_wear(0)
          local dropname=dropper:get_player_name()
          if mana.get(dropname)>=55 then
            mana.subtract(dropname, 55)
          minetest.chat_send_all(dropper:get_player_name().."使用换血 used sword of envy")
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
	    for _,obj in ipairs(objects) do
	        if flag == 0 then
	            local pname = dropper:get_player_name()
	                    if (obj:is_player()) then
	                        --minetest.chat_send_all("Giocatore")
	                        if (obj:get_player_name()~=dropper:get_player_name()) then
	                            local hpp = obj:get_hp()
								obj:set_hp(dropper:get_hp())
								dropper:set_hp(hpp)
                if obj:get_hp()<40 then
                obj:set_hp(40)
                end
                 if dropper:get_hp()<40 then
                dropper:set_hp(40)
                end
	                            flag = 1


	                        end
	                    else
	                        if (obj:get_luaentity().health) then
								local hpp = obj:get_luaentity().health
								obj:get_luaentity().health = dropper:get_hp()
									dropper:set_hp(hpp)
                  if obj:get_hp()<40 then
                obj:set_hp(40)
                end
                 if dropper:get_hp()<40 then
                dropper:set_hp(40)
                end
	                          
	                            flag = 1

	                          
	                        end
	                    end
	        end
	    end
      else minetest.chat_send_player(dropname,"魔法不足 no enough mana")
      end
	end,
})
