local ready1={}
local ready2={}
local ready3={}
local ready4 ={}
local ready5={}
local ready6={}
local  ready7={}
local ready8={}
local ready9={}
local ready10 ={}
local ready11 ={}
local ready13 ={}
local ready18 ={}
local ready14 ={}
local ready15={}
local ready16={}
local ready19={}
local ready20={}
local cause={}
local ready21={}
local ready22={}
local ready23 ={}
local tag={}
local panding={}
local moflag={}
local heroinmo={}
local icetime={}
local uupos
local dibaoflag={}
windflag={}
slowflag={}
playerbz={}
huiyao={}
local gr={}
local ready17={}
sarinin={}
sasa={}
--local readyrun={}
local sa={}
local players={}
local playerin={}
local playerhui={}
local playerren={}
local playerfu={}
local xd={}
local rflag={}
local blink={}
local readyblink={}
local chibaku={}
local chibaku2={}
local chibaku_node={}
local poss={x=1,y=1,z=1}
local ss3
local posst
local groups={}
local ready12={}
local playkey={}
local keyflag={}
local candrain={}
local recovertimer=0
local chatflag={}
local finishcan={}
--local stillrun={}
local canre={}
local jifeng={}

function isNaN( _v )
    return _v~=_v;
end

--[[
function zs(player)
 local playername=player:get_player_name()
 if  not stillrun[playername] then
 canre[playername]=true
 end
 if candrain[playername] >=2 then
 if candrain[playername]>=8 then
 stillrun[playername]=true
 end
 if stillrun[playername]==true then
 chatflag[playername]=true
 player:set_physics_override({speed = 3.9 ,jump = 1.6})
 else  
 if not jifeng[playername] then
 player:set_physics_override({speed = 1 ,jump = 1})
 end
 end
 else
 chatflag[playername]=false
 if not jifeng[playername] then
 player:set_physics_override({speed = 1 ,jump = 1})
 end
 end
end
function drain(player)

 local playername=player:get_player_name()


 if stillrun[playername] then
  canre[playername]=false
candrain[playername] = candrain[playername]-1.3
end
if candrain[playername]< 2  and chatflag[playername] then
minetest.chat_send_player(playername,"体力用光了 no more stamina")
canre[playername]=true
stillrun[playername]=false
chatflag[playername]=false
end
end
function recover(player)
local playername=player:get_player_name()
if canre[playername] then
candrain[playername] = candrain[playername]+0.7

end
 
end
]]
function apblade(player)
local uname=player:get_player_name()
playerren[uname]=true

end
function cablade(effect,player)
local uname=player:get_player_name()
playerren[uname]=false

end
function aphui(player)
local uname=player:get_player_name()
playerhui[uname]=true

end
function cahui(effect,player)
local uname=player:get_player_name()
playerhui[uname]=false

end
function apyue(player)

end
function cayue(effect,player)
end
--[[
function carun(effect,player)
readyrun=true
end
]]
function apfu(player)
local uname=player:get_player_name()
playerfu[uname]=true
end
function cafu(effect,player)
local uname=player:get_player_name()
playerfu[uname]=false
end

function apm(player)
local name = player:get_player_name()
mana.setregen(name,0)
--ready15[uname]=false
end

function cam(effect,player)
local name = player:get_player_name()
mana.setregen(name,0.27)
--ready15[uname]=true
end
--[[function run(player)
player:set_physics_override({speed = 4.2 ,jump = 1.3})
jifeng[player:get_player_name()]=true
end
function runcl(effect,player)
player:set_physics_override({speed = 1, jump = 1})
jifeng[player:get_player_name()]=false
end
]]
function casa(effect,player)
local name = player:get_player_name()
sarinin[name]=false

end

playereffects.register_effect_type("blademail", "刃甲Blademail", "ren.png", groups, apblade, cablade, false, true)
playereffects.register_effect_type("hui", "回光反照", "hui.png", groups, aphui, cahui, false, true)
playereffects.register_effect_type("yue", "月读tsukuyomi", "yue.png", groups, apyue, cayue, false, true)
playereffects.register_effect_type("bl", "刃甲冷却cooldown", "ren.png", groups, apyue, apyue, false, false)
playereffects.register_effect_type("huil", "回光反照冷却cooldown", "hui.png", groups, apyue, apyue, false, false)
playereffects.register_effect_type("fu", "负极(只减不增) 治疗将转为伤害", "fu.png", groups, apfu, cafu, false, true)
playereffects.register_effect_type("lift", "闪烁匕首冷却", "lift.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("run", "相位", "run.png", groups, run, runcl, false, true)
playereffects.register_effect_type("runcd", "相位cd", "run.png", groups, apyue, carun, false, false)
playereffects.register_effect_type("chiba", "距离可对敌释放还有", "chi.png", groups, apyue, cayue, false, true)
playereffects.register_effect_type("chiba2", "地爆天星冷却 chibakutensei cooldown", "chi.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("blade", "无敌斩冷却", "sword.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("windb", "飓风球冷却", "windball.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("manadcd", "止魔冷却", "mt.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("manad", "魔法停滞 mana nogen", "mt.png", groups, apm, cam, false, true)
playereffects.register_effect_type("sharingan", "写轮眼复制持续中 sharingan copy effect", "sarin.png", groups, apyue, casa, false, true)
playereffects.register_effect_type("sharingancd", "写轮眼冷却 sharingan cd", "sarin.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("icecd", "连环霜冻冷却 chain ice cd", "ices.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("sbi", "影刃持续中 shadow blade", "sb.png", groups, apyue, cayue, false, true)
playereffects.register_effect_type("sbc", "影刃冷却中 shadow blade cd", "sb.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("slow", "减速中 slowed down", "slowdown.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("flame", "大蛇薙冷却中 orochi-killing flame cd", "da.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("fu", "缚魂冷却中 soul lock cd", "mo.png", groups, apyue, cayue, false, false)
playereffects.register_effect_type("fub", "被缚魂 soul locked", "mo.png", groups, apyue, cayue, false, false)


minetest.register_on_joinplayer(
function(player)
local uname = player:get_player_name()
windflag[uname]=false
ready1[uname]=true
ready2[uname]=true
huiyao[uname]=false
playerbz[uname]=false
ready3[uname]=true
ready4[uname]=true
 icetime[uname]=0
ready5[uname]=true
slowflag[uname]=false
sarinin[uname]=false
ready6[uname]=true
ready7[uname]=true
ready8[uname]=true
ready9[uname]=true
ready10[uname]=true
ready11[uname]=true
ready12[uname]=true
ready13[uname]=true
ready14[uname] =true
ready16[uname]=true
ready15[uname] = true
ready20[uname]=true
ready17[uname] = true
ready18[uname]=true
ready19[uname]=true
ready21[uname]=true
 ready22[uname]=true
 ready23[uname]=true
readyblink[uname]=true
rflag[uname]=false
jifeng[uname]=false
dibaoflag[uname]=false
moflag[uname]=false
candrain[uname]=16
minetest.after(5,function()
finishcan[uname]=true

end)
players[uname]=1
blink[uname]=true
chibaku2[uname]=true
end
)


minetest.register_privilege("sa", {
	description = "Change the weather and date",
	give_to_singleplayer = false
})
minetest.register_on_punchnode(function(pos, node, player)
  print(minetest.pos_to_string(pos))
  end
  )
local groups = {choppy=2, dig_immediate=3, picture=1}
minetest.register_chatcommand("elec", {
    privs = {sa = true},
    params = "<numer> <number> <number> <number> <number> <number> <number> <number> <number>",
    description = "row and column based on image number*3 and node number start& end&nr&nc",
    func=function(name,param)
      param=param:split(" ")
      for n=param[2],param[2]+param[4] do
        for s=param[3],param[3]+param[5] do
          minetest.set_node({x=param[1],y=n,z=s},{name="default:stone"})
        end
    
    
    end
    local ns=param[6]
    for m=param[2]+param[4]-1,param[2]+1,-3 do

      for ss=param[3]+1,param[3]+param[5]-1,3 do

        minetest.env:set_node({x=param[1]+1,y=m,z=ss},{name="gemalde:node_"..ns,param2=3})
        ns=ns+1
      end
    end
    ns=nil
    end,
})

minetest.register_chatcommand("elecback", {
    privs = {sa = true},
    params = "<numer> <number> <number> <number> <number> <number> <number> <number> <number>",
    description = "row and column based on image number*3 and node number start& end&nr&nc",
    func=function(name,param)
      param=param:split(" ")
      for n=param[2],param[2]+param[4] do
        for s=param[3],param[3]+param[5] do
          minetest.remove_node({x=param[1],y=n,z=s})
        end
    
    
    end
    local ns=param[6]
    for m=param[2]+param[4]-1,param[2]+1,-3 do

      for ss=param[3]+1,param[3]+param[5]-1,3 do

        minetest.remove_node({x=param[1]+1,y=m,z=ss})
        ns=ns+1
      end
    end
    ns=nil
    end,
})
minetest.register_chatcommand("shock", {
    privs = {sa = true},
    params = "<text>",
    description = "row and column based on image number*3 and node number start& end&nr&nc",
    func=function(name,param)
    if param ~= ''
    then
      local player =minetest.get_player_by_name(param)
      lightning.strike({x=math.floor(player:getpos().x),y=math.floor(player:getpos().y),z=math.floor(player:getpos().z)},minetest.get_player_by_name(name))
        minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
    else 
      return false, "wrong param"
    end
    player=nil
    end,
})

minetest.register_node("sa:shock", {
	description = "shock someone 目标五秒内无论跑多远都会被传到原地并被至少雷击一次",
	tiles = {"shock.png"},
	visual_scale = 1.0,
	inventory_image = "shock.png",
	wield_image = "shock.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local pname=user:get_player_name()
               itemstack:set_wear(0)
 
      if ready1[pname] then
       if mana.get(pname)>10 then
       mana.subtract(pname,10)
        local ppoo =minetest.get_pointed_thing_position(pointed_thing, true)
        local poss={x=math.floor(user:getpos().x),y=math.floor(user:getpos().y),z=math.floor(user:getpos().z)}
        lightning.strike({x=poss.x+7,y=poss.y,z=poss.z+5},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z+7},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z+5},user)
        lightning.strike({x=poss.x+7,y=poss.y,z=poss.z-5},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z-7},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z-5},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z-4},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z-3},user)
        lightning.strike({x=poss.x+5,y=poss.y,z=poss.z-2},user)
        lightning.strike({x=poss.x-7,y=poss.y,z=poss.z+5},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z+7},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z+5},user)
        lightning.strike({x=poss.x-7,y=poss.y,z=poss.z-5},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z-7},user)
        lightning.strike({x=poss.x-6,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z-6},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z-5},user)
         lightning.strike({x=poss.x-6,y=poss.y,z=poss.z-4},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z-3},user)
        lightning.strike({x=poss.x-5,y=poss.y,z=poss.z-2},user)
        lightning.strike({x=poss.x-7,y=poss.y,z=poss.z},user)
        lightning.strike({x=poss.x+6,y=poss.y,z=poss.z},user)
        lightning.strike({x=poss.x,y=poss.y,z=poss.z+6},user)
        lightning.strike({x=poss.x,y=poss.y,z=poss.z-6},user)
        minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
        if ready1[pname]==true then
        ready1[pname]=false
        end
        minetest.after(5,function()
          if pointed_thing.type=="object" then
          pointed_thing.ref:set_pos(ppoo)
          end
          lightning.strike(ppoo,user)
           minetest.after(15,function()
          ready1[pname]=true
          pname=nil
          end)
        end
        )
        else minetest.chat_send_player(pname,"魔法不足 no enough mana...")
        end
        end
      
  
	end,

