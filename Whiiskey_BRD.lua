-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- This is Sammeh's LUA.
-- https://onedrive.live.com/?authkey=%21AKFeq76Tdl7LbNM&v=TextFileEditor&id=18521B913EC1C4A9%21131406&cid=18521B913EC1C4A9&parId=18521B913EC1C4A9%21131398

--[[
    Custom commands:
    
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('sammeh_custom_functions.lua')
    include('lullaby.lua')
      -- //gs c show ---- Shows the txt box
      -- //gs c hide ---- Hides the txt box (default)
      -- //gs c reset ---- Resets the mob list (this is issued on zone. But if you sleep and run away while staying in zone it will hang out in memory forever). 
    
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
    -- My test, I added this #1
    state.LullabyInstrumentMode =M{['description']='Lullaby Instrument', 'Ghorn', 'Daurdabla', 'Marsyas'}
    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	
	send_command("alias buff gs equip sets.midcast.SongEffect")
        send_command("alias debuff gs equip sets.midcast.SongDebuff")
        send_command("alias macc gs equip sets.midcast.ResistantSongDebuff")
	send_command("alias lul gs equip sets.midcast.LullabyFull")
	send_command("alias fast gs equip sets.precast.FastCast.BardSong")
	send_command("alias tp gs equip sets.engaged")
	send_command("alias tpacc gs equip sets.engaged.Acc")
	send_command("alias th gs equip sets.TreasureHunter")
	send_command("alias wsrud gs equip sets.rud")    
    
    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Duration', 'Resistant')
    state.IdleMode:options('Normal', 'Lullaby')
    state.PhysicalDefenseMode:options('PDT','MaxHP')   --control F10
    
    --brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    --pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
    -- If Max Job Points - adds alot of timers to the custom timers
    MaxJobPoints = 1
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    -- I added this #2
    send_command('bind !` gs c cycle LullabyInstrumentMode')
    --send_command('bind !` input /ma "Chocobo Mazurka" <me>')

    select_default_macro_book()
    --send_command('@wait 1;input /lockstyleset 40')

    -- This was the #nottoosoon code #1/3
    -- 2.6 to be risky.  2.7 to play it safe
    waittime = 2.6

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
-- This makes sure that when Nightengale is up, we dont use a precast set.  Midcast only.
function job_precast(spell, action, spellMap, eventArgs)
    -- handle_equipping_gear(player.status)
	checkblocking(spell)
   if spell.type == 'BardSong' then
	if buffactive.Nightingale then
		local generalClass = get_song_class(spell)
		if generalClass and sets.midcast[generalClass] then
			windower.add_to_chat(8,'Equipping Midcast - Nightingale active.'..generalClass)
			equip(sets.midcast[generalClass])
		end
	end

	
	
	
	
	
	-- I couldn't get this part to work.  So I just made sets called sets.precast.FC.BardSong
	--[[
	if spell.name == 'Honor March' then
        	equip({range="Marsyas"})
        else
        	equip(sets.precast.FastCast.BardSong)
	end
	]]--

   -- I dont know why this part is here.  It was in Sammeh's lua
   -- I thought GS would do this automatically.  If you named the sets FC instead of FastCast.  O well.
   elseif string.find(spell.name,'Cur') and spell.name ~= 'Cursna' then
		equip(sets.precast.FastCast.Cure)
   elseif spell.name == 'Stoneskin' then 
		equip(sets.precast.FastCast.Stoneskin)
   else
		equip(sets.precast.FastCast)
   end
	


   -- I added this #3
   -- This is to precast in the right Lullaby horn.
   -- Perhaps the Ghorn equip is redundant.  Since you precast in that anyway.  O well.
   if string.find(spell.name,'Lullaby') then
	if state.LullabyInstrumentMode.value == 'Ghorn' then
		if state.CastingMode.value == 'Resistant' then
			add_to_chat(3,'Lullaby: G-HORN m-acc ***** NOT MAX DURATION!!! *****')
		else
			add_to_chat(3,'Lullaby: G-HORN Max Duration ***** NOT MAX DURATION!!! *****')
		end
		equip({ranged="Gjallarhorn"})
	elseif state.LullabyInstrumentMode.value == 'Daurdabla' then
		if state.CastingMode.value == 'Resistant' then
			add_to_chat(3,'Lullaby: DAUR m-acc ***** NOT MAX DURATION!!! *****')
		else
			add_to_chat(3,'Lullaby: DAUR Duration ***** NOT MAX DURATION!!! *****')
		end
		equip({ranged="Daurdabla"})
	elseif state.LullabyInstrumentMode.value == 'Marsyas' then
		if state.CastingMode.value == 'Resistant' then
			add_to_chat(3,'Lullaby: MARS m-acc ***** NOT MAX DURATION!!! *****')
		else
			add_to_chat(3,'Lullaby: MARS Duration')
		end
		equip({ranged="Marsyas"})
	end
   end

   -- #nottoosoon #2/3
    if spell.action_type == 'Magic' then
        if aftercast_start and os.clock() - aftercast_start < waittime then
            windower.add_to_chat(8,"Precast too early! Adding Delay:"..waittime - (os.clock() - aftercast_start))
            cast_delay(waittime - (os.clock() - aftercast_start))
        end
    end   
   
   
   
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Looks like this is the way they equip the equipment that has song bonuses.
-- This is different than they way other luas I've seen.
-- Other luas would use a set_combine function in the actual gear section.
-- I wonder why they do it this way.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end

    -- You want the Aeonic horn in the midcast for Honor March.
    -- You also want the +1 march gloves on.  This does both.
    if spell.name == 'Honor March' then
        equip(sets.midcast.HonorMarch)
    end

    -- I added this #4
    -- Wonder if there's a better way to do this.
    if string.find(spell.name,'Lullaby') then
	if state.LullabyInstrumentMode.value == 'Ghorn' then
		equip({ranged="Gjallarhorn"})
	elseif state.LullabyInstrumentMode.value == 'Daurdabla' then
		equip({ranged="Daurdabla"})			
	elseif state.LullabyInstrumentMode.value == 'Marsyas' then
		equip({ranged="Marsyas"})
	end
    end
	weathercheck(spell.element)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            add_to_chat(8,'Xtra: FULL')
            equip(sets.midcast.Daurdabla)
        end
    end
	weathercheck(spell.element)
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and not spell.interrupted then
        -- if spell.target and spell.target.type == 'SELF' then
		if spell.target.type ~= 'SELF' and spell.name ~= "Magic Finale" then
            -- adjust_timers(spell, spellMap)
			local dur = calculate_duration(spell, spellMap)
			send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
         end
		state.ExtraSongsMode:reset()
    end

   -- #nottoosoon #3/3
  aftercast_start = os.clock()
  if spell.action_type ~= 'Magic' then
    aftercast_start = nil
  end    
    
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------


function job_buff_change(buff, gain)
        job_update(cmdParams, eventArgs)
        handle_equipping_gear(player.status)
end



-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    handle_equipping_gear(player.status)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','ammo')
        else
            enable('main','sub','ammo')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    -- pick_tp_weapon()
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    local msg = ''
    msg = msg .. 'Xtra: ' .. state.ExtraSongsMode.value    
    --msg = msg .. ',   M: '
    --msg = msg .. state.OffenseMode.value

    --if state.HybridMode.value ~= 'Normal' then
    --    msg = msg .. '/' .. state.HybridMode.value
    --end
    --msg = msg .. ',   WS: ' .. state.WeaponskillMode.value
    msg = msg .. ',   Debuffs: ' .. state.CastingMode.value
    --msg = msg .. ',   Idle: ' .. state.IdleMode.value

    msg = msg .. ',   Lul: ' .. state.LullabyInstrumentMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ',  ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ',  Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ',  Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ',  Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        add_to_chat(8,'Xtra: DUMMY')
    	return 'DaurdablaDummy'
        
    else
        return 'SongEffect'
    end
end


-- Function to create custom buff-remaining timers with the Timers plugin,
-- keeping only the actual valid songs rather than spamming the default
-- buff remaining timers.
function adjust_timers(spell, spellMap)
    if state.UseCustomTimers.value == false then
        return
    end
    
    local current_time = os.time()
    
    -- custom_timers contains a table of song names, with the os time when they
    -- will expire.
    
    -- Eliminate songs that have already expired from our local list.
    local temp_timer_list = {}
    for song_name,expires in pairs(custom_timers) do
        if expires < current_time then
            temp_timer_list[song_name] = true
        end
    end
    for song_name,expires in pairs(temp_timer_list) do
        custom_timers[song_name] = nil
    end
    
    local dur = calculate_duration(spell, spellMap)
    if custom_timers[spell.name] then
		if spell.target.type ~= 'SELF' then
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
		else
			if custom_timers[spell.name] < (current_time + dur) then
				send_command('timers delete "'..spell.name..'"')
				custom_timers[spell.name] = current_time + dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			end
		end
    else
        -- Figure out how many songs we can maintain.
        local maxsongs = 2
        if player.equipment.range == info.ExtraSongInstrument then
            maxsongs = maxsongs + info.ExtraSongs
        end
        if buffactive['Clarion Call'] then
            maxsongs = maxsongs + 1
        end
        -- If we have more songs active than is currently apparent, we can still overwrite
        -- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
        if maxsongs < table.length(custom_timers) then
            maxsongs = table.length(custom_timers)
        end
        
        -- Create or update new song timers.
        if table.length(custom_timers) < maxsongs then
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
        else
            local rep,repsong
            for song_name,expires in pairs(custom_timers) do
                if current_time + dur > expires then
                    if not rep or rep > expires then
                        rep = expires
                        repsong = song_name
                    end
                end
            end
            if repsong then
                custom_timers[repsong] = nil
                send_command('timers delete "'..repsong..'"')
                custom_timers[spell.name] = current_time + dur
                send_command('timers create "'..spell.target..':'..spell.name..'" '..dur..' down')
            end
        end
    end
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spell, spellMap)
    local mult = 1
    if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
    if player.equipment.range == "Marsyas" then mult = mult + 0.5 end
    if player.equipment.main == "Carnwenhan" then mult = mult + 0.5 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.main == "Kali" then mult = mult + 0.05 end
    if player.equipment.sub == "Carnwenhan" then mult = mult + 0.5 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.sub == "Kali" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.neck == "Moonbow Whistle" then mult = mult + 0.2 end
    if player.equipment.neck == "Moonbow Whistle +1" then mult = mult + 0.3 end
    if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.12 end
    if player.equipment.legs == "Inyanga Shalwar +1" then mult = mult + 0.15 end
    if player.equipment.legs == "Inyanga Shalwar +2" then mult = mult + 0.17 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end    
    if player.equipment.feet == "Brioso Slippers +2" then mult = mult + 0.13 end
    if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.15 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == 'Fili Manchettes +1' then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1" then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == 'Brioso Cuffs +1' then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == 'Brioso Cuffs +2' then mult = mult + 0.1 end
    if spellMap == 'Lullaby' and player.equipment.hands == 'Brioso Cuffs +3' then mult = mult + 0.2 end
    if spell.name == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1" then mult = mult + 0.1 end
-- I need to add (and then test) rules to add time for Intarabus's Cape
    
    if MaxJobPoints == 1 then
	mult = mult + 0.05 -- 1200 JP gift: all songs +5% duration
	        -- add_to_chat(8,'Adding Song 5% to Timer for 1200 JP gift') 
    end

    -- Troubador doubling fuction used to be here, but I moved it.


    if spell.name == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end
	

        local generalClass = get_song_class(spell)
	   -- add_to_chat(8,'Info: Spell Name'..spell.name..' Spell Map:'..spellMap..' General Class:'..generalClass..' Multiplier:'..mult)
	if spell.name == "Foe Lullaby II" or spell.name == "Horde Lullaby II" then 
		base = 60
	elseif spell.name == "Foe Lullaby" or spell.name == "Horde Lullaby" then 
		base = 30
	elseif spell.name == "Carnage Elegy" then 
		base = 180
	elseif spell.name == "Battlefield Elegy" then
		base = 120
	elseif spell.name == "Pining Nocturne" then
		base = 120
	elseif spell.name == "Maiden's Virelai" then
		base = 20
		
	end
	
	if generalClass == 'SongEffect' then 
		base = 120
		totalDuration = math.floor(mult*base)		
	end

	add_to_chat(8,'Base: '..base..', Multiplier: '..mult..', Product: '..base*mult)
	
	totalDuration = math.floor(mult*base)		
	
	if MaxJobPoints == 1 then 
		if string.find(spell.name,'Lullaby') then
			add_to_chat(8,'Add 20 seconds for Lullaby Job Points')
			totalDuration = totalDuration + 20
		end
		if buffactive['Clarion Call'] then
			add_to_chat(8,'Add 40 seconds for Clarion Call Job Points')
			totalDuration = totalDuration + 40
		end
		-- Tenuto does not affect Lullaby duration at all.
		-- Therefore, I removed this step from the calculation.
		-- Otherwise, if Tenuto happens to be up when Lullaby is casted, the duration is inaccurate.
		-- if buffactive['Tenuto'] then
			-- add_to_chat(8,'Adding 40 seconds to Timer for Tenuto Job Points')
			-- totalDuration = totalDuration + 40
		-- end
	end


    -- Troubador doubles the 20 second Job Point bonus for Lullaby.
    -- It also doubles the 40 second Job Point bonus for Clarion Call.
    -- It does not double the 20 second Job Point bonus for Tenuto.
    if buffactive.Troubadour then
        totalDuration = totalDuration*2
        add_to_chat(8,'Double duration for Troubadour') 
    end


    	if MaxJobPoints == 1 then 
		if buffactive['Marcato'] then
			add_to_chat(8,'Add 20 seconds for Marcato Job Points')
			-- seems like this does increase sleep duration
			totalDuration = totalDuration + 20
		end
	end

-- My sleep durations for Foe Lullaby II and Horde Lullaby II
-- 2.79 multiplier, 2100 job points
-- 187, 3:07 no JAs
-- 374, 6:14 Troubador
-- 454, 7:34 Troubador and Clarion Call
-- 474, 7:54 Troubador and Clarion call and Marcato

-- Here are my old numbers.  This is when I first used this lua.
-- 2.08 multiplier, 2100 job points
-- 144, 2:24 no JAs
-- 288, 4:48 Troubador
-- 184, 3:04 Clarion Call
-- 368, 6:08 Troubador and Clarion Call
-- 164, 2:44 Marcato
-- 308, 5:08 Troubador and Marcato
-- 204, 3:24 Clarion call and Marcato
-- 388, 6:28 Troubador and Clarion call and Marcato

   totalDurationMinutes = math.floor(totalDuration/60)
   totalDurationSeconds = totalDuration - 60*totalDurationMinutes
    
    if totalDurationSeconds < 10 then
   	add_to_chat(8,'Total Duration: '..totalDuration..' seconds ('..totalDurationMinutes..':0'..totalDurationSeconds..')')
    else
   	add_to_chat(8,'Total Duration: '..totalDuration..' seconds ('..totalDurationMinutes..':'..totalDurationSeconds..')')
    end	

    return totalDuration
	
end


-- Examine equipment to determine what our current TP weapon is.
--[[
function pick_tp_weapon()
    if brd_daggers:contains(player.equipment.main) then
        state.CombatWeapon:set('Dagger')
        
        if S{'NIN','DNC'}:contains(player.sub_job) and brd_daggers:contains(player.equipment.sub) then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    else
        state.CombatWeapon:reset()
        state.CombatForm:reset()
    end
end
]]

-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)    	
	disable_specialgear()
end


function weathercheck(spell_element)
    if spell_element == world.weather_element then
        equip(sets.weather)
        if sets.obi[spell_element] then
            equip(sets.obi[spell_element])
        end
    end
    if spell_element == world.day_element then
        equip(sets.day)
        if sets.obi[spell_element] then
            equip(sets.obi[spell_element])
        end
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
