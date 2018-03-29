
	


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')

    -- #nottoosoon #1/4
    include('whiiskey_checkblocking.lua')

end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    send_command("alias fast gs equip sets.precast.FC")
    send_command("alias faste gs equip sets.precast.FC['Elemental Magic']")
    send_command("alias fastc gs equip sets.precast.FC.Cure") 
    
    send_command("alias mb gs equip sets.mb.macc1")
    send_command("alias mb1 gs equip sets.mb.macc1")
    send_command("alias mb3 gs equip sets.mb.macc3")
    send_command("alias mb5 gs equip sets.mb.macc5")    
    send_command("alias mbb1 gs equip sets.mb.mabbody.macc1")
    send_command("alias mbb3 gs equip sets.mb.mabbody.macc3")
    send_command("alias mbb5 gs equip sets.mb.mabbody.macc5")
    send_command("alias nuke gs equip sets.midcast['Elemental Magic']")
    send_command("alias nuke1 gs equip sets.nuke.macc1")
    send_command("alias nuke2 gs equip sets.nuke.macc2")
    send_command("alias nuke3 gs equip sets.nuke.macc3")
    send_command("alias nuke5 gs equip sets.nuke.macc5")
    send_command("alias occult gs equip sets.midcast['Elemental Magic'].StoreTP")
    send_command("alias asp gs equip sets.midcast.Aspir")
    send_command("alias maxmp gs equip sets.precast.WS.Myrkr")
    send_command("alias cur gs equip sets.midcast.Cure")
    send_command("alias enf gs equip sets.midcast['Enfeebling Magic']")

    
    send_command("alias tp gs equip sets.engaged.Acc")

    send_command("alias af1 gs equip sets.af1")
    send_command("alias naked gs equip naked")


send_command('alias revit input /item "Super Revitalizer" <me>')
send_command('alias pot1 input /item "Lucid Potion I" <me>')
send_command('alias pot2 input /item "Lucid Potion II" <me>')
send_command('alias pot3 input /item "Lucid Potion III" <me>')
send_command('alias eth1 input /item "Lucid Ether I" <me>')
send_command('alias eth2 input /item "Lucid Ether II" <me>')
send_command('alias eth3 input /item "Lucid Ether III" <me>')
send_command('alias elixir1 input /item "Lucid Elixir I" <me>')
send_command('alias elixir2 input /item "Lucid Elixir II" <me>')
send_command('alias wings1 input /item "Lucid Wings I" <me>')
send_command('alias wings2 input /item "Lucid Wings II" <me>')
send_command('alias manamist input /item "Mana Mist" <me>')
send_command('alias hpmist input /item "Healing Mist" <me>')
send_command('alias megalixir input /item "Megalixir" <me>')
send_command('alias cat input /item "Catholicon" <me>')
send_command('alias cat1 input /item "Catholicon +1" <me>')
send_command('alias echodrop input /item "Echo Drops" <me>')
send_command('alias remedy input /item "Remedy" <me>')
send_command('alias holywater input /item "Holy Water" <me>')
send_command('alias warpring input /equip ring1 "Warp Ring"')    
    
send_command('alias tempss input /console sparks buyalltemps')    
    
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Death', 'Acc')  --F9
    --state.CastingMode:options('Damage','StoreTP','ProcNaked','Proc119')  -- Alt F11
    state.CastingMode:options('Damage','StoreTP')  -- Alt F11
    state.IdleMode:options('Death', 'Regen')  -- Control F12
    state.MagicBurst = M{"FreeNuke","MB"}  -- Control F11
    state.MagicAccuracy = M{'LOW','MED','HIGH'}  -- Windows F11
    state.ManaWallSwaping = M{'locked','unlocked'}
    state.NukingBody = M{'MP','MAB'}
    
    -- Additional local binds
    -- The ^ is control, ! is alt, @ is windows key.
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind ^f9 gs c cycle NukingBody')
    send_command('bind !f9 gs c cycle ManaWallSwaping')
    send_command('bind ^f11 gs c cycle MagicBurst')
    send_command('bind @f11 gs c cycle MagicAccuracy')
    send_command('bind !f11 gs c cycle CastingMode')
        
    select_default_macro_book()

    -- #nottoosoon code #2/4
    -- 2.6 to be risky.  2.7 to play it safe
    waittime = 2.7
    
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind ^f11')
    send_command('unbind @f11')
    send_command('unbind !f11')
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
-- I don't really understand all this.  Maybe one day I will.
-- There's some old gear here, but I just left it.  Doesn't seem to mess anything up.
-- Looks like this was an Obi rule?  I took it out.  The LUA still complied ok.  2/16/2018.
--[[
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Cetl Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end
]]--

-- #nottoosoon #3/4
-- Make sure to add this at the top:
-- include('whiiskey_checkblocking.lua')
function job_pretarget(spell)    
    checkblocking(spell)
	    if spell.action_type == 'Magic' then
	    	if aftercast_start and os.clock() - aftercast_start < waittime then
            		windower.add_to_chat(8,"Too soon!  Adding delay: " .. 0.01 * math.floor(100*(waittime - (os.clock() - aftercast_start))) .. " seconds")
            		cast_delay(waittime - (os.clock() - aftercast_start))
            	end
            end 
end