--	TODO.
--	on_place = minetest.rotate_node
})
minetest.register_tool("sa:lift", {
	description = "lift high,fall painfully(blink)",
	tiles = {"lift.png"},
	visual_scale = 1.0,
	inventory_image = "lift.png",
	wield_image = "lift.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local pname=user:get_player_name()
               itemstack:set_wear(0)
 
  if readyblink[pname] then
   if user:get_player_control().RMB then
       local upos=user:get_pos()
       local udir=user:get_look_dir()
   if user:get_player_control().up then
   if blink[pname] then
   user:move_to({x=upos.x+udir.x*23,y=upos.y,z=upos.z},true)
   playereffects.apply_effect_type("lift",11,user)
         readyblink[pname]=false
      minetest.after(11,function()
      readyblink[pname]=true
      end)
   else minetest.chat_send_player(pname,"受到攻击五秒内无法闪烁 can't blink")
   end
   return
   end
          readyblink[pname]=false
           playereffects.apply_effect_type("lift",11,user)
      minetest.after(11,function()
      readyblink[pname]=true
        pname=nil
      end)
    user:set_pos({x=upos.x,y=upos.y+13,z=upos.z})
   return
   end
  if mana.get(pname)>7 then
    if pointed_thing.type=="object" then
    mana.subtract(pname,7)
      ss=pointed_thing.ref:get_pos()
      pointed_thing.ref:move_to({x=ss.x,y=ss.y+19,z=ss.z},true)
      readyblink[pname]=false
       playereffects.apply_effect_type("lift",11,user)
      minetest.after(11,function()
      readyblink[pname]=true
        pname=nil
            end)
      end
      else minetest.chat_send_player(pname,"魔法不足 no enough mana...")
      end

      

      else 
      minetest.chat_send_player(pname,"冷却 cooldown...")
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

--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_node("sa:shh", {
	description = "sudden hit",
	tiles = {"shh.png"},
	visual_scale = 1.0,
	inventory_image = "shh.png",
	wield_image = "shh.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
    local ssdddir=user:get_look_dir()
    local upos=user:get_pos()
    print("yeah "..ssdddir.x)
    lightning.strike({x=upos.x+ssdddir.x*6.5,y=upos.y,z=upos.z+ssdddir.z*6.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
    ssdddir=nil
    upos=nil
	end,

--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_tool("sa:slsword", {
	description = "illusion blade 幻影(无敌)斩",
	tiles = {"sword.png"},
	visual_scale = 1.0,
	inventory_image = "sword.png",
	wield_image = "sword.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
               itemstack:set_wear(0)
 
   local rotat= {"I", "FX"}
  if ready2[uname] then
   local function ssa(x,y,z,n)
         if players[uname]~=nil then
      playerin[uname]=true
    if pointed_thing.type=="object" then
     -- local possdd=minetest.get_pointed_thing_position(pointed_thing,true)
      local possdd2=pointed_thing.ref:get_pos()
      if user:get_player_control().RMB then
        rflag[uname]=true
        if pointed_thing~=nil and possdd2~=nil then
        pointed_thing.ref:set_pos({x=possdd2.x,y=possdd2.y+45,z=possdd2.z})
        if players[uname]~=nil then
        user:move_to({x=possdd2.x+2,y=possdd2.y+45,z=possdd2.z},true)
        end
         end
      end
      local possdd=pointed_thing.ref:get_pos()

      if possdd~= nil then
        if players[uname]~=nil then
        user:move_to({x=possdd.x+x,y=possdd.y+y,z=possdd.z+z},true)
        end
        local pos2=user:get_pos()
        if pos2 then
        local zv=vector.direction(possdd,pos2)
        if zv.z<0 then
        user:set_look_horizontal(-math.atan(zv.x/zv.z))
        elseif zv.z>0 then
        user:set_look_horizontal(math.pi-math.atan(zv.x/zv.z))
        elseif zv.x<0 then
        user:set_look_horizontal(0)
        else
        user:set_look_horizontal(math.pi)
        end
        user:set_look_vertical(math.asin(zv.y))
        end
        minetest.after(0.2,function()
         local partdef={
			pos ={x=user:get_pos().x,y=user:get_pos().y+1,z=user:get_pos().z} , --minpos
			velocity ={x=0, y=0, z=0}, --maxvel
			acceleration={x=0.2,y=0,z=0.2}, --maxacc
			expirationtime =0.7, --minexptime
			size =9, --minsize
		collisiondetection =	false, --collisiondetection
     vertical = false,
     glow = 2,
			texture ="ee"..tostring(math.random(1, 3)) ..".png^[transform"..rotat[math.random(1,2)]
       --texture
       }
       minetest.add_particle(
       partdef
		)
        pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(n, n+3.4), snappy=5, choppy=6}},nil)
        minetest.chat_send_player(user:get_player_name(),"斩 blade!")
        minetest.sound_play({ possdd, name = "sword", gain = 10, max_hear_distance = 500 })
         minetest.after(0.75,function()
if  pointed_thing==nil   and players[uname]~=nil then

user:move_to(possdd2)
end
end)
        end
        )
        end
       else return
       end
       end
    end
          if mana.get(uname)>15 then
    if pointed_thing.type=="object" then
    mana.subtract(uname,15)
    local possdd3=pointed_thing.ref:get_pos()
    if  pointed_thing~=nil and players[uname]~=nil  then
    ssa(2,0,1,1)
    end
    if  pointed_thing~=nil and players[uname]~=nil  then
          ssa(2,0,1,0.3)
              minetest.after(0.3,function()
                        ssa(2,0,1,1)
              if  pointed_thing~=nil and players[uname]~=nil  then
               minetest.after(0.3,function()
             ssa(2,2,-1,1.4)
             if  pointed_thing~=nil and players[uname]~=nil  then
             minetest.after(0.3,function()
             ssa(2,0,-1,2)
            if  pointed_thing~=nil and players[uname]~=nil  then
             minetest.after(0.3,function()
             ssa(2,1,1,2)
             if  pointed_thing~=nil and players[uname]~=nil  then
             minetest.after(0.3,function()
             ssa(-2,0,1,2)
             if  pointed_thing~=nil and players[uname]~=nil  then
             minetest.after(0.2,function()
             ssa(-2,1,-1,1.1)
             if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.2,function()
             ssa(2,1.5,-1,4)
              if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
             ssa(2,1,3,1.3)
             if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
              ssa(3,0,1,1.6)
              if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
              ssa(3,0,1,1.3)
               if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
              ssa(1,1,1,1.3)
                if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
              ssa(2,2,1,1.7)
                if  pointed_thing~=nil and players[uname]~=nil  then
              minetest.after(0.25,function()
              ssa(3,0,1,3.3)
              playerin[uname]=false
              end)
              else playerin[uname]=false
              end
              end)
               else playerin[uname]=false
              end
              end)
              else playerin[uname]=false
              end
              end)
              else playerin[uname]=false
              end
              end)
              else playerin[uname]=false
            end
             end)
             else playerin[uname]=false
             end
             end)
             else  playerin[uname]=false
             end
             
             
             end)
             else  playerin[uname]=false
             end
             end)
             else playerin[uname]=false
             end
             end)
            else playerin[uname]=false
             end
             
             end)
             else playerin[uname]=false
             end
             end)
              else playerin[uname]=false
              end
              end)
              
              else playerin[uname]=false
          end
          if rflag[uname] then
          minetest.after(3.3,function()
          xd[uname]=true
          if players[uname]~=nil then
          user:move_to({x=possdd3.x,y=possdd3.y+2,z=possdd3.z},true)
          end
                    minetest.after(3.3,function()
                     xd[uname]=false
                     rflag[uname]=false
                    end)
          end)
          end
          if ready2[uname]==true then
          ready2[uname]=false
          end
          playereffects.apply_effect_type("blade",34.9,user)
          minetest.after(34.9,function()

          ready2[uname]=true
          uname=nil
        end
        )
        return itemstack
          end
          else minetest.chat_send_player(user:get_player_name(),"魔法不足 no enough mana...")
          end
          else minetest.chat_send_player(user:get_player_name(),"冷却 cooldown...")
end

    
  
	end,

