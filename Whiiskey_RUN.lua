-------------------------------------------------------------------------------------------------------------------
--  RUN GearSwap lua by Whiiskey (Quetz).
--  This lua is based on the Kinematics template and uses Motenten functions.
--  It was later modified by Raesvelg and Orestes.
--  Then I customized it to my playstyle.
-------------------------------------------------------------------------------------------------------------------


     
-------------------------------------------------------------------------------------------------------------------
--  FEATURES:
-------------------------------------------------------------------------------------------------------------------
--  Several different options for defense sets.  See list below.
--  Many aliases to equip the different sets.  Good for making sure the gear is in your inventory.  Good for
--    showing your sets to other people.  See alias commands below.
--  If you activate defense mode (push F10 or F11), the midcast phase for spells is skipped.  You briefly swap
--    into precast gear then you swap back into defense gear.  This eliminates the chance that you "get caught
--    in midcast gear" when taking damage.  Very useful at times.  If you prefer to use the normal midcast gear
--    for your spells, then use Control F9 to select your set instead of F10 or F11.  
--  Checks for vorseal buffs (extra 3-6 DT) and the Refined Grip +1 (extra 3 DT).  These may cause you to be
--    over-capped on DT.  If detected, the lua automatically uses modified versions of the defense sets.  This
--    allows you to swap out the unneeded DT gear for other more useful gear.
--  Capacity mode for using the capacity cape.  I disabled this because I'm capped on capacity points.
--  The lua is 2 seprate files: one for the rules (this file), and one for the gear sets (separate file).
--  The gear sets are formatted just like output from the //gs export command.  This makes it easy to insert
--    your gear into the lua.  Just use the //gs export command then copy and paste.

-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--    DEFENSE SETS
-------------------------------------------------------------------------------------------------------------------

--    DTdef: capped DT, as much defense and VIT as possible.  Great for large pulls in Omen or Dynamis Divergence.
--    Parry: capped DT, Turms hands, Turms feet.
--    Hybrid: capped DT and as many DD stats as possible.
--    DThp: capped DT and as much HP as possible.  Potentially useful if you can't run from Dancing Fullers.
--    MaxHP: as much HP as possihble.
--    MDT26: roughly 26 MDT (Shell V is about 24) and magic defense stats: mdef, meva, Shadow Ring.
--    MDT50: 50 MDT from gear alone.  Use when Shell V is down.
--    meva: as much magic evasion as possible.

--    I don't regularly use all these sets, but they're here if I need them.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  KEY FUNCTIONS:
-------------------------------------------------------------------------------------------------------------------
--    Control F9: toggle Hybrid Mode.  Use it to choose your defense set.  Or choose the DD option.
--            F9: toggle melee accuracy.  Only has an effect when hybrid mode is set to DD.
--    Windows F9: toggle WS Mode.
--        Alt F9: toggle Ranged Mode.  Not used in this lua.
--           F10: activate Physical Defense mode
--   Control F10: toggle Physical Defense modes
--       Alt F10: toggle Kiting
--           F11: activate Magical Defense mode
--   Control F11: toggle Casting modes.  Not used in this lua.
--       Alt F11: toggle Magical Defense modes
--           F12: status report for which modes are active
--   Control F12: toggle idle mode
--       Alt F12: cancel Defense mode
--     Control -: toggle Runes
--         Alt -: use Rune Enhancement job ability
--     Control =: toggle Treasure Hunter mode
--         Alt =: toggle Capacity Mode.  I disabled this.
--     Control `: use Valiance job ability
--         Alt `: use Vallation job ability
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
--  TODO:
-------------------------------------------------------------------------------------------------------------------
--  Get TP3000 earring rule functional
--  Upgrade gear: Turms hands +1 and feet +1, relic head +3
--  Get better augments on hybrid herc hands and DD herc body
--  Figure out how to automatically equip doom set when doom lands
--  Get embolden gear to be worn at the right time.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end


