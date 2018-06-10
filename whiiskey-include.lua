-- Custom functions for Whiiskey
-- Taking my functions from Sammeh and Langly

-- I need to figure out more about these require functions
res = require('resources')
extdata = require('extdata')



-------------------------------------------------------------------------------------------------------------------
--  FEATURES:
-------------------------------------------------------------------------------------------------------------------
--  Aliases!
--  My format matches 
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
--  TODO:
-------------------------------------------------------------------------------------------------------------------
--  Name sure the names of the gear sets match Motes original format and my luas.
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- ALIASES
-------------------------------------------------------------------------------------------------------------------

-----------------------------
-- Items
-----------------------------

-- Echo is already a windower console command and a ffxi command, so I use ech
send_command('alias ech input /item "Echo Drops" <me>')
send_command('alias echodrop input /item "Echo Drops" <me>')
send_command('alias echodrops input /item "Echo Drops" <me>')
send_command('alias rem input /item "Remedy" <me>')
send_command('alias remedy input /item "Remedy" <me>')
-- Using "hol" seems good, "holy" is the spell, "ho" is Horde Lullaby II, "hw" is healing waltz
send_command('alias hol input /item "Holy Water" <me>')
send_command('alias holywater input /item "Holy Water" <me>')
send_command('alias warpr input /equip ring2 "Warp Ring"')
send_command('alias warpring input /equip ring2 "Warp Ring"')

-- Temp items in Escha/Reisenjima
send_command('alias revit input /item "Super Revitalizer" <me>')
send_command('alias pot1 input /item "Lucid Potion I" <me>')
send_command('alias pot2 input /item "Lucid Potion II" <me>')
send_command('alias pot3 input /item "Lucid Potion III" <me>')
send_command('alias eth1 input /item "Lucid Ether I" <me>')
send_command('alias eth2 input /item "Lucid Ether II" <me>')
send_command('alias eth3 input /item "Lucid Ether III" <me>')
send_command('alias elixir1 input /item "Lucid Elixir I" <me>')
send_command('alias elixir2 input /item "Lucid Elixir II" <me>')
send_command('alias elixir3 input /item "Megalixir" <me>')
send_command('alias megalixir input /item "Megalixir" <me>')
send_command('alias wing input /item "Daedalus Wing" <me>')
send_command('alias wing1 input /item "Lucid Wings I" <me>')
send_command('alias wing2 input /item "Lucid Wings II" <me>')
send_command('alias manamist input /item "Mana Mist" <me>')
send_command('alias hpmist input /item "Healing Mist" <me>')
send_command('alias cat input /item "Catholicon" <me>')
send_command('alias cat1 input /item "Catholicon +1" <me>')
send_command('alias savior input /item "Savior\'s Tonic" <me>')
send_command('alias mirror input /item "Mirror\'s Tonic" <me>')
send_command('alias moneta input /item "Moneta\'s Tonic" <me>')
send_command('alias cleric input /item "Cleric\'s Drink" <me>')
send_command('alias steadfast input /item "Steadfast Tonic" <me>')
send_command('alias charmb input /item "Charm Buffer" <me>')


-----------------------------
--  Gear sets
-----------------------------

-- Magic
send_command("alias fast gs equip sets.precast.FC")
send_command("alias fastb gs equip sets.precast.FC['Blue Magic']")
send_command("alias fastc gs equip sets.precast.FC.Cure") 
send_command("alias faste gs equip sets.precast.FC['Elemental Magic']")
send_command("alias fasts gs equip sets.precast.FC.BardSong")
send_command("alias quick gs equip sets.quick")
send_command("alias quickb gs equip sets.quickblue")
send_command("alias cur gs equip sets.midcast.Cure")
send_command("alias curself gs equip sets.self_healing")
send_command("alias cursnaset gs equip sets.midcast.Cursna")


-- TP
send_command("alias tp gs equip sets.engaged")
send_command("alias tpacc gs equip sets.engaged.Acc")
send_command("alias tpmaxacc gs equip sets.engaged.MaxAcc")

