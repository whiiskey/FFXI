-------------------------------------------------------------------------------------------------------------------
--  BARD GearSwap lua by Whiiskey (Quetz)
-------------------------------------------------------------------------------------------------------------------

--  This lua is based on the original Motenten GearSwap lua.
--  It's two separate files.  This file has all the rules, and a second file has all the gear sets.
--  You can put both files in the Windower4\addons\GearSwap\data folder.

--  It requires all the Mote library files to be in the Windower4\addona\GearSwap\libs folder.
--  It requires the whiiskey-include.lua in the libs folder too.
--  This is available at https://github.com/whiiskey/FFXI/blob/master/whiiskey-include.lua



-------------------------------------------------------------------------------------------------------------------
--  FEATURES:
-------------------------------------------------------------------------------------------------------------------
--  ExtraSongMode.  Helps you apply the third and fourth songs.  Cycle with Control `.  See desription below.
--  When Nightingale is active, the equipping of precast gear is skipped.  With 5/5 merits, all songs are insta-cast,
--    and fast cast gear is not needed.
--  Custom timers.  This lua calculates duration of songs and sends that information to the timers plugin.  This is
--    most important for sleeping mobs on fights like Vinipata, Albumen, Tumult Curator, and Unafraid of the Dark.
--    It's not so important for the other songs.
--  Information about duration of songs is reported in the chat log.  If you want to see less information, then
--    cycle the ReportSongInfo mode with Windows F12.
--  Lullaby instrument mode.  Choose which instrument you want to use for Lullaby.  Marsyas has longest duration.
--    G-horn has most magic accuracy.  Daurdabla has the largest area-of-effect on Horde Lullaby.  Cycle with Alt `.
--  Lullaby idlde mode lets you idle in Lullaby midcast gear.  Why is this useful?  Because every once in a while,
--    when you finish casting your spell, you're not actually in midcast gear!  I can't tell you for sure why this
--    happens (people blame packet loss), but when it does, you don't get the midcast gear's beneficial stats like
--    Song Duration.  If the mobs wake up earler than you expect, it can ruin your run.  If you idle in Lullaby gear
--    there's a higher chance you'll actually be in midcast gear when the spell completes.  Note that if you idle in
--    Lullaby midcast gear and activate Nightingale (which skeps precast gear), then you don't actually swap any gear.
--    Even if packet loss occurs, your Lullaby songs still have full duration.
--  There are many aliases for various gear sets.  Aliaases specific to this job are defined in this file.  More
--    general aliases are defined in the whiiskey-inlcude.lua file.
--  The gear sets in this lua have the same format as the //gs export command.  This makes it easy to copy and paste
--    your gear into this lua.
--    1) Equip the gear you want to use for a certain set
--    2) Type //gs export
--    3) Open the newest file in Windower4\addons\GearSwap\data\export folder
--    4) Copy your geasr from that file, paste it into the lua file with all the gear sets
--    5) Save the lua file and type //gs r to reload the new file
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  EXTRA SONG MODE:
-------------------------------------------------------------------------------------------------------------------
--  ExtraSongsMode may take one of three values: None, Dummy, FullLength

--  You can set these via the standard 'set' and 'cycle' self-commands.  EG:
--  gs c cycle ExtraSongsMode
--  gs c set ExtraSongsMode Dummy