function job_setup()

    include('Mote-TreasureHunter')

    -- Table of entries
    rune_timers = T{}
    -- entry = rune, index, expires
    
    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
	
    state.Buff.Doom = buffactive.Doom or false	
    state.CapacityMode = M(false, 'Capacity Point Mantle')

    send_command("alias af1 gs equip sets.af1")
    send_command("alias af2 gs equip sets.af2")
    send_command("alias af3 gs equip sets.af3")
    send_command("alias ambus1 gs equip sets.ambus1")
    send_command("alias ambus2 gs equip sets.ambus2")
    send_command("alias turms gs equip sets.Turms")
    send_command("alias naked gs equip naked")
    
    send_command("alias tp gs equip sets.engaged")
    send_command("alias ws gs equip sets.precast.WS")
    send_command("alias wsacc gs equip sets.precast.WS.Acc")
    send_command("alias wsdim gs equip sets.precast.WS.Dimidiation")
    send_command("alias wsres gs equip sets.precast.WS.Resolution")
    
    send_command("alias enm gs equip sets.enmity")
    send_command("alias mab gs equip sets.mab")
    send_command("alias fast gs equip sets.precast.FC")
    send_command("alias flmid gs equip sets.midcast.Flash")
    send_command("alias phmid gs equip sets.midcast.Phalanx")
    send_command("alias waltz gs equip sets.precast.Waltz")
    send_command("alias cur gs equip sets.midcast.Cure")
    send_command("alias th gs equip sets.TreasureHunter")
    
    send_command("alias pdt gs equip sets.defense.DTdef")    
    send_command("alias pdtg gs equip sets.defense.DTdef.DTGrip")  
    send_command("alias parry gs equip sets.defense.Parry")
    send_command("alias parryg gs equip sets.defense.Parry.DTGrip")
    send_command("alias hybrid gs equip sets.defense.Hybrid")  
    send_command("alias hybridg gs equip sets.defense.Hybrid.DTGrip")
    send_command("alias dthp gs equip sets.defense.DThp")    
    send_command("alias dthpg gs equip sets.defense.DThp.DTGrip")    
    send_command("alias maxhp gs equip sets.defense.MaxHP")
    send_command("alias mdt26 gs equip sets.defense.MDT26")
    send_command("alias mdt50 gs equip sets.defense.MDT50")
    send_command("alias md gs equip sets.defense.MDT50")
    send_command("alias meva gs equip sets.defense.meva")
    send_command("alias mevad gs equip sets.defense.mevad")
    send_command("alias meval gs equip sets.defense.meval")
    send_command("alias mevab gs equip sets.defense.mevab")
    send_command("alias mevat gs equip sets.defense.mevat")
    send_command("alias doom gs equip sets.buff.Doom")    

end


function user_setup()

    state.Runes = M{['description']='Runes', "Lux","Tenebrae","Ignis","Unda","Sulpor","Tellus","Flabra","Gelus"}
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal')
    state.HybridMode:options('DTdef','Hybrid','Parry','DD')
    state.WeaponskillMode:options('Normal','Acc')
    state.CastingMode:options('Normal')
    state.IdleMode:options('DTdef','Regen','Refresh')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('DTdef','Parry','Hybrid')
    state.MagicalDefenseMode:options('MDT26','MDT50','meva')
	
    -- This is used to check for weapons in the off-hand.  I don't use it and will eventually delete it.
    run_sub_weapons = S{"Usonmunku", "Anahera Sword", "Vampirism", "Fettering Blade", "Flyssa +1", "Flyssa", "Firangi", "Reikiko"}
    update_combat_form()

    send_command('bind ^` input /ja "Valiance" <me>')
    send_command('bind !` input /ja "Vallation" <me>')	
    --send_command('bind != gs c toggle CapacityMode')
    send_command('bind !- gs c rune')
    send_command('bind ^- gs c cycle Runes')
    send_command('bind ^= gs c cycle treasuremode')
    
    select_default_macro_book()
    
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()

	send_command('unbind ^`')
	send_command('unbind !`')
	--send_command('unbind !=')
	send_command('unbind !-')
	send_command('unbind ^-')
	send_command('unbind ^=')
	
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------