--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_node("sa:chainthunder", {
	description = "line up",
	tiles = {"ct.png"},
	visual_scale = 1.0,
	inventory_image = "ct.png",
	wield_image = "ct.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname =user:get_player_name()
  local upos=user:get_pos()
  local ssdddir=user:get_look_dir()
    if ready3[uname] then

    lightning.strike({x=upos.x+ssdddir.x*6.5,y=upos.y,z=upos.z+ssdddir.z*6.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      minetest.after(0.9,function()
      lightning.strike({x=upos.x+ssdddir.x*9.5,y=upos.y,z=upos.z+ssdddir.z*9.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      minetest.after(0.9,function()
      lightning.strike({x=upos.x+ssdddir.x*12.5,y=upos.y,z=upos.z+ssdddir.z*12.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      minetest.after(0.9,function()
         lightning.strike({x=upos.x+ssdddir.x*15.5,y=upos.y,z=upos.z+ssdddir.z*15.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      minetest.after(0.9,function()
       lightning.strike({x=upos.x+ssdddir.x*19.5,y=upos.y,z=upos.z+ssdddir.z*19.5},user)
    minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      minetest.after(0.35,function()
      lightning.strike({x=upos.x+ssdddir.x*19.5,y=upos.y,z=upos.z+ssdddir.z*19.5+2},user)
      lightning.strike({x=upos.x+ssdddir.x*19.5,y=upos.y,z=upos.z+ssdddir.z*19.5-2},user)
      lightning.strike({x=upos.x+ssdddir.x*19.5-3,y=upos.y,z=upos.z+ssdddir.z*19.5},user)
      lightning.strike({x=upos.x+ssdddir.x*19.5+3,y=upos.y,z=upos.z+ssdddir.z*19.5},user)
      minetest.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = 500 })
      end)
      end)
      end)
      
      end)
      end)
                else minetest.chat_send_player(user:get_player_name(),"冷却 cooldown...")
      end
      if ready3[uname]==true then
       ready3[uname]=false
       end
       minetest.after(4.35,function()
       ready3[uname]=true
       uname=nil
       end)
    
	end,

--	TODO.
--	on_place = minetest.rotate_node
})
minetest.register_node("sa:fire", {

	description = "fire breath",
	tiles = {"fire.png"},
	visual_scale = 1.0,
	inventory_image = "fire.png",
	wield_image = "fire.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local playerpos=user:get_pos()
  local pname=user:get_player_name()
  local dir=user:get_look_dir()
  if ready4[pname] then
  local vec = {x=dir.x*17,y=dir.y*17,z=dir.z*17+3}
  local vec2 = {x=dir.x*17,y=dir.y*17,z=dir.z*17-3}
	local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fireball")
  local obj2 = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z-3}, "witchcraft:fireball")
  local obj3 = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z+3}, "witchcraft:fireball")
  local obj4 = minetest.env:add_entity({x=playerpos.x+dir.x*1.5-2,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fireball")
  local obj5 = minetest.env:add_entity({x=playerpos.x+dir.x*1.5+2,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "witchcraft:fireball")
	obj:setvelocity(vec)
  obj2:setvelocity(vec2)
  obj3:setvelocity(vec)
  obj4:setvelocity(vec2)
  obj5:setvelocity(vec)
  minetest.sound_play({ pos = pos, name = "fire", gain = 10, max_hear_distance = 500 })
  end
  if ready4[pname] then
  ready4[pname] =false
  end
   minetest.after(4.45,function()
  ready4[pname] =true
  end)
	end,

--	TODO.
--	on_place = minetest.rotate_node
})


function sa.nearest_player(pos, radius, not_name)
	not_name = not_name or 12 -- Just has to not be a string

	local near_objects = minetest.get_objects_inside_radius(pos, radius)

	local min_distance = radius + 1
	local min_player

	for i, obj in ipairs(near_objects) do
    local p_name = obj:get_player_name()
		if obj:is_player() and p_name ~= not_name then
			local p_pos = obj:getpos()
			local dist = vector.distance(pos, p_pos)

			if dist < min_distance then
				min_distance = dist
				min_player = obj
			end
		end
	end
	return min_player
  
end

function put_behind(player, target)
	local target_pos = target:getpos()
	local target_yaw = target:get_look_horizontal()

	local target_dir = { x=-math.sin(target_yaw), y=0, z=math.cos(target_yaw) }
	local back_vector = vector.multiply(target_dir, -1.1)

	player:setpos(vector.add(target_pos, back_vector))
	player:set_look_horizontal(target_yaw)
  return
  
end
minetest.register_node("sa:tel", {

	description = "shuuuuu",
	tiles = {"tel.png"},
	visual_scale = 1.0,
	inventory_image = "tel.png",
	wield_image = "tel.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local p_name=user:get_player_name()
  if ready5[p_name] then
  
  local pos = user:get_pos()

  local target = sa.nearest_player(pos, 56, p_name)

			if target then
				put_behind(user, target)
      end
  
  
  if ready5[p_name] then
  ready5[p_name] =false
  end
   minetest.after(2.35,function()
  ready5[p_name] =true
  end)
	end
  end,

--	TODO.
--	on_place = minetest.rotate_node
})
minetest.register_on_player_hpchange(
function(player, hp_change)

 local namess=player:get_player_name()
  if playerhui[namess] and hp_change<0 then
  hp_change=-hp_change

  end
  if playerfu[namess] then
  if playerhui[namess] and hp_change>0  then
  hp_change=0
  elseif  hp_change>0 and not playerhui[namess]  then
  hp_change=-hp_change
  elseif playerin[namess] or xd[namess] and hp_change>0 then
  hp_change=0
  end
  end
 if (playerin[namess]==true or xd[namess]==true) and hp_change<0 then
 hp_change=0
 end

 return hp_change
end
, true)


minetest.register_tool("sa:qishang", {
	description = "if mean to hurt,first hurt self七伤拳 欲伤人 先伤己(不可用于自杀,即使自己死亡,击杀者仍为对方)",
	tiles = {"qi.png"},
	visual_scale = 1.0,
	inventory_image = "qi.png",
	wield_image = "qi.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local pname=user:get_player_name()
               itemstack:set_wear(0)
 
  if ready6[pname] then
   if pointed_thing.type=="object" then
   user:punch(pointed_thing.ref,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(2, 5.6), snappy=3, choppy=2}},nil)
   pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(6, 24.4), snappy=3, choppy=2}},nil)
        ready6[pname]=false
   end
             else minetest.chat_send_player(user:get_player_name(),"冷却 cooldown...")
   end
   minetest.after(4,function()
   ready6[pname]=true
   end)
   
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

--	TODO.
--	on_place = minetest.rotate_node
})



minetest.register_tool("sa:yue", {
	description = "月读tsukuyomi",
	tiles = {"yue.png"},
	visual_scale = 1.0,
	inventory_image = "yue.png",
	wield_image = "yue.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local pname=user:get_player_name()
               itemstack:set_wear(0)
 
  if ready7[pname] then
  if mana.get(pname)>20 then
   if pointed_thing.type=="object" then
   mana.subtract(pname,20)
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
   
    local poss=pointed_thing.ref:get_pos()
    minetest.add_particlespawner(
			800, --amount
			1, --time
			{x=poss.x-6, y=poss.y-3, z=poss.z-6}, --minpos
			{x=poss.x+6, y=poss.y+3, z=poss.z+6}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.1,y=0,z=-0.1}, --minacc
			{x=0.1,y=0,z=0.1}, --maxacc
			6, --minexptime
			9, --maxexptime
			10, --minsize
			20, --maxsize
			false, --collisiondetection
			"witchcraft_pot_bottom.png^[colorize:black:200"--texture
		)
    if pointed_thing.ref:is_player() then
    local name = pointed_thing.ref:get_player_name()
    playereffects.apply_effect_type("yue",3.85,pointed_thing.ref)
    minetest.chat_send_player(name,"你正处于月读幻术当中，但这种痛苦却是真实的..... in tsukuyomi...")
    minetest.chat_send_all(name.."正处于月读幻术当中，但其体会到的痛苦却是真实的..... the jutsu is illusion,but the pain is real......")
    name=nil
   else minetest.chat_send_all(user:get_player_name().."施放了月读 :tsukuyomi..")
   end
    minetest.after(0.5,function()
    
    if pointed_thing~=nil then
    pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(4, 14.4), snappy=7, choppy=5}},nil)
        pointed_thing.ref:set_pos(poss)
        minetest.after(0.7,function()
         if pointed_thing~=nil then
         pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(7, 9.4), snappy=6, choppy=4}},nil)
                pointed_thing.ref:set_pos(poss)
          minetest.after(0.7,function()
                   if pointed_thing~=nil then
                     pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(6, 10.4), snappy=7, choppy=5}},nil)
                pointed_thing.ref:set_pos(poss)
                   minetest.after(0.65,function()
                     if pointed_thing~=nil then
                       pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(6, 8.4), snappy=4, choppy=4}},nil)
                pointed_thing.ref:set_pos(poss)
         minetest.after(0.65,function()
          if pointed_thing~=nil then
          pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(7, 9.4), snappy=4, choppy=4}},nil)
                pointed_thing.ref:set_pos(poss)
           minetest.after(0.65,function()
             if pointed_thing~=nil then
             
             pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(2, 4.4), snappy=3, choppy=2}},nil)
                pointed_thing.ref:set_pos(poss)
             end
           end)
          end
         end)
                     end
                   end)
                   end
          end)
         end
        end)
    
    end
end)
    
    ready7[pname]=false
    minetest.after(17,function()
   ready7[pname]=true
   pname=nil
   end)
   end
   else minetest.chat_send_player(user:get_player_name(),"魔法不足 no enough mana....")
   end
   else minetest.chat_send_player(user:get_player_name(),"冷却中....cooldown....")
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

--	TODO.
--	on_place = minetest.rotate_node
})


