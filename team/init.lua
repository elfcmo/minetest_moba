local youshang=false --友伤
zsj={}
jiasu={}
local function zi_player(player)
local pos =player:getpos()
	local obj = minetest.add_entity({x=pos.x,y=pos.y+1.5,z=pos.z}, "team:xi")
	if not obj then return
  else
  return obj
  end
  
end

minetest.register_privilege("team", {
	description = "Change team",
	give_to_singleplayer = false
})
jiaflag={}
deadflag={}
if not manaflag then
manaflag={}
manamaxx={}
end
local groups={}
function apj(player)
local name=player:get_player_name()
if not jiaflag[name] then
zsj=player:get_armor_groups()
else zsj={fleshy=95, cracky=95,snappy=95,choppy=95}
end
player:set_armor_groups({fleshy=23, cracky=25,snappy=23,choppy=25})
jiaflag[name]=true
return
end

function caj(effect,player)
local name=player:get_player_name()
player:set_armor_groups(zsj)
jiaflag[name]=false
return
end
function apjj(player)
return
end

function cajj(effect,player)

return
end
function apb(player)

local xe=zi_player(player)
--local pos=player:get_pos()
  player:set_attach(xe, "bone", { x=0, y=0, z=0 }, { x=0, y=0, z=0 })
  xe:set_armor_groups({ immortal = 1 })
  xe:setvelocity({x=0,y=0,z=0})


return
end
function cab(effect,player)
player:set_detach()
return
end


playereffects.register_effect_type("jia", "护甲提升", "j.png", groups, apj, caj, false, true)
playereffects.register_effect_type("bing", "被冻住! Freezed!", "bing.png", groups, apb, cab, false, true)
playereffects.register_effect_type("jiasu", "相位移动中", "jiasu.png", groups, apjj, cajj, false, true)
playereffects.register_effect_type("jiasucd", "相位冷却中", "jiasu.png", groups, apjj, cajj, false, false)

function has_ele(list,value)
for i,val in(list) do
if val==value then
return true

else return false

end


end
end
if not team then
team={}
team.playerlist={}
end
if  not hitbacks then
hitbacks={}
hitbacks.z={}
end
local ir=1
local ib=1
bluepoint=0
redpoint=0
redgift=0
red={}
blue={}
bluegift=0
playerchat={}
minetest.register_on_joinplayer(
function(player)
player:set_properties({hp_max = 200})
local name =player:get_player_name()

deadflag[name]=true
jiaflag[name]=false
jiasu[name]=false
mana.setregen(name,0.1)
if not manaflag[name] then
mana.setmax(name,75)
elseif manaflag[name] then
mana.setmax(name,manamaxx[name])
end
if not hitbacks.z[name] then
hitbacks.z[name]={}
hitbacks.z[name].z="false"
hitbacks.z[name].jia="false"
hitbacks.z[name].bing="false"
team.save_to_file()
minetest.log("action",name.."的hit数据已保存")
end
local ip =minetest.get_player_ip(name)
dynamicsigns.register("team",function() 
  return "欢迎来到Afternoon服务器\nScore 分数 : \n\nred:" ..redpoint.." blue:"..bluepoint.."\n使用/spawn命令回到这里"
  end)
if ip == "127.0.0.1" then
  playerchat[name]=true
  --[[dynamicsigns.register("team",function() 
  return "欢迎来到Afternoon服务器\nScore 分数 : \n\nred:" ..redpoint.." blue:"..bluepoint.."\n使用/spawn命令回到这里"
  end)]]
  end
if not team.playerlist[name] then
team.playerlist[name]={}
minetest.chat_send_player(name,"choose your team by /team <red or blue> ,kill enemy to get points for your team,the one which first reach 70 wins,winner gets gifts  \n 通过/team <red 或 blue>选择队伍 率先取得70点的队伍获胜. ")
team.playerlist[name].team="none"
team.save_to_file()
else 
local zteam=team.playerlist[name].team
minetest.chat_send_player(name,"You are already in "..zteam.." team \n 已经处于"..zteam.."队伍")
if zteam=="red" then
player:set_nametag_attributes({ color = {a=255, r=255, g=11, b=11} })
team.save_to_file()
elseif zteam=="blue" then
player:set_nametag_attributes({ color = {a=255, r=11, g=102, b=255} })
team.save_to_file()
end

end
name=nil
ip=nil
end
)