-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)

	if spell.english == 'Lunge' or spell.english == 'Swipe' then
            if LastRune == 'Tenebrae' then
                equip(sets.precast.JA['Lunge'],{head="Pixie Hairpin +1"})
            end
        end
		
    if spell.type == 'WeaponSkill' then
        if state.CapacityMode.value then
            equip(sets.CapacityMantle)
        end
	if player.tp == 3000 then
            equip(sets.precast.MaxTP)
        end
    end
end



-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    -- I think Orestes wrote the following comment.  I'm not quite sure why we have to exclude Job Abilities.
    --
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
        handle_equipping_gear(player.status)
        eventArgs.handled = true
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        local obi = get_obi(get_rune_obi_element())
        if obi then
            equip({waist=obi})
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell)
    if not spell.interrupted then
        if spell.type == 'Rune' then
            update_timers(spell)
        elseif spell.name == "Lunge" or spell.name == "Gambit" or spell.name == 'Rayke' then
            reset_timers()
        elseif spell.name == "Swipe" then
            send_command(trim(1))
        end
    end
	
	if spell.type=="Rune" then
		LastRune = spell.english
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

    if state.IdleMode.value == 'Refresh' and player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    if state.IdleMode.value == 'DTdef' and state.DefenseMode.value == 'None' then
        if player.equipment.sub == "Refined Grip +1" or buffactive.Vorseal then
            idleSet = sets.defense.DTdef.DTGrip
        end
        if player.equipment.sub == "Refined Grip +1" and buffactive.Vorseal then
            add_to_chat(8,'Vorseal active!  Use Utu grip!')
        end
    end

    if state.CapacityMode.value then
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end
    
    if buffactive.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end    
    
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)

    if state.HybridMode.value ~= 'DD' and state.DefenseMode.value == 'None' then
        if player.equipment.sub == "Refined Grip +1" or buffactive.Vorseal then
            meleeSet = sets.defense[state.HybridMode.value].DTGrip
        end
        if player.equipment.sub == "Refined Grip +1" and buffactive.Vorseal then
            add_to_chat(8,'Vorseal active!  Use Utu grip!')
        end
    end
    
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
	
    if buffactive.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end    
    
    return meleeSet
end


-- Modify the default defense set after it was constructed.
function customize_defense_set(defenseSet)

    if state.DefenseMode.value == 'Physical' then
        if player.equipment.sub == "Refined Grip +1" or buffactive.Vorseal then
            defenseSet = sets.defense[state.PhysicalDefenseMode.value].DTGrip
        end
        if player.equipment.sub == "Refined Grip +1" and buffactive.Vorseal then
            add_to_chat(8,'Vorseal active!  Use Utu grip!')
        end
    end    

    if buffactive.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
    
    return defenseSet
end


function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
	if not midaction() then
	    handle_equipping_gear(player.status)
	end
    end

    -- This doesn't work like it should and I don't know why.
    if buff == "Doom" and gain then
        equip(sets.buff.Doom)
        add_to_chat(8,'Gained buff Doom.')        
    end
    
    --[[
    -- I used this code to help troubleshoot why the above code doesn't work.
    -- It will recognize when Phalanx is applied but not doom.  Drat.
    if buff == "Phalanx" and gain then
        add_to_chat(8,'Phalanx gained')    
    end    
    if buff == "Phalanx" and not gain then
        add_to_chat(8,'Phalanx lost')    
    end
    ]]--    
    
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    end
end