minetest.register_tool("sa:hui", {
	description = "回光反照(对己伤害转为治疗)turn any damage recieved into heal\n \"敌之尖刃 我之伤药 死地后生 回光反照\"",
	tiles = {"hui.png"},
	visual_scale = 1.0,
	inventory_image = "hui.png",
	wield_image = "hui.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
               itemstack:set_wear(0)
 
  if ready8[uname] then
  user:set_armor_groups({fleshy=100, cracky=100,snappy=100,choppy=100})
  playereffects.apply_effect_type("hui",12,user)
  playereffects.apply_effect_type("huil",39,user)
    jiaflag[uname]=true
    minetest.chat_send_all(uname..":borrowed time!!开启回光反照!!")
   playerhui[uname]=true
   ready8[uname]=false
   
    minetest.after(12,function()
    playerhui[uname]=false
      jiaflag[uname]=false
   end)
      minetest.after(39,function()
   ready8[uname]=true
   uname=nil
   end)


   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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

--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_tool("sa:ren", {
	description = "刃甲Blademail",
	tiles = {"ren.png"},
	visual_scale = 1.0,
	inventory_image = "ren.png",
	wield_image = "ren.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  if ready9[uname] then
     ready9[uname]=false
  playereffects.apply_effect_type("blademail",7,user)
  playereffects.apply_effect_type("bl",19,user)
    minetest.chat_send_all(uname.."开启刃甲!! activated blademail!!")
   playerren[uname]=true
             itemstack:set_wear(0)
 
    minetest.after(7,function()
    playerren[uname]=false
   end)
   minetest.after(19,function()
   ready9[uname]=true
   uname=nil
   end)


   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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
--	TODO.
--	on_place = minetest.rotate_node
})






minetest.register_on_punchplayer(
function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
    local namess=player:get_player_name()
    local playereffects=playereffects
    local namehitter=hitter:get_player_name()
    if playerbz[namehitter]=='true' then
     player:set_hp(player:get_hp()-7)
    
    end
    if player == heroinmo[1] and cause[hitter:get_player_name()]~=2 then
    if heroinmo[2] then
        cause[hitter:get_player_name()]=1
    heroinmo[2]:punch(hitter, 0.9, {damage_groups = {fleshy=damage*(100/(player:get_armor_groups().fleshy)), snappy=damage, choppy=damage}}, nil)

    end
    end
     if player == heroinmo[2] and cause[hitter:get_player_name()]~=1 then
          cause[hitter:get_player_name()]=2
     heroinmo[1]:punch(hitter, 0.9, {damage_groups = {fleshy=damage*(100/(player:get_armor_groups().fleshy)), snappy=damage, choppy=damage}}, nil)

     
     end
    
    
    local jilv1=math.random(1.0,1571.0)
    local jilv2=math.random(1.0,1571.0)
    if jilv1 <=3.6 and jilv1 >2.3 then
   -- if player ~= hitter then
   if hitbacks.z[namess].jia~="true" then
    hitbacks.z[namess].jia="true"
    minetest.sound_play({ pos = player:get_pos(), name = "jia", gain = 10, max_hear_distance = 500 })
    minetest.chat_send_all(namess.."领悟了被动护甲提升! comprehended passive:armor increase!!")
    team.save_to_file()
    end
   -- end
    elseif jilv1<=2.3 then
    if hitter:is_player() then
       -- if player ~= hitter then
    local hname = hitter:get_player_name()
     if hitbacks.z[hname].jia~="true" then
     hitbacks.z[hname].jia="true"
     minetest.sound_play({ pos = hitter:get_pos(), name = "jia", gain = 10, max_hear_distance = 500 })
     minetest.chat_send_all(hname.."领悟了被动护甲提升! comprehended passive:armor increase!!")
    team.save_to_file()
    end
   -- end
    end
    end
     if jilv2 <=3.6 and jilv2 >2.3 then
       --  if player ~= hitter then
       if hitbacks.z[namess].z~="true" then 
    hitbacks.z[namess].z="true"
    minetest.sound_play({ pos = player:get_pos(), name = "jia", gain = 10, max_hear_distance = 500 })
    minetest.chat_send_all(namess.."领悟了被动反击(吸血效果)! comprehended passive:hitback(with life drain)!!")
     team.save_to_file()
     end
    -- end
     elseif jilv2<=2.3 then
    if hitter:is_player() then
     --   if player ~= hitter then
    local hname = hitter:get_player_name()
    if hitbacks.z[hname].z~="true" then 
     hitbacks.z[hname].z="true"
     minetest.sound_play({ pos = hitter:get_pos(), name = "jia", gain = 10, max_hear_distance = 500 })
     minetest.chat_send_all(hname.."领悟了被动反击(吸血效果)! comprehended passive:hitback(with life drain)!!")
    team.save_to_file()
    end
    --end
    end
    end
    if hitter:is_player() then
     if playereffects.has_effect_type(namess,"blademail") then
     minetest.chat_send_player(hitter:get_player_name(),"你正在攻击处于刃甲开启状态的玩家! you are hitting a player with blademail activated!")
     end
     blink[namess]=false
     minetest.after(5,function()
     blink[namess]=true
     end)
     end
  if playerren[namess] then
  hitter:punch(player, 0.9, {damage_groups = {fleshy=damage*(100/(player:get_armor_groups().fleshy)), snappy=damage, choppy=damage}}, nil)
  --or  hitter:set_hp(hitter:get_hp()-damage)

end
--
jilv1=nil
jilv2=nil
     minetest.after(20,function()
     namess=nil
     end)
playereffects=nil
end
)

minetest.register_on_leaveplayer(function(player)
players[player:get_player_name()]= nil
end)


minetest.register_tool("sa:chibaku", {
	description = "chibakutensei 地爆天星",
	tiles = {"chi.png"},
	visual_scale = 1.0,
	inventory_image = "chi.png",
	wield_image = "chi.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 
  if ready10[uname] then

    if mana.get(uname)>= 17 then
    

    if user:get_player_control().RMB then
  if pointed_thing.type=="object" then
  
    if chibaku[uname] then
    chibaku2[uname]=true
    chibaku[uname]=false
    mana.subtract(uname,17)
    local number =1
    local pos2 = pointed_thing.ref:get_pos()
    user:set_pos({x=pos2.x-10,y=pos2.y+3,z=pos2.z})
    minetest.sound_play({ pos = pos2, name = "chibaku_fall", gain = 5, max_hear_distance = 500 })
    minetest.chat_send_all("地爆天星地形将在14秒后复原")
    ready10[uname]=false
    minetest.after(30,function()
   ready10[uname]=true
   end)
   local ss2={}
    for n=-5,5 do
   for m=-5,5 do
    for nm=-1,9 do
  ss2[tostring(number)]=minetest.get_node({x=pos2.x+m,y=pos2.y+nm,z=pos2.z+n})
   minetest.set_node({x=pos2.x+m,y=pos2.y+nm,z=pos2.z+n},{name=chibaku_node[tostring(number)].name})

    number=number+1

   chibaku[uname]=false
   end
   end
   end
   number=1
    local number2=1
   for n=-5,5 do
   for m=-5,5 do
    for nm=-6,4 do
      minetest.set_node({x=poss.x+m,y=poss.y+nm+31,z=poss.z+n},{name="air"})

   number=number+1

      end
   end
   end
   minetest.after(13.8,function()
          for n=-5,5 do
   for m=-5,5 do
    for nm=-1,9 do
  minetest.set_node({x=posst.x+m,y=posst.y+nm-9,z=posst.z+n},{name=chibaku_node[tostring(number2)].name})
   minetest.set_node({x=pos2.x+m,y=pos2.y+nm,z=pos2.z+n},{name=ss2[tostring(number2)].name})
   number2=number2+1
    end
   end
   end
   end)
   pointed_thing.ref:punch(user, 0.9, {damage_groups = {fleshy=67, snappy=57, choppy=67}}, nil)
   number=nil
   pos=nil
    end
    return
    else    
    return
    end
    else   

    poss = user:get_pos()
    end
    if chibaku2[uname] then
    posst=poss
    mana.subtract(uname,17)
              if manaflag[uname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(uname,"魔法上限增加! max mana increased!!")
          if mana.getmax(uname)>=150 then
            mana.setmax(uname,mana.getmax(uname)+5)
            minetest.after(3600,function()
            mana.setmax(uname,mana.getmax(uname)-5)
            
            end)
            
            elseif mana.getmax(uname)<150 then
             mana.setmax(uname,mana.getmax(uname)+5)
             manamaxx[uname]=mana.getmax(uname)
          end
          
          end
              team.save_to_file()
          end
    minetest.sound_play({ pos = user:get_pos(), name = "chibaku", gain = 13, max_hear_distance = 500 })
    minetest.chat_send_all(uname..": 地爆天星 chibakutensei!!")
   chibaku[uname]=true

    user:set_pos({x=poss.x-9,y=poss.y+3,z=poss.z+4})
    local number=1
   for n=-5,5 do
   for m=-5,5 do
    for nm=-10,0 do
    ss3=minetest.get_node({x=poss.x+m,y=poss.y+nm,z=poss.z+n})
    chibaku_node[tostring(number)]=ss3
    number=number+1
   minetest.set_node({x=poss.x+m,y=poss.y+nm,z=poss.z+n},{name="air"})
  minetest.set_node({x=poss.x+m,y=poss.y+nm+35,z=poss.z+n},{name=ss3.name})
   end
   end
   end
    playereffects.apply_effect_type("chiba2",33.8,user)
      minetest.after(33.8,function()
      local number2=1
          for n=-5,5 do
   for m=-5,5 do
    for nm=-6,4 do
  minetest.set_node({x=posst.x+m,y=posst.y+nm-4,z=posst.z+n},{name=chibaku_node[tostring(number2)].name})
   minetest.set_node({x=posst.x+m,y=posst.y+nm+31,z=posst.z+n},{name="air"})
   number2=number2+1
    end
   end
   end
   number=nil
   number2=nil
    chibaku2[uname]=true    
   --chibaku[uname]=true
   end)
    playereffects.apply_effect_type("chiba",6,user)
   ready10[uname]=false
    minetest.after(6,function()
   ready10[uname]=true
   end)
   chibaku2[uname]=false
   else minetest.chat_send_player(user:get_player_name(),"请先对敌释放地爆天星....")
   end
    else minetest.chat_send_player(user:get_player_name(),"魔法不足 mana not enough....")
    end

   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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

--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_tool("sa:fu", {
	description = "- polar 负极(只减不增)",
	tiles = {"fu.png"},
	visual_scale = 1.0,
	inventory_image = "fu.png",
	wield_image = "fu.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 
  if ready11[uname] then

  if pointed_thing.type=="object" then
  if pointed_thing.ref:is_player() then
  local pname=pointed_thing.ref:get_player_name()

  if  (team.playerlist[uname].team~=team.playerlist[pname].team) and team.playerlist[uname].team~="none" then
     ready11[uname]=false
  playereffects.apply_effect_type("fu",7,pointed_thing.ref)
   playerfu[uname]=true

    minetest.after(7,function()
    playerfu[uname]=false
   end)
   minetest.after(19,function()
   ready11[uname]=true
   end)

else minetest.chat_send_player(user:get_player_name(),"请不要对友军施加debuff好吗.... please dont do debuff to ally")
   end
   
   else
    ready11[uname]=false
    playereffects.apply_effect_type("fu",7,pointed_thing.ref)
   playerfu[uname]=true

    minetest.after(7,function()
    playerfu[uname]=false
   end)
   minetest.after(19,function()
   ready11[uname]=true
   uname=nil
   end)

      end
    end
    else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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
--	TODO.
--	on_place = minetest.rotate_node
})



minetest.register_tool("sa:shen", {
	description = "神罗天征",
	tiles = {"shen.png"},
	visual_scale = 1.0,
	inventory_image = "shen.png",
	wield_image = "shen.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  local pos=user:get_pos()
            itemstack:set_wear(0)
 
    print(pos.x)
  pos={x=math.floor(pos.x),y=math.floor(pos.y),z=math.floor(pos.z)}
  if ready12[uname] then
      if mana.get(uname)>= 30 then
       mana.subtract(uname,30)
     ready12[uname]=false
               if manaflag[uname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(uname,"魔法上限增加! max mana increased!!")
          if mana.getmax(uname)>=150 then
            mana.setmax(uname,mana.getmax(uname)+5)
            minetest.after(3600,function()
            mana.setmax(uname,mana.getmax(uname)-5)
            
            end)
            
            elseif mana.getmax(uname)<150 then
             mana.setmax(uname,mana.getmax(uname)+5)
             manamaxx[uname]=mana.getmax(uname)
          end
          
          end
              team.save_to_file()
          end
      minetest.chat_send_all(uname..":神罗天征!!!")
     minetest.sound_play({ pos = pos, name = "shen", gain = 22, max_hear_distance = 500 })
		local targets = minetest.get_objects_inside_radius(pos, 50)
			for i, target in ipairs(targets) do
				if target ~= user  and target ~=nil then
        local pos2= target:get_pos()
					local zz=vector.direction(pos,pos2)

         if isNaN(zz.x) or isNaN(zz.y)  or isNaN(zz.z)    then
         pos2={x=math.floor(pos2.x),y=math.floor(pos2.y),z=math.floor(pos2.z)}
          zz=vector.direction(pos,pos2)
          print(pos.x..zz.x.." "..zz.y)
          end
          target:move_to({x=pos2.x+zz.x*9.9,y=pos2.y+zz.y,z=pos2.z+zz.z*8.9},true)
              target:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=65, snappy=63, choppy=67}},nil)
        zz=nil
				end
			end

     
   minetest.after(49,function()
   ready12[uname]=true
   uname=nil
   end)

else minetest.chat_send_player(user:get_player_name(),"魔法不足 no mana....")
end
   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
    end
    
    pos=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})



minetest.register_tool("sa:dasheti", {
	description = "大蛇薙 Orochi-killing flame",
	tiles = {"da.png"},
	visual_scale = 1.0,
	inventory_image = "da.png",
	wield_image = "da.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()

  if ready13[uname] then
      if mana.get(uname)>= 20 then
       mana.subtract(uname,20)
     ready13[uname]=false
               if manaflag[uname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(uname,"魔法上限增加! max mana increased!!")
          if mana.getmax(uname)>=150 then
            mana.setmax(uname,mana.getmax(uname)+5)
            minetest.after(3600,function()
            mana.setmax(uname,mana.getmax(uname)-5)
            
            end)
            manamaxx[uname]=150
            elseif mana.getmax(uname)<150 then
             mana.setmax(uname,mana.getmax(uname)+5)
            manamaxx[uname]=mana.getmax(uname)
          end
          
          end
          mzeng=nil
          team.save_to_file()
          end
       local possz=user:get_pos()
                itemstack:set_wear(0)
 
     local zv= user:get_look_dir()
     user:move_to({x=possz.x+zv.x*2.1,y=possz.y,z=possz.z+zv.z*2.1},true)
     local v ={x=0,y=0,z=0}
     print(zv.x.."  "..zv.z.."oooooooo")
   minetest.sound_play({ pos = user:get_pos(), name = "da", gain = 20, max_hear_distance = 500 })
    --[[      local obj= minetest.env:add_entity({x=possz.x+zv.x*3.8,y=possz.y+1.5,z=possz.z+zv.z*3.8}, "witchcraft:fireball")
    local obj2= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y+1.5,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj3= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.9,z=possz.z+zv.z*5}, "witchcraft:fireball")
       local obj4= minetest.env:add_entity({x=possz.x+zv.x*3,y=possz.y,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj5= minetest.env:add_entity({x=possz.x+zv.x*3,y=possz.y,z=possz.z+zv.z*3}, "witchcraft:fireball")
   local obj6= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj7= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj8= minetest.env:add_entity({x=possz.x+zv.x*5-1,y=possz.y,z=possz.z+zv.z*5-2}, "witchcraft:fireball")
   local obj9= minetest.env:add_entity({x=possz.x+zv.x*5+1,y=possz.y,z=possz.z+zv.z*5+2}, "witchcraft:fireball")
   local obj10= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.6,z=possz.z+zv.z*5-1}, "witchcraft:fireball")
   local obj11= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.4,z=possz.z+zv.z*5+1}, "witchcraft:fireball")
   local obj12= minetest.env:add_entity({x=possz.x+zv.x*2,y=possz.y+1.7,z=possz.z+zv.z*2}, "witchcraft:fireball")
   local obj13= minetest.env:add_entity({x=possz.x+zv.x,y=possz.y+1.5,z=possz.z+zv.z}, "witchcraft:fireball")
     local obj14= minetest.env:add_entity({x=possz.x+zv.x*3-1,y=possz.y+1,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj15= minetest.env:add_entity({x=possz.x+zv.x*3+1,y=possz.y+1,z=possz.z+zv.z*3}, "witchcraft:fireball")
      local obj16= minetest.env:add_entity({x=possz.x+zv.x*4-2,y=possz.y-1,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj17= minetest.env:add_entity({x=possz.x+zv.x*4+2,y=possz.y-1,z=possz.z+zv.z*3}, "witchcraft:fireball")
      local obj18= minetest.env:add_entity({x=possz.x+zv.x*5-3,y=possz.y+2.7,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj19= minetest.env:add_entity({x=possz.x+zv.x*5+3,y=possz.y+2.3,z=possz.z+zv.z*3}, "witchcraft:fireball")
  if obj then
   obj:setvelocity(v)
   end
   if obj2 then
    obj2:setvelocity(v)
    end
    if obj3 then
    obj3:setvelocity(v)
    end
       if obj4 then
   obj4:setvelocity(v)
   end
   if obj5 then
    obj5:setvelocity(v)
    end
    if obj6 then
    obj6:setvelocity(v)
    end
       if obj7 then
   obj7:setvelocity(v)
   end
   if obj8 then
    obj8:setvelocity(v)
    end
    if obj9 then
    obj9:setvelocity(v)
    end
       if obj10 then
   obj10:setvelocity(v)
   end
   if obj11 then
    obj11:setvelocity(v)
    end
       if obj12 then
   obj12:setvelocity(v)
   end
   if obj13 then
    obj13:setvelocity(v)
    end
       if obj14 then
    obj14:setvelocity(v)
    end
       if obj15 then
    obj15:setvelocity(v)
    end
       if obj16 then
    obj16:setvelocity(v)
    end
       if obj17 then
    obj17:setvelocity(v)
    end
       if obj18 then
    obj18:setvelocity(v)
    end
       if obj19 then
    obj19:setvelocity(v)
    end]]
        for nm=0,2 do
    for n=-6,6,1 do 
    for m=-6,6,1 do
    local zd=vector.distance(possz,{x=possz.x+n,y=possz.y,z=possz.z+m})

    if zd<=4.9 and zd >= 2.0 then
    if zv.x<0 then
    if possz.x+n <=possz.x+math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.z)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
    if zv.z<0 then
    if possz.z+m <=possz.z+math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.x)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
   obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
     if zv.z>0 then
    if possz.z+m >=possz.z-math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.x)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
      obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
    
         if zv.z==0 then
    if possz.x+n <=possz.x then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
      obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
    
    
    end
    end
    
     if zv.x>0 then
    if possz.x+n >=possz.x-math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.z)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
        if zv.z<0 then
    if possz.z+m <=possz.z+math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.x)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
  local  obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
     obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
     if zv.z>0 then
    if possz.z+m >=possz.z-math.sqrt(math.pow(zd,2)*math.pow(math.abs(zv.x)/(math.abs(zv.z)+math.abs(zv.x)),2)) then
  local  obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
     obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
           if zv.z==0 then
    if possz.x+n >=possz.x then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
      obj:set_hp(1000)
        zflame(obj,user,v)
    end
    end
    
    end
    end
    
           if zv.x==0 then
           if zv.z>0 then
    if possz.z+m >=possz.z then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
      obj:set_hp(1000)
        zflame(obj,user,v)
        end
        end
                   if zv.z<0 then
    if possz.z+m <=possz.z then
   local obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
      obj:set_hp(1000)
        zflame(obj,user,v)
        end
        end

    end
    
    
    end

    -- obj= minetest.env:add_entity({x=possz.x+n,y=possz.y+math.random(0,1.1),z=possz.z+m}, "witchcraft:fireball")
    end
    end
    end
     playereffects.apply_effect_type("flame",18,user)
 minetest.after(18,function()
   ready13[uname]=true
   uname=nil
   end)

else minetest.chat_send_player(user:get_player_name(),"魔法不足 no mana....")
end
   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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
--	TODO.
--	on_place = minetest.rotate_node
})





--[[minetest.register_tool("sa:run", {
	description = "相位fastmove",
	tiles = {"run.png"},
	visual_scale = 1.0,
	inventory_image = "run.png",
	wield_image = "run.png",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  if readyrun then
     readyrun=false
  playereffects.apply_effect_type("run",10,user)
  playereffects.apply_effect_type("runcd",16,user)
    minetest.chat_send_all(uname.."开启相位!! activated fastmove!!")



   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
    end

	end,
--	TODO.
--	on_place = minetest.rotate_node
})

]]




local timer=0
--[[
minetest.register_globalstep(function(dtime)
  timer=timer+dtime
recovertimer=recovertimer+dtime
local players
  if timer>= 0.7  then
    for _,player in ipairs(minetest.get_connected_players()) do
      if finishcan[player:get_player_name()] then
      local ctrl = player:get_player_control()
      local key_press = false
      key_press = ctrl.aux1
      if key_press then
      zs(player)
      drain(player)
      else player:set_physics_override({speed = 1 ,jump = 1})
      end
      if  candrain[player:get_player_name()] <16 then
      recover(player)

      end
      end
      end
      timer=0
      end
      

end)
]]













minetest.register_entity("sa:windball", {
	textures = {"windball.png"},
	velocity = {x=1,y=0,z=1},
	damage = 5,
	collisionbox = {1, 1, 1, 1, 1, 1},
	on_step =  function(self, dtime, ...)		
		local remove = minetest.after(4, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
    --[[  minetest.after(timer,function()
  for i,obj in ipairs(objs) do
    local opos=obj:get_pos()
    if opos then
    obj:set_pos({x=opos.x+math.random(-4.5,4.5),y=opos.y+math.random(-2.5,7.5),z=opos.z+math.random(-3.5,4.5)})
    end
    end
    
    
    end
    )
]]
		local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			1, --amount
			0.02, --time
			{x=apos.x, y=apos.y, z=apos.z}, --minpos
			{x=apos.x, y=apos.y, z=apos.z}, --maxpos
			{x=-0, y=0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			7, --minexptime
			8, --maxexptime
			20, --minsize
			20, --maxsize
			true, --collisiondetection
			"winds.png" --texture
		)
	end,
})





minetest.register_tool("sa:wind", {
	description = "a wind ball",
	tiles = {"windball.png"},
	visual_scale = 1.0,
	inventory_image = "windball.png",
	wield_image = "windball.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()

  if ready14[uname] then
      if mana.get(uname)>= 47 then
       mana.subtract(uname,47)
     ready14[uname]=false
               if manaflag[uname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(uname,"魔法上限增加! max mana increased!!")
          if mana.getmax(uname)>=150 then
            mana.setmax(uname,mana.getmax(uname)+5)
            minetest.after(3600,function()
            mana.setmax(uname,mana.getmax(uname)-5)
            
            end)
            
            elseif mana.getmax(uname)<150 then
             mana.setmax(uname,mana.getmax(uname)+5)
             manamaxx[uname]=mana.getmax(uname)
          end
          
          end
          mzeng=nil
              team.save_to_file()
          end
       local possz=user:get_pos()

     local zv= user:get_look_dir()
     
     local v ={x=zv.x*5.7,y=zv.y*4.0,z=zv.z*5.7}
          itemstack:set_wear(0)
 
   minetest.sound_play({ pos = user:get_pos(), name = "winds", gain = 20, max_hear_distance = 500 })
    --[[      local obj= minetest.env:add_entity({x=possz.x+zv.x*3.8,y=possz.y+1.5,z=possz.z+zv.z*3.8}, "witchcraft:fireball")
    local obj2= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y+1.5,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj3= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.9,z=possz.z+zv.z*5}, "witchcraft:fireball")
       local obj4= minetest.env:add_entity({x=possz.x+zv.x*3,y=possz.y,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj5= minetest.env:add_entity({x=possz.x+zv.x*3,y=possz.y,z=possz.z+zv.z*3}, "witchcraft:fireball")
   local obj6= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj7= minetest.env:add_entity({x=possz.x+zv.x*4,y=possz.y,z=possz.z+zv.z*4}, "witchcraft:fireball")
   local obj8= minetest.env:add_entity({x=possz.x+zv.x*5-1,y=possz.y,z=possz.z+zv.z*5-2}, "witchcraft:fireball")
   local obj9= minetest.env:add_entity({x=possz.x+zv.x*5+1,y=possz.y,z=possz.z+zv.z*5+2}, "witchcraft:fireball")
   local obj10= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.6,z=possz.z+zv.z*5-1}, "witchcraft:fireball")
   local obj11= minetest.env:add_entity({x=possz.x+zv.x*5,y=possz.y+1.4,z=possz.z+zv.z*5+1}, "witchcraft:fireball")
   local obj12= minetest.env:add_entity({x=possz.x+zv.x*2,y=possz.y+1.7,z=possz.z+zv.z*2}, "witchcraft:fireball")
   local obj13= minetest.env:add_entity({x=possz.x+zv.x,y=possz.y+1.5,z=possz.z+zv.z}, "witchcraft:fireball")
     local obj14= minetest.env:add_entity({x=possz.x+zv.x*3-1,y=possz.y+1,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj15= minetest.env:add_entity({x=possz.x+zv.x*3+1,y=possz.y+1,z=possz.z+zv.z*3}, "witchcraft:fireball")
      local obj16= minetest.env:add_entity({x=possz.x+zv.x*4-2,y=possz.y-1,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj17= minetest.env:add_entity({x=possz.x+zv.x*4+2,y=possz.y-1,z=possz.z+zv.z*3}, "witchcraft:fireball")
      local obj18= minetest.env:add_entity({x=possz.x+zv.x*5-3,y=possz.y+2.7,z=possz.z+zv.z*3}, "witchcraft:fireball")
    local obj19= minetest.env:add_entity({x=possz.x+zv.x*5+3,y=possz.y+2.3,z=possz.z+zv.z*3}, "witchcraft:fireball")
  if obj then
   obj:setvelocity(v)
   end
   if obj2 then
    obj2:setvelocity(v)
    end
    if obj3 then
    obj3:setvelocity(v)
    end
       if obj4 then
   obj4:setvelocity(v)
   end
   if obj5 then
    obj5:setvelocity(v)
    end
    if obj6 then
    obj6:setvelocity(v)
    end
       if obj7 then
   obj7:setvelocity(v)
   end
   if obj8 then
    obj8:setvelocity(v)
    end
    if obj9 then
    obj9:setvelocity(v)
    end
       if obj10 then
   obj10:setvelocity(v)
   end
   if obj11 then
    obj11:setvelocity(v)
    end
       if obj12 then
   obj12:setvelocity(v)
   end
   if obj13 then
    obj13:setvelocity(v)
    end
       if obj14 then
    obj14:setvelocity(v)
    end
       if obj15 then
    obj15:setvelocity(v)
    end
       if obj16 then
    obj16:setvelocity(v)
    end
       if obj17 then
    obj17:setvelocity(v)
    end
       if obj18 then
    obj18:setvelocity(v)
    end
       if obj19 then
    obj19:setvelocity(v)
    end]]
    

    local obj= minetest.env:add_entity({x=possz.x,y=possz.y,z=possz.z}, "sa:windball")
    obj:setvelocity(v)
    minetest.after(0.2,function()
    local pos = obj:getpos()
    if pos then
    local objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
    obbb(objz,user,obj)
   end
   minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.2,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   end
     minetest.after(0.1,function()
    pos = obj:getpos()
   if pos then
    objz = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.1)	
   obbb(objz,user,obj)
   objz=nil
   end
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
       minetest.after(1.9,function()
    obj:setvelocity({x=0,y=0,z=0})
     end
    )
    playereffects.apply_effect_type("windb",55,user)
 minetest.after(55,function()
   ready14[uname]=true
   end)

else minetest.chat_send_player(user:get_player_name(),"魔法不足 no mana....")
end
   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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
--	TODO.
--	on_place = minetest.rotate_node
})
















minetest.register_globalstep(function(dtime)
  timer=timer+dtime
recovertimer=recovertimer+dtime
local players
  if timer>= 1.1  then
   timer=0
   
    for _,player in ipairs(minetest.get_connected_players()) do
     local pname=player:get_player_name()
     
     if playerbz[pname]=='true' then
       if player:get_hp()-2>1 then
     player:set_hp(player:get_hp()-2)
     else player:set_hp(1)
     end
     
     
     end
     
     
     
     if huiyao[pname] then
     local pos= player:get_pos()
    local objz= minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 6.4)	
    for i,obj in ipairs(objz) do
    if obj~=player then
        if obj:is_player() then
        if team.playerlist[obj:get_player_name()].team==team.playerlist[pname] and team.playerlist[pname]~="none" then
        
        else
        obj:punch(player,0.5,{full_punch_interval = 0.8,
        damage_groups = {fleshy=2.3, snappy=2.1, choppy=2.1}},nil)
        end
        else
    obj:punch(player,0.5,{full_punch_interval = 0.8,
        damage_groups = {fleshy=3.8, snappy=3, choppy=3}},nil)
    end
    end
     end
      end
      end
      end

end)




minetest.register_tool("sa:huiyao", {
	description = "辉耀 radiance 开启后每1.1秒对周围单位造成3.8伤害 对玩家造成较少伤害",
	tiles = {"rra.png"},
	visual_scale = 1.0,
	inventory_image = "rra.png",
	wield_image = "rra.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 
  if huiyao[uname] then
  minetest.chat_send_all(uname.."关闭辉耀 toggled radiance off")
   huiyao[uname]=false
   elseif not huiyao[uname] then
   huiyao[uname]=true
     minetest.chat_send_all(uname.."开启辉耀 toggled radiance on")
   end
return itemstack
	end,
--	TODO.
--	on_place = minetest.rotate_node
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



minetest.register_tool("sa:bz", {
	description = "臂章，开启后每1.1秒损失2生命值 但每次攻击额外造成7纯粹伤害\n when activated ,lose 2 hp every 1.1seconds to get +7 true damage per attack",
	tiles = {"bz.png"},
	visual_scale = 1.0,
	inventory_image = "bz.png",
	wield_image = "bz.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 
  if playerbz[uname]=='true' then
  minetest.chat_send_all(uname.."关闭臂章 toggled armlet off")
   playerbz[uname]=false
   elseif not playerbz[uname] then
   playerbz[uname]='true'
     minetest.chat_send_all(uname.."开启臂章 toggled armlet on")
   end
return itemstack
	end,
--	TODO.
--	on_place = minetest.rotate_node
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










minetest.register_on_dieplayer(function(player,reason)
  local name =player:get_player_name()
  huiyao[name]=false
  playerbz[name]=false
 


end)











minetest.register_tool("sa:mt", {
	description = "魔法停滞 mana nogen",
	tiles = {"mt.png"},
	visual_scale = 1.0,
	inventory_image = "mt.png",
	wield_image = "mt.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 if ready15[uname] then
 
if pointed_thing.type=="object" then
if pointed_thing.ref:is_player() then
if team.playerlist[pointed_thing.ref:get_player_name()].team==team.playerlist[uname] and team.playerlist[uname]~="none" then
else
ready15[uname]=false
playereffects.apply_effect_type("manad",10,pointed_thing.ref)
playereffects.apply_effect_type("manadcd",26,user)
minetest.after(17,function()

ready15[uname]=true
uname=nil

end)
end
end
end
else minetest.chat_send_player(uname,"冷却中 cd")
uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})




minetest.register_tool("sa:shinsharingan", {
	description = "真写轮眼 shinsharingan",
	tiles = {"sarin.png"},
	visual_scale = 1.0,
	inventory_image = "sarin.png",
	wield_image = "sarin.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 if ready16[uname] then
if mana.get(uname)>40 then
    if pointed_thing.type=="object" then
    if pointed_thing.ref:is_player() then
          mana.subtract(uname,40) 
          sarinin[uname]=true
          ready16[uname]=false
          if manaflag[uname] then
          local mzeng=math.random(1.0,100.0)
          if mzeng <= 4.1 then
          minetest.chat_send_player(uname,"魔法上限增加! max mana increased!!")
          if mana.getmax(uname)>=150 then
            mana.setmax(uname,mana.getmax(uname)+5)
            minetest.after(3600,function()
            mana.setmax(uname,mana.getmax(uname)-5)
            
            end)
            
            elseif mana.getmax(uname)<150 then
             mana.setmax(uname,mana.getmax(uname)+5)
             manamaxx[uname]=mana.getmax(uname)
          end
          
          end
          mzeng=nil
              team.save_to_file()
          end
          itemstack:take_item()
          minetest.chat_send_all(uname..":写轮眼! Sharingan!")
          minetest.sound_play({ pos = user:get_pos(), name = "saringan", gain = 20, max_hear_distance = 500 })
          local invme=user:get_inventory()
          local invmec={}
          local invyou=pointed_thing.ref:get_inventory()
          local inme=invme:get_size("main")
          playereffects.apply_effect_type("sharingan",139,user)
          playereffects.apply_effect_type("sharingancd",220,user)
          for i=1,inme,1 do
          invmec[i]=invme:get_stack("main",i)
          if string.find(invyou:get_stack("main",i):get_name(),"sa:") or string.find(invyou:get_stack("main",i):get_name(),"rasengen:") and not string.find(invyou:get_stack("main",i):get_name(),"rasengen:money") then
          invme:set_stack("main",i,invyou:get_stack("main",i))
          minetest.after(139,function()
          invme:set_stack("main",i,invmec[i])
          
          end)
          end
          end
    minetest.after(140,function()    
--  itemstack:add_item("sa:shinsharingan")
  invme:add_item("main",ItemStack("sa:shinsharingan"))
  end)
    minetest.after(220,function()
    ready16[uname]=true
    uname=nil
    
    end)
    end
    end
else minetest.chat_send_player(uname,"魔法不足 no mana")
end
else minetest.chat_send_player(uname,"冷却中 cd")
uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})

minetest.register_tool("sa:sblade", {
	description = "影刃 shadow blade(5s)",
	tiles = {"sb.png"},
	visual_scale = 1.0,
	inventory_image = "sb.png",
	wield_image = "sb.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 if ready17[uname] then
if mana.get(uname)>15 then
ready17[uname]=false
 mana.subtract(uname,15)
 invisible(user,true)
 playereffects.apply_effect_type("sbi",5,user)
 minetest.after(5,function()
 invisible(user,nil)
 
 end)
  playereffects.apply_effect_type("sbc",37,user)
  minetest.after(37,function()
 ready17[uname]=true
 uname=nil
 end)
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})





minetest.register_tool("sa:slow", {
	description = "全体减速 All Slow Down",
	tiles = {"slowdown.png"},
	visual_scale = 1.0,
	inventory_image = "slowdown.png",
	wield_image = "slowdown.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 if ready19[uname] then
if mana.get(uname)>50 then
ready19[uname]=false
 mana.subtract(uname,50)
 minetest.chat_send_all(uname..":全体减速!All Slow Down!!'")
minetest.sound_play({ pos = user:get_pos(), name = "slowd", gain = 10, max_hear_distance = 100 })
for _,player in ipairs(minetest.get_connected_players()) do
local name = player:get_player_name()
if player~=user and team.playerlist[name].team~=team.playerlist[uname].team and team.playerlist[uname].team~="none" then
slowflag[name]=true
player:set_physics_override({speed = 0.7 ,jump = 0.8})
minetest.after(9.5,function()
player:set_physics_override({speed = 1 ,jump = 1})
slowflag[name]=false

end)
end
end
minetest.after(270,function()
ready19[uname]=true
uname=nil

end) 
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
 uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})










minetest.register_tool("sa:rad", {
	description = "雷神之怒! Zeus's Warrior!!",
	tiles = {"radd.png"},
	visual_scale = 1.0,
	inventory_image = "radd.png",
	wield_image = "radd.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
 if ready18[uname] then
if mana.get(uname)>70 then
ready18[uname]=false
 mana.subtract(uname,70)
 minetest.chat_send_all(uname..":雷神之怒! Zeus's Warrior!!'")
 minetest.sound_play({ pos = user:get_pos(), name = "rad", gain = 10, max_hear_distance = 1000 })
for _,player in ipairs(minetest.get_connected_players()) do
local name = player:get_player_name()
if player~=user and team.playerlist[name].team~=team.playerlist[uname].team and team.playerlist[uname].team~="none" then
lightning.strike(player:get_pos(),user)
lightning.strike(player:get_pos(),user)
minetest.sound_play({ pos = player:get_pos(), name = "lightning_thunder", gain = 10, max_hear_distance = 100 })
end
end
minetest.after(120,function()
ready18[uname]=true
uname=nil

end) 
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
 uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})

function obbb (objz,user,obj)
 for i,obbj in ipairs(objz) do
    if windflag[obbj] then
    return
    end
    if obbj~=user and obbj~=obj then
    windflag[obbj]=true
    minetest.after(10,function()
    
    windflag[obbj]=false
    end)
    local obpos=obbj:get_pos()
    obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=13, snappy=16, choppy=16},
						}, nil)
            
      minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.2,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4, snappy=16, choppy=16},
						}, nil)
      obpos=obbj:get_pos()
      end
       minetest.after(0.15,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.15,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
            obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4, snappy=16, choppy=16},
						}, nil)
      obpos=obbj:get_pos()
      
      end
       minetest.after(0.3,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.13,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.12,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.06,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
            obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4, snappy=16, choppy=16},
						}, nil)
      obpos=obbj:get_pos()
      end
       minetest.after(0.11,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
            obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4, snappy=16, choppy=16},
						}, nil)
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
                 obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=6, snappy=16, choppy=16},
						}, nil)
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
       minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end minetest.after(0.1,function()
      if obpos then
      obbj:set_pos({x=obpos.x+math.random(-3.5,3.5),y=obpos.y+math.random(-2.1,4.3),z=obpos.z+math.random(-3.5,3.5)})
      obpos=obbj:get_pos()
      end
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
      end
      )
    end
    end
    