do
	local filepath = minetest.get_worldpath().."/team.mt"
	local file = io.open(filepath, "r")
	if file then
		minetest.log("action", "[team] team.mt opened.")
		local string = file:read()
		io.close(file)
		if(string ~= nil) then
			local savetable = minetest.deserialize(string)
			team.playerlist = savetable.playerlist
      redpoint=savetable.savered
      bluepoint=savetable.saveblue
      hitbacks.z=savetable.hit
      manaflag=savetable.mana
      manamaxx=savetable.max
			minetest.debug("[team] team.mt successfully read.")
		end
	end
end
minetest.register_chatcommand("team", {
    params = "<text>",
    description = "red or blue",
    func=function(name,param)
      local player = minetest.get_player_by_name(name)
      if team.playerlist[name].team=="none" then
      if param=="red" then
      team.playerlist[name].team=param
      minetest.chat_send_player(name,"You are now in red team!")
      player:set_nametag_attributes({ color = {a=255, r=255, g=11, b=11} })
      elseif param=="blue" then
      team.playerlist[name].team=param
      minetest.chat_send_player(name,"You are now in blue team!")
      player:set_nametag_attributes({ color = {a=255, r=11, g=102, b=255} })
      end
      else return
      end
      player=nil
      team.save_to_file()
    end,
})

minetest.register_chatcommand("change", {
    privs = {team = true},
    params = "<text>",
    description = "player team change",
    func=function(name,param)
      local player = minetest.get_player_by_name(param)
      if player then
      if team.playerlist[param].team=="none" then
      end
      if team.playerlist[param].team=="red" then
      team.playerlist[param].team="blue"
      minetest.chat_send_player(param,"You are now in blue team!")
      player:set_nametag_attributes({ color = {a=255, r=11, g=102, b=255} })

      elseif team.playerlist[param].team=="blue" then
      team.playerlist[param].team="red"
      minetest.chat_send_player(param,"You are now in red team!")
      player:set_nametag_attributes({ color = {a=255, r=255, g=11, b=11} })
      end
      player=nil
      team.save_to_file()
      end
    end,
})




minetest.register_chatcommand("s", {
    params = "",
    description = "chat kanji",
    func=function(name,param)
      local player = minetest.get_player_by_name(name)
      if playerchat[name] then
      local file = io.open(minetest.get_worldpath().."/chat.txt", "r")
      local string = file:read()
      io.close(file)
      minetest.chat_send_all("<"..name..">"..string)
      player=nil
      end
    end,
})



function team.save_to_file()
	local savetable = {}
	savetable.playerlist = team.playerlist
 

  savetable.savered=redpoint
  savetable.saveblue=bluepoint
  savetable.hit=hitbacks.z
  savetable.mana=manaflag
  savetable.max=manamaxx
	local savestring = minetest.serialize(savetable)
  
	local filepath = minetest.get_worldpath().."/team.mt"
	local file = io.open(filepath, "w")
	if file then
		file:write(savestring)
		io.close(file)
		
	else
		minetest.log("error", "[team] Failed to write team data into "..filepath..".")
	end
end

minetest.register_on_dieplayer(function(player)
  local name =player:get_player_name()
  local pan=team.playerlist[name].team
 -- if reason.type=='punch' then
    --local name2 =reason.object:get_player_name()
 -- if pan=="red" and playerlist[name2]=='blue' then
if deadflag[name] then
if pan=="red"  then
 bluepoint=bluepoint+1
 minetest.chat_send_all("红队一名成员阵亡 a red team member has died")
 deadflag[name]=false
 -- elseif pan=="blue" and playerlist[name2]=='red' then
  elseif pan=="blue" then
  redpoint=redpoint+1
   minetest.chat_send_all("蓝队一名成员阵亡 a blue team member has died")
    deadflag[name]=false
  end
  end
--  end
  team.save_to_file()
return

end)