--  Alternatively, you can cycle through the ExtraSongMode options with Control`.

--  The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
--  The FullLength state will simply equip the bonus song instrument on top of standard gear. 

--  Simple macro to cast a dummy Daurdabla song:
--  /console gs c set ExtraSongsMode Dummy
--  /ma "Shining Fantasia" <me>

--  To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
--  'Terpander', and info.ExtraSongs to 1.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  KEY FUNCTIONS:
-------------------------------------------------------------------------------------------------------------------
--    Control F9: cycle Hybrid Mode.  Not used in this lua.
--            F9: cycle melee accuracy.
--    Windows F9: cycle WS Mode.  Not used in this lua.
--        Alt F9: cycle Ranged Mode.  Not used in this lua.
--           F10: activate Physical Defense mode
--   Control F10: cycle Physical Defense modes
--       Alt F10: toggle Kiting
--           F11: activate Magical Defense mode
--   Control F11: cycle Casting modes.  Determines which gear set to use for song debuffs.
--           F12: status report.  Displays values for selected state variables.
--   Control F12: cycle idle mode
--       Alt F12: cancel Defense mode
--   Windows F12: cycle ReportSongInfo.  Choose to see all, some, or none of the duration info in the chatlog.
--     Control `: cycle Extra Songs mode
--         Alt `: cycle Lullaby Instrument mode
--     Control -: cycle NPC target mode.  I don't understand this. 
--     Control =: cycle PC target mode.  I don't understand this either.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  RESOURCES:
-------------------------------------------------------------------------------------------------------------------
--  Shortcuts lua.  Get it through Windower.  Very useful for bard.  You can see my data file (aliases.xml) here:
--    https://github.com/whiiskey/FFXI/blob/master/shortcuts%20data
--  Timers lua.  Get it through Windower.  I prefer slim mode.  Also make sure custom timers are active.
--  Sleeper lua.  Written by Sammeh.  Very useful for bard on fights like Vinipata.
--    Sammeh's original version: https://github.com/SammehFFXI/FFXIAddons/tree/master/Sleeper
--    I prefer my version (his version with minor edits): https://github.com/whiiskey/FFXI/blob/master/sleeper.lua
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  TODO:
-------------------------------------------------------------------------------------------------------------------
--  If waiting on recast, dont report Too Soon!
--  Add song info mode
--  Change FastCast to FC, this matches Kinematic's original format
--  RE-look at cure set.  Look at the set I put in the blm lua
--  Notification to switch to Lullaby idle mode if you cast Lullaby when Nightengale is active
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')

    -- #nottoosoon #1/4
    include('whiiskey_include.lua')
    
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
    state.LullabyInstrumentMode =M{['description']='Lullaby Instrument', 'Marsyas', 'Ghorn', 'Daurdabla'}
    state.ReportSongInfo = M{['description']='Report Song Info', 'Full', 'Some', 'None'}
    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	
	send_command("alias buff gs equip sets.midcast.SongEffect")
	send_command("alias dummy gs equip sets.midcast.DaurdablaDummy")
        send_command("alias debuff gs equip sets.midcast.SongDebuff")
        send_command("alias debuffacc gs equip sets.midcast.ResistantSongDebuff")
	send_command("alias lul gs equip sets.midcast.LullabyFull")
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
    send_command('bind !` gs c cycle LullabyInstrumentMode')
    send_command('bind @f12 gs c cycle ReportSongInfo')

    select_default_macro_book()
    --send_command('@wait 1;input /lockstyleset 40')

    -- #nottoosoon code #2/4
    -- 2.6 to be risky.  2.7 to play it safe
    waittime = 2.7

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @f12')
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------


function job_pretarget(spell)    

    -- #nottoosoon #3/4
    checkblocking(spell)
        --add_to_chat(8,got_blocked.value)
        ----if not got_blocked then
	    if spell.action_type == 'Magic' then
	    	if aftercast_start and os.clock() - aftercast_start < waittime then
            		windower.add_to_chat(8,"Too soon!  Adding delay: " .. 0.01 * math.floor(100*(waittime - (os.clock() - aftercast_start))) .. " seconds")
            		cast_delay(waittime - (os.clock() - aftercast_start))
            	end
            end 
        --end
     --end
     -- #keep_warp_ring #1/2
     handle_equipping_gear(player.status)

end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
-- This makes sure that when Nightengale is up, we dont use a precast set.  Midcast only.
function job_precast(spell, action, spellMap, eventArgs)
    -- handle_equipping_gear(player.status)
    checkblocking(spell)
    
  if state.ReportSongInfo.value ~= 'None' then
    if string.find(spell.name,'Lullaby') then
	if state.LullabyInstrumentMode.value == 'Marsyas' and state.CastingMode.value == "Duration" and not spell.interrupted then
  	    add_to_chat(3,'LULLABY,  Marsyas,  Duration')
	elseif not spell.interrupted then
  	    add_to_chat(3,'LULLABY,  '..state.LullabyInstrumentMode.value..',  '..state.CastingMode.value..'    **NOT MAX DURATION!**')
	end
    end
  end
    
    if spell.type == 'BardSong' then
       if buffactive.Nightingale then
           local generalClass = get_song_class(spell)
           if generalClass and sets.midcast[generalClass] then
               if state.ReportSongInfo.value ~= 'None' then
                   windower.add_to_chat(3,'NIGHTINGALE, skipping precast, '..generalClass..' gear')
               end
               equip(sets.midcast[generalClass])
	    end
	end
    end	
    

    
    
end



function job_post_precast(spell, action, spellMap, eventArgs)
   if string.find(spell.name,'Lullaby') then
	if state.LullabyInstrumentMode.value == 'Ghorn' then
	    equip({ranged="Gjallarhorn"})
	else
	    equip({ranged=state.LullabyInstrumentMode.value})
	end


    end

    if spell.name == 'Honor March' then
        equip({range="Marsyas"})
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
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'Dummy' then
            add_to_chat(8,'Xtra: DUMMY')
        end
        if state.ExtraSongsMode.value == 'FullLength' then
            add_to_chat(8,'Xtra: FULL')
            equip(sets.midcast.Daurdabla)
        end
    end

    if string.find(spell.name,'Lullaby') then
	if state.LullabyInstrumentMode.value == 'Ghorn' then
	    equip({ranged="Gjallarhorn"})
	else
	    equip({ranged=state.LullabyInstrumentMode.value})
	end
    end
    
    -- This is probably redundant.  Might take it out someday.
    if spell.name == 'Honor March' then
        equip({range="Marsyas"})
    end    