objz=nil
end













i=1
local nodexname={}
function xname()
for key, value in pairs(minetest.registered_nodes) do
      nodexname[i]=key
      i=i+1
end

print ("xx"..nodexname[1])
end
xname()
local j=i
i=0
local function xi_player(player)
	local obj = minetest.add_entity({x=math.floor(player:getpos().x),y=math.floor(player:getpos().y),z=math.floor(player:getpos().z)}, "sa:xi")
	if not obj then return
  else
  return obj:get_luaentity()
  end
  
end

local function ice_player(player)
  if player:getpos() then
	local obj = minetest.add_entity({x=math.floor(player:getpos().x),y=math.floor(player:getpos().y),z=math.floor(player:getpos().z)}, "sa:ice1",nil)
  return obj:get_luaentity()
	--if not obj then return
  --else
 -- end
  else 
  return
  end

  
end



 local function checkobd(pos1,pos2,xe)
 if pos1 and pos2 then
 if vector.distance(pos1,pos2)<=3 and xe then
 xe:setvelocity({x=0,y=0,z=0})
 return
 else 
 minetest.after(0.15,function()
 if pos1 and xe then
 checkobd(pos1,xe:get_pos(),xe)
 end
 end)
 end
 end
 end





minetest.register_tool("sa:chibaku2", {
	description = "chibakutenseiv2 地爆天星v2",
	tiles = {"chi.png^[colorize:black:40"},
	visual_scale = 1.0,
	inventory_image = "chi.png^[colorize:black:40",
	wield_image = "chi.png^[colorize:black:40",
  stack_max = 2,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
            itemstack:set_wear(0)
      
  if ready20[uname] then

    if mana.get(uname)>= 47 then
    if pointed_thing.type=="object" then
    if dibaoflag[uname] then 
    local ppos=pointed_thing.ref:get_pos()
    local sp=minetest.add_particlespawner({
					amount = 500,
					time = 3.5,
					minpos = {x=ppos.x-40,y=ppos.y-1,z=ppos.z-40},
					maxpos = {x=ppos.x+40,y=ppos.y+1,z=ppos.z+40},
					minvel = {x=-1, y=1, z=-1},
					maxvel = {x=1,  y=4,  z=1},
					minacc = vector.new(),
					maxacc = vector.new(),
					minexptime = 3.2,
					maxexptime = 5.4,
					minsize = 3,
					maxsize = 4,
					collisiondetection = false,
					texture = "nuke_smoke_dark.png",
				})
    minetest.sound_play("nuke_explode",
		{pos = ppos, gain = 17.0, max_hear_distance = 160})
    minetest.after(0.3,function()
    
     minetest.sound_play("nuke_explode",
		{pos = ppos, gain = 27.0, max_hear_distance = 160})
     minetest.after(0.7,function()
    
     minetest.sound_play("nuke_explode",
		{pos = ppos, gain = 37.0, max_hear_distance = 160})
     minetest.after(1.0,function()
    
     minetest.sound_play("nuke_explode",
		{pos = ppos, gain = 47.0, max_hear_distance = 160})
    
    end)
    end)
    end)
    pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(110, 123.4), snappy=math.random(110, 123.4), choppy=math.random(110, 123.4)}},nil)
   for n=-20,20 do
    for m=-20,20  do
    for nm=40,80  do
    
    minetest.set_node({x=uupos.x+n,y=uupos.y+nm,z=uupos.z+m},{name="air"})
    

    
    
    end
    end
    end
        ready20[uname]=false
           playereffects.apply_effect_type("chiba2",51,user)
           minetest.after(51,function()
           ready20[uname]=true
           dibaoflag[uname]=false
           
           end)
    else
    
    minetest.chat_send_player(uname,"请先形成地爆天星")
    end
    
    
    else

    if not dibaoflag[uname] then
    dibaoflag[uname]=true
    local upos=user:get_pos()
    uupos=upos
    local ss={}
    local number =1
    local partdef={
			pos ={x=upos.x,y=upos.y,z=upos.z} , --minpos
			velocity ={x=0, y=5.4, z=0}, --maxvel
			acceleration={x=0,y=4.1,z=0}, --maxacc
			expirationtime =6.7, --minexptime
			size =11, --minsize
		collisiondetection =	false, --collisiondetection
     vertical = false,
     glow = 2,
			texture ="yinli.png"
       --texture
       }
       minetest.add_particle(partdef)
       minetest.after(6.7,function()
    minetest.sound_play({ pos = user:get_pos(), name = "chibaku", gain = 23, max_hear_distance = 500 })
    minetest.chat_send_all(uname..": 地爆天星 chibakutensei!!")
    

   --[[ for n=-40,40 do
    for m=-40,40 do
    for nm=-1,0 do
   
     ss[number]=minetest.get_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m})
     number=number+1
    minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="air"})
    
    end
    end
    end]]
    for n=-20,20 do
    for m=-20,20  do
    for nm=40,80  do
    if vector.distance({x=upos.x,y=upos.y+60,z=upos.z},{x=upos.x+n,y=upos.y+nm,z=upos.z+m})<=17 then
    minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="default:stone"})
    
    end
    
    
    end
    end
    end
    
     number=1
  local obzz=  minetest.get_objects_inside_radius({x=upos.x,y=upos.y+60,z=upos.z},400)
  
  for _,obj in ipairs(obzz) do
  if obj~= user then
  local xe=xi_player(obj)
  local zd= vector.direction({x=upos.x,y=upos.y+60,z=upos.z}, obj:get_pos())
  obj:set_attach(xe.object, "bone", { x=1, y=1, z=2 }, { x=0, y=0, z=0 })
  
  checkobd({x=upos.x,y=upos.y+60,z=upos.z},obj:get_pos(),xe.object)
  xe.object:set_armor_groups({ immortal = 1 })
  xe.object:setvelocity({x=-zd.x*6,y=-zd.y*6,z=-zd.z*6})
  minetest.after(16,function()
  
  obj:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(40, 53.4), snappy=math.random(40, 53.4), choppy=math.random(40, 53.4)}},nil)
  
  end)
  minetest.after(27,function()
  obj:set_detach()
  
  
  end)
  end
  end
    
    
        end)
   
    
    
        minetest.after(33.8,function()
  --[[    for n=-40,40 do
    for m=-40,40 do
    for nm=-1,0 do
     
   
    minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name=ss[number].name})
      number=number+1
    

    end
    end
    end
        ]]
   for n=-20,20 do
    for m=-20,20  do
    for nm=40,80  do
    
    minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="air"})
    

    
    
    end
    end
    end
   

    
    
    end)
    end
      end
    else minetest.chat_send_player(user:get_player_name(),"魔法不足 mana not enough....")
    end

   else minetest.chat_send_player(user:get_player_name(),"冷却中 cooldown....")
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