minetest.register_on_respawnplayer(function(player)
  local name =player:get_player_name()
  mana.set(name,mana.getmax(name))
  deadflag[name]=true

end
)

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 0.8 then


		if redpoint >= 70 then
    minetest.chat_send_all(" 红队获胜!red team won!")
    redpoint=0
    bluepoint=0
    redgift=1
    team.save_to_file()
    elseif bluepoint >= 70 then
    minetest.chat_send_all("蓝队获胜!blue team won!")
    redpoint=0
    bluepoint=0
    bluegift=1
    team.save_to_file()
    end
    end
    if timer >= 4.8 then
    local cls=minetest.get_connected_players()
    local itemstack1 = ItemStack("clawshot:clawshot_gold 1")
        local itemstack2 = ItemStack("rangedweapons:9mm 1000")
            local itemstack3 = ItemStack("default:gold_ingot 10")
          local itemstack4= ItemStack("qt:gold_apple 20")
          local itemstack5= ItemStack("rasengen:money 6")
           local itemstack6 =ItemStack("shop:coin 10")
    for _,player in ipairs(cls) do
    local name = player:get_player_name()
    if redgift==1 and team.playerlist[name].team=="red" then
    local ri= player:get_inventory()
    minetest.chat_send_player(name,"恭喜 奖励已发放 congratulations items added to inventory")
    ri:add_item("main", itemstack1)
        ri:add_item("main", itemstack2)
            ri:add_item("main", itemstack3)
            ri:add_item("main", itemstack4)
            ri:add_item("main", itemstack5)
            ri:add_item("main", itemstack6)
    redgift=0
    elseif bluegift==1 and team.playerlist[name].team=="blue" then
    local ri2= player:get_inventory()
    ri2:add_item("main", itemstack1)
        ri2:add_item("main", itemstack2)
            ri2:add_item("main", itemstack3)
            ri2:add_item("main", itemstack4)
            ri2:add_item("main", itemstack5)
            minetest.chat_send_player(name,"恭喜 奖励已发放 congratulations items added to inventory")
    bluegift=0
    
    end
    end
end
end)

minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
local name = player:get_player_name()

if hitbacks.z[name].z=="true" then
local hitchance=math.random(1.0,100.0)

if hitchance <= 11.0 and hitchance > 2.0 then
minetest.sound_play({ pos = player:get_pos(), name = "h", gain = 10, max_hear_distance = 500 })
minetest.chat_send_player(name,"触发被动反击! triggered passive hitback!")
if hitter:is_player() then
minetest.chat_send_player(hitter:get_player_name(),"你受到被动反击! attacked by triggered passive hitback!")
end
if damage<=21 then
hitter:punch(player, 1.9, {damage_groups = {fleshy=damage*(100/(player:get_armor_groups().fleshy))+math.random(7.9,8.3), snappy=8.2, choppy=7.9}}, nil)
else
hitter:punch(player, 1.9, {damage_groups = {fleshy=30, snappy=8.2, choppy=7.9}}, nil)
end
if hitter:is_player() then
local hhname = hitter:get_player_name()
if not (team.playerlist[name].team==team.playerlist[hhname].team)  then
player:set_hp(player:get_hp()-damage)
if damage<=21 then
player:set_hp(player:get_hp()+(damage*(100/(player:get_armor_groups().fleshy))*hitter:get_armor_groups().fleshy/100+math.random(7.9,8.3))*0.55)
else
player:set_hp(player:get_hp()+30*0.55)
end

end
else
player:set_hp(player:get_hp()-damage)
if damage<=21 then
player:set_hp(player:get_hp()+(damage+math.random(7.9,8.3))*0.55)
else
player:set_hp(player:get_hp()+30*0.55)
end

end
else
if not youshang then
if hitter:is_player() then
local hname= hitter:get_player_name()
if team.playerlist[name].team==team.playerlist[hname].team and (team.playerlist[name].team~="none") then
if player==hitter then
 damage=damage
player:set_hp(player:get_hp()-damage)