-- WS
send_command("alias ws gs equip sets.precast.WS")
send_command("alias wsacc gs equip sets.precast.WS.Acc")
send_command("alias wsdim gs equip sets.precast.WS.Dimidiation")
send_command("alias wsres gs equip sets.precast.WS.Resolution")
send_command("alias wscdc gs equip sets.precast.WS['Chant du Cygne']")    
send_command("alias wsex gs equip sets.precast.WS['Expiacion']")
send_command("alias wssav gs equip sets.precast.WS['Savage Blade']")
send_command("alias wsreq gs equip sets.precast.WS['Requiescat']")
send_command("alias wssan gs equip sets.precast.WS['Sanguine Blade']")
-- Figure out how to manage that ' in Rudra's Storm
send_command("alias wsrud gs equip sets.rud")

-- Special
send_command("alias af1 gs equip sets.af1")
send_command("alias af2 gs equip sets.af2")
send_command("alias af3 gs equip sets.af3")
send_command("alias ambus1 gs equip sets.ambus1")
send_command("alias ambus2 gs equip sets.ambus2")
send_command("alias telchine gs equip sets.telchine")
send_command("alias amalric gs equip sets.amalric")
send_command("alias th gs equip sets.TreasureHunter")
send_command("alias enm gs equip sets.enmity")
send_command("alias enmd gs equip sets.enmitydown")
send_command("alias frenzy gs equip sets.Frenzy")
send_command("alias naked gs equip naked")



-------------------------------------------------------------------------------------------------------------------
--  MY FUNCTIONS
--  https://github.com/sethmccauley/GearSwap
-------------------------------------------------------------------------------------------------------------------

--Arrays for auto-nuking with commands like //gs c nuke blm4 or //gs c nuke blu3
--Assign //gs c nuke blm4 to a bind key.
--Then each time you hit the key, you'll nuke the highest priority spell on the blm4 list that's ready for recast.
--The function chooses the spell based on only the recast timer.  MP has nothing to do with it.
--If you don't have enough mp, it will try casting the spell anyway, and you'll get "not enough MP" message.
--The shortcuts lua needs to be running in order for this to work.


--This function should probably be it's own addon lua, but idk how to do that
--It could have a data file with different nuke_arrays.  Kind of like azuresets data file.
--It would also be good to have the choose_nuke function return an error message if there's no such set.
--The number next to each spell is it's spell number or something.  I need that to get the recast.
--I'd like to be able to look up recast or the recast # from the spell's name.  But idk how to do that.

--Add 2 RUN sets: single target hate, AOE hate

nuke_array = {}
nuke_array.blu3= {
           {'Spectral Floe',720},
           {'Tenebral Crush',728},
           {'Anvil Lightning',721},
           {'Entomb',722},
           {'Subduction',708},
}
nuke_array.blu2 = {
           {'Anvil Lightning',721},
           {'Entomb',722},
           {'Subduction',708},
}


--These are nukes for Naga Raja.
--When the dragon flies, melee hits don't work, but nukes do!
--Naga seems to resist Subduction and Spectral Floe.  But Dark and Light based nukes work.
--Three of the nukes are AOE spells, which are good for nuking the adds.
--Make sure Erratic Flutter is up to reduce the recast times.
--Magic Hammer works well on Naga too.  Cast that if the other spells are down.

--Recast times:
--Retinal Glare 45 seconds
--Tenebral Crush 60 seconds
--Blinding Fulgor 60 seconds
--Palling Salvo 60 seconds
--Rail Cannon 80 seconds
--Magic Hammer 180 seconds

nuke_array.naga= {
           {'Retinal Glare',707},
           {'Tenebral Crush',728},
           {'Blinding Fulgor',725},
           {'Palling Salvo',724},
           {'Rail Cannon',712},
           {'Magic Hammer',646},
}