--	TODO.
--	on_place = minetest.rotate_node
})


minetest.register_entity("sa:xi", {
	physical = false,
	collisionbox = {1, 1, 1, 1, 1, 1},
  state = "inactive",
 textures ={"zy.png"},
	on_activate = function(self, staticdata)
    self.timer=21
	end,

	on_step = function(self, dtime, ...)

  self.timer=self.timer-dtime
    if self.timer<=0 then
    
    self.object:remove()
    self.timer=21
    return
    end
    

  end,

	get_staticdata = function() 
  return "" 
  end
})



minetest.register_entity("sa:ice1", {
	physical = false,
	collisionbox = {1, 1, 1, 1, 1, 1},
  state = "inactive",
 textures ={"icess.png"},
	on_activate = function(self, staticdata)
    self.timer=37
	end,

	on_step = function(self, dtime, ...)

  self.timer=self.timer-dtime
    if self.timer<=0 then
    
    self.object:remove()
    self.timer=37
    return
    end
    

  end,

	get_staticdata = function() 
  return "" 
  end
})








minetest.register_tool("sa:wall", {
	description = "阻隔之墙 Wall Generation",
	tiles = {"wall.png"},
	visual_scale = 1.0,
	inventory_image = "wall.png",
	wield_image = "wall.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  local upos=user:get_pos()
            itemstack:set_wear(0)
 if ready21[uname] then
if mana.get(uname)>20 then
ready21[uname]=false
 mana.subtract(uname,20)
 minetest.chat_send_all(uname..":施放阻隔之墙!generates a wall!!'")
 local nt ={}
 local number =1
for nm=0,20,0.7 do
for n=-14,14 ,0.7 do
for m=-14,14,0.7 do

local distance=vector.distance(upos,{x=upos.x+n,y=upos.y,z=upos.z+m})
if distance <=11  and distance >=10 then
if minetest.get_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m}).name == "air" then
 minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="default:stone"})