else damage=0
end
else damage=damage
player:set_hp(player:get_hp()-damage)
end
else damage=damage
player:set_hp(player:get_hp()-damage)
end
else damage=damage
player:set_hp(player:get_hp()-damage)

end

end



else 
if not youshang then
if hitter:is_player() then
local hname= hitter:get_player_name()
print(hname.."yeahhhhh")
if (team.playerlist[name].team==team.playerlist[hname].team) and (team.playerlist[name].team~="none") then
damage=0
else damage=damage
player:set_hp(player:get_hp()-damage)
end
else
damage=damage
player:set_hp(player:get_hp()-damage)
end
else damage=damage
player:set_hp(player:get_hp()-damage)

end

end




if not jiaflag[name] then
if  hitbacks.z[name].jia=="true" then

local jia=math.random(1.0,100.0)
if jia <= 8.7 then
playereffects.apply_effect_type("jia",4.5,player)
minetest.sound_play({ pos = player:get_pos(), name = "jia", gain = 10, max_hear_distance = 500 })
minetest.chat_send_player(name,"触发被动护甲提升 持续4.5秒! triggered passive armor increase ,last 4.5s!")
minetest.chat_send_all(name.."触发被动护甲提升 持续4.5秒!"..name.." triggered passive armor increase ,last 4.5s!")
end
end
end



if  hitbacks.z[name].bing=="true" then

local bn=math.random(1.0,100.0)
if bn <= 4.7 and bn > 2.2 then
if hitter:is_player() then
if team.playerlist[name].team~=team.playerlist[hitter:get_player_name()].team and team.playerlist[name].team~="none" then
playereffects.apply_effect_type("bing",4,hitter)
minetest.sound_play({ pos = player:get_pos(), name = "jia", gain = 10, max_hear_distance = 200 })
minetest.chat_send_player(name,"触发被动冰冻 持续4秒! triggered passive freeze ,last 4s!")
minetest.chat_send_all(hitter:get_player_name().."被冻住 持续4秒!"..hitter:get_player_name().." is freezed ,last 4s!")
end
else 
local xxe=zi_player(hitter)
--local pos=hitter:get_pos()
  hitter:set_attach(xxe, "bone", { x=1, y=1, z=2 }, { x=0, y=0, z=0 })
  xxe:set_armor_groups({ immortal = 1 })
  xxe:setvelocity({x=0,y=-0,z=0})
minetest.sound_play({ pos = player:get_pos(), name = "jia", gain = 10, max_hear_distance = 200 })
minetest.chat_send_player(name,"触发被动冰冻 持续4秒! triggered passive freeze ,last 4s!")
minetest.chat_send_all(hitter:get_player_name().."被冻住 持续4秒!"..hitter:get_player_name().." is freezed ,last 4s!")
end

end
end






return true
end

)


minetest.register_craftitem("team:hitback", {
	description = "被动:反击(55%吸血,10%概率)passive skill:hitback(55% life drain ,10% chance)",
	tiles = {"h.png"},
	visual_scale = 1.0,
	inventory_image = "h.png",
	wield_image = "h.png",
  stack_max = 1,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(item, placer, pos)
      local uname = placer:get_player_name()
      local x =ItemStack(itemstack)
      minetest.chat_send_player(uname,"你习得了被动技能:反击! you've learned passive skill:hitback!")
      hitbacks.z[uname].z="true"
      item:take_item()

      team.save_to_file()
      		return item
	end,
--	TODO.
--	on_place = minetest.rotate_node
})