-- I'm adding this and testing.  2/19/2018.
function job_precast(spell, action, spellMap, eventArgs)
    if state.ManaWallSwaping.value == 'unlocked' and buffactive['Mana Wall'] then
        enable('back')
        enable('feet')
        add_to_chat(8,'----- Back/Feet unlocked for casting (Alt-F9) -----')
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.self_healing)
        add_to_chat(8,'----- Self Cure Set Equipped -----')
    end

    if spell.skill == 'Elemental Magic' and spell.name ~= "Impact" and spellMap ~= 'ElementalEnfeeble' then

      if state.CastingMode.value == 'StoreTP' then
          equip(sets.midcast['Elemental Magic'].StoreTP)
          add_to_chat(8,'----- StoreTP casting mode -----')
      elseif state.CastingMode.value == 'ProcNaked' then    
          equip(sets.midcast['Elemental Magic'].ProcNaked)
          add_to_chat(8,'----- ProcNaked casting mode -----')
      elseif state.CastingMode.value == 'Proc119' then
          equip(sets.midcast['Elemental Magic'].Proc119)
          add_to_chat(8,'----- Proc119 casting mode -----')
      else
        if state.MagicBurst.value == 'MB' then
            if state.MagicAccuracy.value == 'HIGH' then
              if state.NukingBody.value == 'MP' then
                equip(sets.mb.macc5)
                add_to_chat(8,'----- MB ----- HIGH macc -----')
              else
                equip(sets.mb.mabbody.macc5)
                add_to_chat(8,'----- MB ----- HIGH macc ----- No MP Return! (Ctrl-F9)')              
              end
            elseif state.MagicAccuracy.value == 'MED' then
              if state.NukingBody.value == 'MP' then
                equip(sets.mb.macc3)
                add_to_chat(8,'----- MB ----- MED macc -----')
              else
                equip(sets.mb.mabbody.macc3)
                add_to_chat(8,'----- MB ----- MED macc ----- No MP Return! (Ctrl-F9)')              
              end
            else
              if state.NukingBody.value == 'MP' then
                equip(sets.mb.macc1)
                add_to_chat(8,'----- MB ----- LOW macc -----')
              else
                equip(sets.mb.mabbody.macc1)
                add_to_chat(8,'----- MB ----- LOW macc ----- No MP Return! (Ctrl-F9)')              
              end
            end
        else
            if state.MagicAccuracy.value == 'HIGH' then
              if state.NukingBody.value == 'MP' then
                equip(sets.nuke.macc5)
                add_to_chat(8,'----- FreeNuke ----- HIGH macc -----')
              else
                equip(sets.nuke.mabbody.macc5)
                add_to_chat(8,'----- FreeNuke ----- HIGH macc ----- No MP Return! (Ctrl-F9)')              
              end
            elseif state.MagicAccuracy.value == 'MED' then
              if state.NukingBody.value == 'MP' then
                equip(sets.nuke.macc3)
                add_to_chat(8,'----- FreeNuke ----- MED macc -----')
              else
                equip(sets.nuke.mabbody.macc3)
                add_to_chat(8,'----- FreeNuke ----- MED macc ----- No MP Return! (Ctrl-F9)')              
              end
            else
              if state.NukingBody.value == 'MP' then
                equip(sets.nuke.macc1)
                add_to_chat(8,'----- FreeNuke ----- LOW macc -----')
              else
                equip(sets.nuke.mabbody.macc1)
                add_to_chat(8,'----- FreeNuke ----- LOW macc ----- No MP Return! (Ctrl-F9)')              
              end
            end
        end
            if (spell.element == world.day_element or spell.element == world.weather_element) and spellMap ~= 'Helix' then
                equip({waist="Hachirin-No-Obi"})
                add_to_chat(8,'----- Obi Equipped -----')          
            end
      end
    end
end


function job_aftercast(spell, action, spellMap, eventArgs)
    -- #nottoosoon #4/4
    aftercast_start = os.clock()
    if spell.action_type ~= 'Magic' then
      aftercast_start = nil
    end    

   
    -- This is something I added.  2/19/208
    -- If ManaWallSwaping is in unlocked mode, I just want to unlock for precast, midcast, then aftercase lock it again.
    -- An alternative function: just relock the back and feet after every cast.  Just in case something gets messed up.  Like Seiryu knocks off your back or foot.
    if buffactive['Mana Wall'] then
        enable('feet')
        enable('back')
        equip(sets.buff['Mana Wall'])
        disable('feet')
        disable('back')
    end

    
    -- #manawall 1/2
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            enable('back')
            equip(sets.buff['Mana Wall'])
            disable('feet')
            disable('back')
        end
    end    
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.

function job_buff_change(buff, gain)
    -- #manawall 2/2
    -- Unlock feet when Mana Wall buff is lost.
    -- 12/19/2016 messed with this too
    if buff == "Mana Wall" and not gain then
        enable('feet')
        enable('back')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- 12/19/2016
-- OK I'm messing with this.  Here's the original.
--[[
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
]]--

function display_current_job_state(eventArgs)
    local msg = ''

    if state.CastingMode.value ~= 'Damage' then
        msg = msg .. state.CastingMode.value
    else 
        if state.MagicBurst.value == 'MB' then
            msg = msg .. '***MB***'
        else
            msg = msg .. 'FreeNuke'
        end
        msg = msg .. '    macc: ' .. state.MagicAccuracy.value
    end
    
    --msg = msg .. '   Melee: ' .. state.OffenseMode.value
    msg = msg .. '    Idle: ' .. state.IdleMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. '    Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. '   Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. '   Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. '   Target NPCs'
    end

    --add_to_chat(122, msg)
    add_to_chat(123, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
-- Example: for (1, 6), this is page 1 of book 6. 
function select_default_macro_book()
    set_macro_page(1, 8)
end
