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
-------------------------------------------------------------------------------------------------------------------

------------------------------------------------------
-- NUKING ARRAYS
------------------------------------------------------

--This fucntion chooses and casts nuke spells based on recast timers.
--It takes a given list of spells, checks the recast timers, selects the first spell that's ready, and casts it.

--How to use:
--Typing "//gs c nuke blm4" nukes the first available spell from the blm4 list that's not on recast cooldown.
--This is how to put the command in the macro palatte: /console gs c nuke blm4 
--I prefer to use bind keys.  This is how to assign the function to the End key: //bind end gs c nuke blm4
--Each time you hit the End key, you'll nuke a spell from the blm4 list.
--Essentially, it turns the End key into a "nuke button."  If you keep pushing it, you keep casting spells.

--The shortcuts lua needs to be running in order for this function to work.
--The function chooses the spell based on only the recast timer.  MP has nothing to do with it.
--If you don't have enough mp, it will try casting the spell anyway, and you'll get "not enough MP" message.
--You need to target a mob before using the function.
--The mob also needs to be in ranage.

--I'd like to create an addon for this and call it nuke button, but I don't know how to do that.
--It could have a data file with different nuke_arrays.  Kind of like azuresets data file.
--It would also be good to have the choose_nuke function return an error message if there's no such set.
--The number next to each spell is it's spell number or something.  I need that to get the recast.
--I'd like to be able to look up recast or the recast # from the spell's name.  But idk how to do that.

--Todo: Add 2 RUN sets: single target hate, AOE hate

nuke_array = {}

-----------------------------
-- BLU NUKES
-----------------------------

-- //gs c nuke blu
nuke_array.blu= {
           {'Spectral Floe',720},
           {'Tenebral Crush',728},
           {'Anvil Lightning',721},
           {'Entomb',722},
           {'Subduction',708},
}

-- //gs c nuke blu2
nuke_array.blu2 = {
           {'Anvil Lightning',721},
           {'Entomb',722},
           {'Subduction',708},
}

-- //gs c nuke blu3
-- same as blu
nuke_array.blu3= {
           {'Spectral Floe',720},
           {'Tenebral Crush',728},
           {'Anvil Lightning',721},
           {'Entomb',722},
           {'Subduction',708},
}


--This is a nuke list for Naga Raja.
--I like to go BLU when fighting Naga. 
--When the dragon flies, and melee hits don't work, I can nuke to continue dealing damage.

--Naga resists Subduction (wind) and Spectral Floe (ice) because it's an ice-based mob.
--Light and Dark based nukes work well.  Fire does ok too.

--Most of these are AOE spells, which are good for nuking the adds.
--This is where BLU shines over COR and RNG.
--COR and RNG can do great damage to Naga with Leaden Salute and Trueflight, maybe even more than BLU.
--But BLU AOE spells are great for killing the adds when they pop.

--Other tips:
--Make sure to keep up Erratic Flutter in order to reduce the recast times.
--Magic Hammer works well on Naga.  Even in the air.  Cast that to get back your MP.
--Naga is also weak to Sanguine Blade.  But he has to be on the ground for it to work.

--Recast times:
--Retinal Glare 45 seconds, 26 MP
--Tenebral Crush 60 seconds, 116 MP
--Blinding Fulgor 60 seconds, 116 MP
--Searing Tempest  60 seconds, 116 MP
--Palling Salvo 60 seconds, 175 MP
--Rail Cannon 80 seconds, 200 MP
--Magic Hammer 180 seconds, 40 MP

-- //gs c nuke naga
nuke_array.naga= {
           {'Retinal Glare',707},
           {'Tenebral Crush',728},
           {'Blinding Fulgor',725},
           {'Searing Tempest',719},
           {'Palling Salvo',724},
           {'Rail Cannon',712},
           {'Magic Hammer',646},
}

-- Spells to nuke Fomor mobs in Vagary.
-- //gs c nuke vag1
nuke_array.vag1= {
           {'Searing Tempest',719},
           {'Anvil Lightning',721},
           {'Silent Storm',727},
}

-- Spells to nuke Amorph mobs in the Vagary lottery zone.
-- //gs c nuke vag2
nuke_array.vag2= {
           {'Spectral Floe',720},
           {'Tenebral Crush',728},
           {'Anvil Lightning',721},
}



-----------------------------
-- BLM NUKES
-----------------------------

--On the blm lists, I have AOE spells for Thunder, Blizzard, Fire, and Stone.
--The mobs I like to nuke a lot resist Water and Aero, so I left those spells off the list.
--So as of the day I'm writing this, 6/10/2018, its seems like the one's I'll use the most are
--blm1 for pulling mobs
--blm4 for nuking them
--I might not use the others much.  Maaaybe when I'm cleaving weakened?  We'll see.

-- //gs c nuke blm1
nuke_array.blm1 = {
           {'Thundaga',194},
           {'Blizzaga',179},
           {'Firaga',174},
           {'Stonega',189},
}

-- //gs c nuke blm1rev 
nuke_array.blm1rev = {
           {'Stonega',189},
           {'Firaga',174},
           {'Blizzaga',179},
           {'Thundaga',194},
}