--On the blm lists, I have AOE spells for Thunder, Blizzard, Fire, and Stone.
--The mobs I like to nuke a lot resist Water and Aero, so I left those spells off the list.
--So as of the day I'm writing this, 6/10/2018, its seems like the one's I'll use the most are
--blm1 for pulling mobs
--blm4 for nuking them
--I might not use the others much.  Maaaybe when I'm cleaving weakened?  We'll see.
nuke_array.blm1 = {
           {'Thundaga',194},
           {'Blizzaga',179},
           {'Firaga',174},
           {'Stonega',189},
}
nuke_array.blm1rev = {
           {'Stonega',189},
           {'Firaga',174},
           {'Blizzaga',179},
           {'Thundaga',194},
}
nuke_array.blm2 = {
           {'Thundaga II',195},
           {'Blizzaga II',180},
           {'Firaga II',175},
           {'Stonega II',190},
           {'Thundaga',194},
           {'Blizzaga',179},
           {'Firaga',174},
           {'Stonega',189},
}
nuke_array.blm3 = {
           {'Thundaga III',196},
           {'Blizzaga III',181},
           {'Firaga III',176},
           {'Stonega III',191},
           {'Thundaga II',195},
           {'Blizzaga II',180},
           {'Firaga II',175},
           {'Stonega II',190},
           {'Thundaga',194},
           {'Blizzaga',179},
           {'Firaga',174},
           {'Stonega',189},
}
nuke_array.blm4 = {
           {'Thundaja',500},
           {'Blizzaja',497},
           {'Firaja',496},
           {'Stoneja',499},
           {'Thundaga III',196},
           {'Blizzaga III',181},
           {'Firaga III',176},
           {'Stonega III',191},
           {'Thundaga II',195},
           {'Blizzaga II',180},
           {'Firaga II',175},
           {'Stonega II',190},
           {'Thundaga',194},
           {'Blizzaga',179},
           {'Firaga',174},
           {'Stonega',189},
}

function choose_nuke(array, label)
        for i,v in pairs(array) do
            recasttime = windower.ffxi.get_spell_recasts()[v[2]]
            if recasttime == 0 then
                send_command(string.gsub(v[1], "%s+", ""))
                add_to_chat(5,'('..label..' spell	 #'..i..') '..v[1]..' >> '..tostring(player.target.name))
                return
            else
                --add_to_chat(4,v[1]..' recast time: '..recasttime / 100)
            end
        end
        add_to_chat(4,'No spells are ready')
end


--This is needed to pass commands with the //gs c syntax.
--I guess if a particular gearswap lua has a job_self_command function, it will over-ride this.
--Most of my luas don't have one, so I don't need to worry about those.
--But if a lua has this in it, then it needs to add a rule for how to handle the nuke argument.
function job_self_command(commandArgs, eventArgs)    
    if commandArgs[1] == 'nuke' then
        choose_nuke(nuke_array[commandArgs[2]],commandArgs[2])        
    end    
    
    --Generalize this.
    if commandArgs[1] == 'buffme' then
        if not buffactive.Haste then
            send_command('erraticflutter')
        elseif not buffactive['Aquaveil'] then
            send_command('aquaveil')
        elseif not buffactive.Blink then
            send_command('occultation')
        end
    end    
    
end

-------------------------------------------------------------------------------------------------------------------
--  LANGLY FUNCTIONS
--  https://github.com/sethmccauley/GearSwap
-------------------------------------------------------------------------------------------------------------------
 
-- 2 functions form langly
-- Capacity cape: this just keeps the cape equipped when you put it on.
-- Not as fancy as put cape in idle mode, ws mode, but not melee mode.
-- But it sure is simple.  Not sure which I like better.

-- Item must be equipped for it to return any meaningful value.
function is_enchant_ready(--[[name of item]]item)
	local item_id, item = res.items:find(function(v) if v.name == item then return true end end)
	local inventory = windower.ffxi.get_items()
	local usable_bags = T{'inventory','wardrobe','wardrobe2','wardrobe3','wardrobe4'}
	local itemdata = {}
	
	for i,v in pairs(inventory) do
		if usable_bags:contains(i) then
			for key,val in pairs(v) do
				if type(val) == 'table' and val.id == item_id then
					itemdata = extdata.decode(val)
				end
			end
		end
	end
	
	if itemdata and itemdata.charges_remaining then
		if itemdata.activation_time - itemdata.next_use_time > item.cast_delay then
			return true
		end
	end
	return false