minetest.register_craftitem("team:jia", {
	description = "被动:受到攻击8.7%概率提升至200护甲",
	tiles = {"j.png"},
	visual_scale = 1.0,
	inventory_image = "j.png",
	wield_image = "j.png",
  stack_max = 1,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(item, placer, pos)
      local uname = placer:get_player_name()
      local x =ItemStack(itemstack)
      minetest.chat_send_player(uname,"你习得了被动技能:护甲提升! you've learned passive skill:armor increase!")
      hitbacks.z[uname].jia="true"
      item:take_item()

      team.save_to_file()
      		return item
	end,
--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_craftitem("team:dust", {
	description = "显影之尘 true sight dust(show invisible player)",
	tiles = {"xian.png"},
	visual_scale = 1.0,
	inventory_image = "xian.png",
	wield_image = "xian.png",
  stack_max = 199,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(item, placer, pos)
      local uname = placer:get_player_name()
      local pos = placer:get_pos()
      minetest.sound_play({ pos = pos, name = "xian", gain = 10, max_hear_distance = 30 })
     local objz= minetest.get_objects_inside_radius(pos, 7)
     for i,obj in ipairs(objz) do
     if obj:is_player() then
     if obj then
     --if obj ~= user then
      invisible(obj,nil)
     -- end
     end
     
     end
     
     end
      item:take_item()

      --team.save_to_file()
      		return item
	end,
--	TODO.
--	on_place = minetest.rotate_node
})


minetest.register_craftitem("team:mo", {
	description = "被动技能:魔法增长 释放技能有机率增加魔法上限 最高永久至150 再往上的数值持续一小时  passive :mana growth, max up to 150 by making spell,value beyond 150 last 1 hour ",
	tiles = {"manan.png"},
	visual_scale = 1.0,
	inventory_image = "manan.png",
	wield_image = "manan.png",
  stack_max = 1,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(item, placer, pos)
      local uname = placer:get_player_name()
    --  local x =ItemStack(itemstack)
      minetest.chat_send_player(uname,"你习得了被动技能:魔法增长 ! you've learned passive skill:mana growth!")
      manaflag[uname]=true
      if not manamaxx[uname] then
      manamaxx[uname]=75
      end
      item:take_item()

      team.save_to_file()
      		return item
	end,
--	TODO.
--	on_place = minetest.rotate_node
})




minetest.register_craftitem("team:bing", {
	description = "被动技能:冰冻 受到攻击时有机率冻结攻击者 持续4秒  passive :freeze",
	tiles = {"bing.png"},
	visual_scale = 1.0,
	inventory_image = "bing.png",
	wield_image = "bing.png",
  stack_max = 1,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(item, placer, pos)
      local uname = placer:get_player_name()
    --  local x =ItemStack(itemstack)
      minetest.chat_send_player(uname,"你习得了被动技能:冰冻 ! you've learned passive skill:freeze!")
      hitbacks.z[uname].bing="true"
      item:take_item()

      team.save_to_file()
      		return item
	end,
--	TODO.
--	on_place = minetest.rotate_node
})











local timer = 0

minetest.register_globalstep(function(dtime)
  timer = timer+dtime
  if timer >= 0.3 then
    timer=0
    for _,player in ipairs(minetest.get_connected_players()) do
      local playername=player:get_player_name()
      if jiasu[playername] then
     else


      
      -- if key == "W" and dir then
      --   key_press = ctrl.aux1 and ctrl.up or key_press and ctrl.up
      -- elseif key == "W" then
      --   key_press = ctrl.aux1 or key_press and key_tap
      -- end

      if  player:get_player_control().aux1  then
      if not slowflag[playername] then
      
      playereffects.apply_effect_type("jiasu",5.9,player)
      playereffects.apply_effect_type("jiasucd",12.8,player)
            jiasu[playername]=true
      player:set_physics_override({speed = 2.3 ,jump = 2.1})
       minetest.after(5.9,function()
       player:set_physics_override({speed = 1.0 ,jump = 1.0})
       minetest.after(6.9,function()
      jiasu[playername]=false
      
      end)
           end )
      else
      minetest.chat_send_player(player:get_player_name(),"被减速 无法开启相位")
      end
     
      
      
      

     else 
end
end

end
      end
end)










minetest.register_entity("team:xi", {
	physical = true,
	collisionbox = {0, 0, 0, 0, 0, 0},
  state = "inactive",
 textures ={"bingg.png"},
	on_activate = function(self, staticdata)
    self.timer=4.1
	end,

	on_step = function(self, dtime)

  self.timer=self.timer-dtime
    if self.timer<=0 then
    
    self.object:remove()
    self.timer=4.1
    return
    end
    

  end,

	get_staticdata = function() 
  return "" 
  end
})