-- //gs c nuke blm2
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

-- //gs c nuke blm3
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

-- //gs c nuke blm4
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


-----------------------------
-- RUN "NUKES"
-----------------------------

--Spells for hate on RUN
--Flash       0.5 second cast, 45 second recast, 25 MP, 1280 VE, 180 CE
--Foil          1 second cast, 45 second recast, 48 MP, 880 VE, 320 CE
--Blank Gaze    3 second cast, 10 second recast, 25 MP, 320 VE, 320 CE

-- //gs c nuke run1
nuke_array.run1 = {
           {'Flash',112},
           {'Foil',840},
           {'Blank Gaze',592},          
           {'Sheep Song',584},
           {'Geist Wall',605},
           {'Stinking Gas',537},
           {'Soporific',598},
}

--AOE blue spells for hate.
--Sheep Song    3 second cast, 60 second recast, 22 MP, 320 VE, 320 CE
--Geist Wall    3 second cast, 30 second recast, 35 MP, 320 VE, 320 CE
--Stinking Gas  4 second cast, 37 second recast, 37 MP, 320 VE, 320 CE
--Soporific     3 second cast, 90 second recast, 38 MP, 320 VE, 320 CE

-- //gs c nuke run2
nuke_array.run2 = {
           {'Sheep Song',584},
           {'Geist Wall',605},
           {'Stinking Gas',537},
           {'Soporific',598},
}


function choose_nuke(array, label)
        for i,v in pairs(array) do
            recasttime = windower.ffxi.get_spell_recasts()[v[2]]
            if recasttime == 0 then
                send_command(string.gsub(v[1], "%s+", ""))
                add_to_chat(7,'<<NUKE '..label..' #'..i..'>>  '..v[1]..' >> '..tostring(player.target.name))
                return
            else
                --add_to_chat(4,v[1]..' recast time: '..recasttime / 100)
            end
        end
        add_to_chat(4,'No spells are ready')
end


------------------------------------------------------
-- BUFFING ARRAYS
------------------------------------------------------

--I just wrote this during maintenance when game was down.  Need to test it.
--First item in each line is the spell to cast.  Second item is the buff it produces.
--Example: Erratic Flutter is the spell, but the buff effect is called Haste.
--The synatx of the fuction checks for Haste.  If no Haste is detected, it casts Erratic Flutter.
--I named the table "buffme_array" because there might already be some other table named buff or buffs.
--The developers probably wouldn't name something buffme.  But you never know!

buffme_array = {}

--haoc: Haste, Aquaveil, Occultation, Cocon
-- //gs c buffme haoc
buffme_array.haoc = {
    {'Erratic Flutter','Haste'},
    {'Aquaveil','Aquaveil'},
    {'Occultation','Blink'},
    {'Cocoon','Defense Boost'},
}

-- //gs c buffme run
buffme_array.run = {
    {'Shell V','Shell'},
    {'Protect IV','Protect'},
    {'Crusade','Enmity Boost'},
    {'Phalanx','Phalanx'},
    {'Cocoon','Defense Boost'},
}


function choose_buffme(array, label)
        for i,v in pairs(array) do
            if not buffactive[v[2]] then
                send_command(string.gsub(v[1], "%s+", ""))
                add_to_chat(4,'<<BUFF '..label..' #'..i..'>>  '..v[1])
                return
            else
                --add_to_chat(4,v[1]..' recast time: '..recasttime / 100)
            end
        end
        add_to_chat(4,'All buffs on')
end


------------------------------------------------------
-- SELF-COMMAND FUNCTION
------------------------------------------------------

--This is how to to pass commands with the //gs c syntax.
--I guess if a particular gearswap lua has a job_self_command function, it will over-ride this.
--Most of my luas don't have one.
--If a lua has a job_self_command function alreay,this in it, then you need to add rules for "nuke" and "buffme" commands.
--I'd like to set up an error message if the arument after 'nuke' isn't entered.
--ATM, uppercase letters don't work for function argumentfs.  Change that.
--FIgure out how to have 2+ colors of text on the same line.

function job_self_command(commandArgs, eventArgs)    
    if commandArgs[1] == 'nuke' then
        choose_nuke(nuke_array[commandArgs[2]],commandArgs[2])        
    end    

    if commandArgs[1] == 'buffme' then
        choose_buffme(buffme_array[commandArgs[2]],commandArgs[2])
        --print('hi mom')
    end

    --if cmdParams[1]:lower() == 'rune' then
    --cmdParams or commandArgs?  The funciton from the RUN lua used cmdParams.  But that didn't work here.
    if commandArgs[1] == 'rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
        
    end
    
    --Delete this after I confirm the above function works.    
    --[[
    if commandArgs[1] == 'buffme' then
        if not buffactive.Haste then
            send_command('erraticflutter')
        elseif not buffactive['Aquaveil'] then
            send_command('aquaveil')
        elseif not buffactive.Blink then
            send_command('occultation')
        end
    end    
    ]]--
    
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