end

function has_charges(--[[name of item]]item)
	local item_id, item = res.items:find(function(v) if v.name == item then return true end end)
	local inventory = windower.ffxi.get_items()
	local bags = T{'inventory','safe','safe2','storage','satchel','locker','sack','case','wardrobe','wardrobe2','wardrobe3','wardrobe4'}
	local itemdata = {}
	
	for i,v in pairs(inventory) do
		if bags:contains(i) then
			for key,val in pairs(v) do
				if type(val) == 'table' and val.id == item_id then
					itemdata = extdata.decode(val)
				end
			end
		end
	end
	
	if itemdata and itemdata.charges_remaining then
		if itemdata.charges_remaining > 0 then
			return true
		end
	end
	return false
end



-------------------------------------------------------------------------------------------------------------------
--  SAMMEH FUNCTIONS
--  hhttps://github.com/SammehFFXI/FFXIAddons
-------------------------------------------------------------------------------------------------------------------

-- OK, I'm gonna mess with this now
-- I would actually like this fuction to return something, a true/false, a string, something

function checkblocking(spell)
        --add_to_chat(2,'Spell recast_id: '..spell.recast_id)
	if buffactive.sleep or buffactive.petrification or buffactive.terror then 
	   add_to_chat(3,'Canceling Action - Asleep/Petrified/Terror!')
	   cancel_spell()
	   return
	end 
	if spell.english == "Double-Up" then
	  if not buffactive["Double-Up Chance"] then 
	   add_to_chat(3,'Canceling Action - No ability to Double Up')
	   cancel_spell()
	   return
	  end
	end
	if spell.name ~= 'Ranged' and spell.type ~= 'WeaponSkill' and spell.type ~= 'Scholar' then
      if spell.action_type == 'Ability' then
	    if buffactive.Amnesia then
		  cancel_spell()
		  add_to_chat(3,'Canceling Ability - Currently have Amnesia')
		  return
		else
	      recasttime = windower.ffxi.get_ability_recasts()[spell.recast_id] 
          if spell and (recasttime >= 1) then
		    add_to_chat(3,'Ability Canceled:'..spell.name..' - Waiting on Recast:(seconds) '..recasttime..'')
            cancel_spell()
            return
          end
		end
	  end
      if spell.action_type == 'Magic' then
	    if buffactive.Silence then
	      cancel_spell()
		  echodrops = "Echo Drops"
		  numberofecho = player.inventory[echodrops].count
		  if numberofecho < 2 then 
		    add_to_chat(2,'Silenced - Consider using Echo Drops. QTY:'..player.inventory[echodrops].count..'')
		  else 
		    add_to_chat(3,'Silenced - Using Echo Drops.  QTY:'..numberofecho..'')
		    send_command('input /item "Echo Drops" <me>')
		  end
		  return
	    else 
		  if (spell.name == 'Refresh' and (buffactive["Sublimation: Complete"] or buffactive["Sublimation: Activated"]) and spell.target.type == 'SELF') then
		   add_to_chat(3,'Cancel Refresh - Have Sublimation Already')
		   cancel_spell()
		   return
		  end
	      recasttime = windower.ffxi.get_spell_recasts()[spell.recast_id] / 100
          if spell and (recasttime >= 1) then
                   
		   add_to_chat(2,'Spell Canceled:'..spell.name..' - Waiting on Recast:(seconds) '..recasttime..'')
           cancel_spell()
           return
          end
		end
      end
    end
	if spell.type == 'WeaponSkill' and buffactive.Amnesia then
		  cancel_spell()
		  add_to_chat(3,'Canceling Ability - Currently have Amnesia')
		  return	  
	end
	if spell.name == 'Utsusemi: Ichi' and (buffactive['Copy Image (3)'] or buffactive ['Copy Image (4+)']) then
	  cancel_spell()
	  add_to_chat(3,'Canceling Utsusemi - Already have Max and can not override')
	  return
	end
end