end
nt[number]={n,m}
number=number+1
end
end
end
end
for i=1,6 do
local nn=math.random(1,number)
for nm=0,20,0.7 do


local n=nt[nn][1]
local m=nt[nn][2]
if minetest.get_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m}).name == "default:stone" then
minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="air"})
end
end
end

minetest.after(15,function()
for nm=0,20,0.7 do
for n=-14,14,0.7 do
for m=-14,14,0.7 do

local distance=vector.distance(upos,{x=upos.x+n,y=upos.y,z=upos.z+m})
if distance <=11  and distance >=10 then
minetest.set_node({x=upos.x+n,y=upos.y+nm,z=upos.z+m},{name="air"})

end
end
end
end

minetest.after(23,function()
ready21[uname]=true
end)

end)
 
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
 uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})


function zflame(obj,user,vector)
obj:setvelocity(vector)
    local pos1 = obj:getpos()
    if pos1 then
    local objz = minetest.get_objects_inside_radius({x=pos1.x,y=pos1.y,z=pos1.z}, 1.3)	
    for i,obbj in ipairs(objz) do
    if obbj~=user and obbj~=obj then
    obbj:punch(user, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=5, snappy=5, choppy=5},
						}, nil)
            end
    end
    end


end









local function tan(en,user,obj2)
local function tanin(enx,objx,vdis,vdr)
--minetest.after(0.1,function()
local user=user
if user then
if icetime[user:get_player_name()]>=17 then
enx.object:remove()
icetime[user:get_player_name()]=0
return
end
else 
return
end



if vector.distance(enx.object:get_pos(),objx:get_pos())<=1.5 then
enx.object:remove()
enx=ice_player(objx)
tag[user:get_player_name()]=nil
tan(enx,user,objx)
else
minetest.after(0.1,function()
if enx.object and objx then
if enx.object:get_pos() and objx:get_pos() then
vdr=vector.direction(enx.object:get_pos(),objx:get_pos())
vdis=vector.distance(enx.object:get_pos(),objx:get_pos())
enx.object:setvelocity({x=vdr.x*3.7,y=vdr.y*3.7,z=vdr.z*3.7})
tanin(enx,objx,vdis,vdr)
else
enx.object:remove()
return
end
else
return
end
end)
end

--end)