-- I added this, copied it from the thf lua on 12/22/2017.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee: '
    
    --if state.CombatForm.has_value then
    --    msg = msg .. ' (' .. state.CombatForm.value .. ')'
    --end
    
    --msg = msg .. ': '
    
    msg = msg .. state.HybridMode.value
    if state.HybridMode.value == 'DD' then
        msg = msg .. '/' .. state.OffenseMode.value
    end
    --msg = msg .. ',  WS: ' .. state.WeaponskillMode.value
    msg = msg .. ',    Idle: ' .. state.IdleMode.value
    
    if state.DefenseMode.value == 'Physical' then
        msg = msg .. ',    PDTMode: ' .. state.PhysicalDefenseMode.value
    elseif state.DefenseMode.value == 'Magical' then
        msg = msg .. ',    MDTMode: ' .. state.MagicalDefenseMode.value    
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
    
    --[[
    if buffactive.Phalanx then
        msg = msg .. ',   Phalanx active'
    end
    
    if buffactive.Doom then
        msg = msg .. ',   Doom active'
    end
    ]]--

    --msg = msg .. ',  TH: ' .. state.TreasureMode.value

    add_to_chat(123, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
-- Check for H2H or single-wielding
    if (player.sub_job == 'NIN' or player.sub_job == 'DNC') and run_sub_weapons:contains(player.equipment.sub) then
		state.CombatForm:set('DW')
	else
		state.CombatForm:reset()
	end
end



-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(8, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 12)
	elseif player.sub_job == 'SAM' then
		set_macro_page(7, 12)
	elseif player.sub_job == 'BLU' then
		set_macro_page(6, 12)
	else
		set_macro_page(9, 12)
	end
end

function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']
    
    local found_rune_element
    
    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end
    
    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end


------------------------------------------------------------------
-- Timer manipulation
------------------------------------------------------------------

-- Add a new run to the custom timers, and update index values for existing timers.
function update_timers(spell)
    local expires_time = os.time() + 300
    local entry_index = rune_count(spell.name) + 1

    local entry = {rune=spell.name, index=entry_index, expires=expires_time}

    rune_timers:append(entry)
    local cmd_queue = create_timer(entry).. ';wait 0.05;'
    
    cmd_queue = cmd_queue .. trim()

    send_command(cmd_queue)
end

-- Get the command string to create a custom timer for the provided entry.
function create_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    local duration = entry.expires - os.time()
    return 'timers c ' .. timer_name .. ' ' .. tostring(duration) .. ' down'
end

-- Get the command string to delete a custom timer for the provided entry.
function delete_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    return 'timers d ' .. timer_name .. ''
end

-- Reset all timers
function reset_timers()
    local cmd_queue = ''
    for index,entry in pairs(rune_timers) do
        cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
    end
    rune_timers:clear()
    send_command(cmd_queue)
end

-- Get a count of the number of runes of a given type
function rune_count(rune)
    local count = 0
    local current_time = os.time()
    for _,entry in pairs(rune_timers) do
        if entry.rune == rune and entry.expires > current_time then
            count = count + 1
        end
    end
    return count
end

-- Remove the oldest rune(s) from the table, until we're below the max_runes limit.
-- If given a value n, remove n runes from the table.
function trim(n)
    local cmd_queue = ''

    local to_remove = n or (rune_timers:length() - max_runes)

    while to_remove > 0 and rune_timers:length() > 0 do
        local oldest
        for index,entry in pairs(rune_timers) do
            if oldest == nil or entry.expires < rune_timers[oldest].expires then
                oldest = index
            end
        end
        
        cmd_queue = cmd_queue .. prune(rune_timers[oldest].rune)
        to_remove = to_remove - 1
    end
    
    return cmd_queue
end

-- Drop the index of all runes of a given type.
-- If the index drops to 0, it is removed from the table.
function prune(rune)
    local cmd_queue = ''
    
    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
            entry.index = entry.index - 1
        end
    end

    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            if entry.index == 0 then
                rune_timers[index] = nil
            else
                cmd_queue = cmd_queue .. create_timer(entry) .. ';wait 0.05;'
            end
        end
    end
    
    return cmd_queue
end


------------------------------------------------------------------
-- Reset events
------------------------------------------------------------------

windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
windower.raw_register_event('status change',function(new, old)
    if gearswap.res.statuses[new].english == 'Dead' then
        reset_timers()
    end
end)