end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and not spell.interrupted then
    


        
        if spell.target.type ~= 'SELF' and spell.name ~= "Magic Finale" then
            -- adjust_timers(spell, spellMap)
			local dur = calculate_duration(spell, spellMap)
			send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
	elseif spell.name ~= "Magic Finale" then
	    calculate_duration(spell, spellMap)
        end
        state.ExtraSongsMode:reset()
    end

    -- #nottoosoon #4/4
    aftercast_start = os.clock()
    if spell.action_type ~= 'Magic' then
      aftercast_start = nil
    end   
    
end






-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- #keep_warp_ring #2/2
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(playerStatus, eventArgs)
	local lockables = T{'Mecisto. Mantle', 'Aptitude Mantle', 'Nexus Cape', 'Aptitude Mantle +1', 'Warp Ring', 'Vocation Ring', 'Reraise Earring', 'Capacity Ring', 'Trizek Ring', 'Echad Ring', 'Facility Ring', 'Dim. Ring (Holla)', 'Dim. Ring (Dem)', 'Dim. Ring (Mea)'}
	local watch_slots = T{'lear','rear','ring1','ring2','back','head'}

	for _,v in pairs(watch_slots) do
		if lockables:contains(player.equipment[v]) then
			disable(v)
			if has_charges(player.equipment[v]) and (not is_enchant_ready(player.equipment[v])) then
				enable(v)
			end
		else
			enable(v)
		end
	end
end



-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
        job_update(cmdParams, eventArgs)
        handle_equipping_gear(player.status)
end

-- I might take this out.  IDK
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
    msg = msg .. ',    ' .. state.CastingMode.value

    msg = msg .. ',    Lul: ' .. state.LullabyInstrumentMode.value

    msg = msg .. ',    Idle: ' .. state.IdleMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ',    Def: ' .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end
    
    if state.Kiting.value == true then
        msg = msg .. ',    Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ',    Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ',    Target NPCs'
    end

    add_to_chat(123, msg)

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
    if player.equipment.neck == "Mnbw. Whistle +1" then mult = mult + 0.3 end
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

-- Total multiplier 2.89: base 1, main 0.5, instrument 0.4, neck 0.3, body 0.12, hands 0.2, legs 0.17, feet 0.15, gift 0.05


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
	

        -- Interesting to note that this function is not called for Finale or Honor March.  Maybe others who knows!
        local generalClass = get_song_class(spell)
	   --add_to_chat(8,'Spell Name: '..spell.name..', Spell Map: '..spellMap..', General Class: '..generalClass..', Multiplier: '..mult)
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
		
	-- Actually the "Song effect duration" gear like Brioso Slippers doesn't make Virelai last longer.
	-- However "All songs +" gear like G-horn and Moonbow Whistle +1 make it last longer.
	-- So with Virelai +7 lasts 51 seconds.
	-- This timer doesn't account for that, but oh well.  Virelai isn't a common song.
	elseif spell.name == "Maiden's Virelai" then
		base = 30
		
	end
	
	-- Error in Mote's original lua.
	-- It didn't establish a base value for the 'DaurdablaDummy' generalClass.
	-- Original line was:
	-- if generalClass == 'SongEffect' then
	-- I added the 'DaurdablaDummy' part
	if generalClass == 'SongEffect' or 'DaurdablaDummy' then 
		base = 120
		totalDuration = math.floor(mult*base)		
	end
	
	if state.ReportSongInfo.value == 'Full' then
	    add_to_chat(8,'Base: '..base..', Multiplier: '..mult..', Product: '..base*mult)
	end
	
	totalDuration = math.floor(mult*base)		
	
	if MaxJobPoints == 1 then 
		if string.find(spell.name,'Lullaby') then
		    if state.ReportSongInfo.value == 'Full' then
			add_to_chat(8,'Add 20 seconds for Lullaby Job Points')
		    end
			totalDuration = totalDuration + 20
		end
		if buffactive['Clarion Call'] then
		    if state.ReportSongInfo.value == 'Full' then
			add_to_chat(8,'Add 40 seconds for Clarion Call Job Points')
		    end
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
        if state.ReportSongInfo.value == 'Full' then
            add_to_chat(8,'Double duration for Troubadour')
        end
    end


    	if MaxJobPoints == 1 then 
		if buffactive['Marcato'] then
			if state.ReportSongInfo.value == 'Full' then
			    add_to_chat(8,'Add 20 seconds for Marcato Job Points')
			end
			-- seems like this does increase sleep duration
			totalDuration = totalDuration + 20
		end
	end

   totalDurationMinutes = math.floor(totalDuration/60)
   totalDurationSeconds = totalDuration - 60*totalDurationMinutes
    
   if state.ReportSongInfo.value ~= 'None' then
    if totalDurationSeconds < 10 then
   	add_to_chat(8,'Total Duration: '..totalDuration..' seconds ('..totalDurationMinutes..':0'..totalDurationSeconds..')')
    else
   	add_to_chat(8,'Total Duration: '..totalDuration..' seconds ('..totalDurationMinutes..':'..totalDurationSeconds..')')
    end	
   end

    return totalDuration
	
end


-- Examine equipment to determine what our current TP weapon is.
--[[wea
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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