end
local objs
if en then
objs=minetest.get_objects_inside_radius(en.object:get_pos(), 17)
else return
end
if obj2 and user then
obj2:punch(user,1.2,{full_punch_interval = 0.8,damage_groups = {fleshy=math.random(7, 9.4), snappy=math.random(7, 9.4), choppy=math.random(7, 9.4)}},nil)
end

for _,objz in ipairs(objs) do
if not tag[user:get_player_name()] then
 --if obj:is_player() and obj~=user and obj~=en.object and obj~=obj2 then
 if objz~=user and objz~=en.object and objz~=obj2 then
 tag[user:get_player_name()]=1
 icetime[user:get_player_name()]=icetime[user:get_player_name()]+1
 
        minetest.sound_play({ pos = objz:get_pos(), name = "ice", gain = 7, max_hear_distance = 70 })
        local vdr
        if en.object and objz then
       if en.object:get_pos()~=objz:get_pos() then
        vdr=vector.direction(en.object:get_pos(),objz:get_pos())
        
        else
        vdr=vector.direction(en.object:get_pos(),{x=objz:get_pos().x+1,y=objz:get_pos().y+1,z=objz:get_pos().z-1})
        end
--if isNaN(vdr.x)  or isNaN(vdr.y) or  isNaN(vdr.z)   then
    
     -- local   vdr=vector.direction({x=math.floor(en.object:get_pos().x),y=math.floor(en.object:get_pos().y),z=math.floor(en.object:get_pos().z)},{x=math.floor(obj:get_pos().x),y=math.floor(obj:get_pos().y),z=math.floor(obj:get_pos().z)})
    --     end
 local vdis=vector.distance(en.object:get_pos(),objz:get_pos())
 en.object:setvelocity({x=vdr.x*3.3,y=vdr.y*3.3,z=vdr.z*3.3})
   if icetime[user:get_player_name()]>=17 then
   en.object:remove()
   icetime[user:get_player_name()]=0
  return
  end
  tanin(en,objz,vdis,vdr)
  end

 end
else
end
end


end








minetest.register_tool("sa:ice", {
	description = "连环霜冻 Chain Ice",
	tiles = {"ices.png"},
	visual_scale = 1.0,
	inventory_image = "ices.png",
	wield_image = "ices.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  local upos=user:get_pos()
            itemstack:set_wear(0)
 if ready22[uname] then
if mana.get(uname)>40 then
if pointed_thing.type=="object" then
ready22[uname]=false
icetime[uname]=0
tag[uname]=nil
 mana.subtract(uname,40)
 minetest.chat_send_all(uname..":施放连环霜冻!spells chain ice ball!!'")
 if pointed_thing.ref then

local en = ice_player(pointed_thing.ref)
tan(en,user,pointed_thing.ref)
  pointed_thing.ref:punch(user,1.2,{full_punch_interval = 0.8,
        damage_groups = {fleshy=math.random(10, 11.4), snappy=math.random(10, 10.4), choppy=math.random(12, 13.4)}},nil)
playereffects.apply_effect_type("icecd",23,user)
minetest.after(23,function()
ready22[uname]=true
end)
 end
 else return
 end
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
 uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})








minetest.register_entity("sa:fumo", {
	physical = true,
	collisionbox = {1, 1, 1, 1, 1, 1},
  state = "inactive",
 textures ={"momo.png"},
	on_activate = function(self, staticdata)
    self.timer=1
	end,

	on_step = function(self, dtime , ...)

  self.timer=self.timer-dtime
    if self.timer<=0 then
    
    self.object:remove()
    self.timer=1
    return
    end
    

  end,

	get_staticdata = function() 
  return "" 
  end
})



function mopan(o1,o2,uname,pos)

minetest.after(0.1,function()
local dis=vector.distance(o1:get_pos(),o2:get_pos())
if dis >15 then
local e1=minetest.add_entity(o1:get_pos(), "team:xi")
local e2=minetest.add_entity(o2:get_pos(), "team:xi")
 o1:set_attach(e1, "bone", { x=0, y=0, z=0 }, { x=0, y=0, z=0 })
  e1:set_armor_groups({ immortal = 1 })
 e1:setvelocity({x=0,y=-0,z=0})
  o2:set_attach(e2, "bone", { x=0, y=0, z=0 }, { x=0, y=0, z=0 })
  e2:set_armor_groups({ immortal = 1 })
 e2:setvelocity({x=0,y=-0,z=0})
else
if panding[uname] then
minetest.add_entity({x=pos.x,y=pos.y+1,z=pos.z}, "sa:fumo")
local vd=vector.direction(o1:get_pos(),o2:get_pos())
if vector.distance(pos,o2:get_pos())<=1 then
pos=o2:get_pos()
mopan(o2,o1,uname,pos)
else
pos={x=pos.x+vd.x*1.2,y=pos.y+vd.y*1.2,z=pos.z+vd.z*1.2}
mopan(o1,o2,uname,pos)
end


end
end
end)


end

minetest.register_tool("sa:mo", {
	description = "缚魂 soul lock",
	tiles = {"mo.png"},
	visual_scale = 1.0,
	inventory_image = "mo.png",
	wield_image = "mo.png",
  stack_max = 9,
  groups=sasa,
	sunlight_propagates = true,
	walkable = false,

	on_use =  function(itemstack, user, pointed_thing)
  local uname=user:get_player_name()
  local upos=user:get_pos()
            itemstack:set_wear(0)
 if ready23[uname] then
if mana.get(uname)>40 then
if pointed_thing.type=="object"  and pointed_thing.ref:is_player() and team.playerlist[uname].team~=team.playerlist[pointed_thing.ref:get_player_name()].team and team.playerlist[uname].team~="none" then
ready23[uname]=false
local dis=20
heroinmo[1]=pointed_thing.ref
local zzobjs=minetest.get_objects_inside_radius(pointed_thing.ref:get_pos(), 15)
for _,obj in ipairs(zzobjs) do
if not moflag[uname] then
if obj:is_player() and team.playerlist[uname].team~=team.playerlist[obj:get_player_name()].team and team.playerlist[uname].team~="none" and obj~=user and obj~= pointed_thing.ref then
heroinmo[2]=obj
moflag[uname]=true
panding[uname]=true
mopan(pointed_thing.ref,obj,uname,pointed_thing.ref:get_pos())
playereffects.apply_effect_type("fub",13,obj)
playereffects.apply_effect_type("fub",13,pointed_thing.ref)
end
end


end


minetest.after(13,function()
panding[uname]=false
heroinmo[1]=nil
moflag[uname]=false
heroinmo[2]=nil
end)
 playereffects.apply_effect_type("fu",53,user)
minetest.after(53,function()
ready23[uname]=true
end)
end
 
else minetest.chat_send_player(uname,"魔法不足 no mana")
uname=nil
end
else minetest.chat_send_player(uname,"冷却中 cd")
 uname=nil
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
--	TODO.
--	on_place = minetest.rotate_node
})
