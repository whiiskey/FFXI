-- Define sets and vars used by this job file.
function init_gear_sets()

sets.TreasureHunter = {
    main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
    head="Wh. Rarab Cap +1",
    waist="Chaac Belt",
}

--------------------------------------
-- PRECAST
--------------------------------------

-- 67 without weapon
-- head 10, neck 4, ear1 2, ear2 2, body 13, hands 8, ring1 2, ring2 4, back 10, waist 2, legs 5, feet 5
sets.precast.FC = {
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Navon Crackows",
    neck="Baetyl Pendant",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

-- 80 without weapon
-- head 10, neck 4, ear1 2, ear2 5, body 13, hands 7, ring1 2, ring2 4, back 8, waist 3, legs 15, feet 7
sets.precast.FC.Cure = {
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Doyen Pants",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Mendi. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Pahtli Cape",
}

sets.precast.FC.Curaga = sets.precast.FC.Cure

--
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

--
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Doyen Pants"})

-- 86 without weapon
-- head 14, neck 4, ear1 2, ear2 2, body 13, hands 10, ring1 2, ring2 4, back 10, waist 2, legs 10, feet 13
sets.precast.FC.BardSong = {
    --main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    main="Carnwenhan",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Querkening Brais",
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%',}},
    neck="Baetyl Pendant",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

sets.precast.FC.HonorMarch = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})
sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})

-- Sammeh's sets are named FastCast not FC
sets.precast.FastCast = sets.precast.FC
sets.precast.FastCast.Cure = sets.precast.FC.Cure
sets.precast.FastCast.Stoneskin = sets.precast.FC.Stoneskin
sets.precast.FastCast['Enhancing Magic'] = sets.precast.FC['Enhancing Magic']
sets.precast.FastCast.BardSong = sets.precast.FC.BardSong
sets.precast.FastCast.Daurdabla = sets.precast.FC.Daurdabla
sets.precast.FastCast.HonorMarch = sets.precast.FC.HonorMarch
sets.precast.FastCast['Honor March'] = sets.precast.FC['Honor March'] 


-- Precast sets to enhance JAs
    
sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
sets.precast.JA.Troubadour = {body="Bihu Justaucorps +1"}
sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {}    
       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
-- This set is lots of acc.  Make sure you don't miss when you're getting WS in omen.

sets.precast.WS = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Aya. Gambieras +2",
    neck="Combatant's Torque",
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Ramuh Ring +1",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
}

-- Used this set when killing Salvage boss for Carn trial.
--[[
sets.precast.WS = {
    head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
    body={ name="Bihu Jstcorps +1", augments={'Enhances "Troubadour" effect',}},
    hands="Aya. Manopolas +2",
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Aya. Gambieras +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Mache Earring",
    right_ear="Mache Earring",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
}
]]--

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {left_ring="Begrudging Ring"})
sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

sets.precast.WS["Rudra's Storm"] = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

sets.rud = sets.precast.WS["Rudra's Storm"]

-- This is a low attack set.
-- It chooses CHR over attack.
-- Good for Abyssea trials or attack capped situations.

sets.precast.WS['Mordant Rime'] = {
    range="Gjallarhorn",
    head="Brioso Roundlet +3",
    body={ name="Bihu Jstcorps +1", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Bihu Cuffs +1", augments={'Enh. "Adventurer\'s Dirge" effect',}},
    legs={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}},
    feet="Inyan. Crackows +2",
    neck="Moonbow Whistle +1",
    waist="Chaac Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enchntr. Earring +1",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

-- Midcast Sets

-- General set for recast times.
-- 26% haste!!
-- Fast cast 63: head 10, neck 4, ear1 2, ear2 2, body 13, hands 7, ring1 2, ring2 4, back 10, legs 5, feet 4
sets.midcast.FastRecast = {
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Navon Crackows",
    neck="Baetyl Pendant",
    waist="Sailfi Belt +1",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
        
-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
-- These are all buffs except for Finale.  Why is Finale in here?
-- Finale is different than the other song debuffs.  You don't need any duration with Finale.
-- Other debuffs are Lullaby, Elegy, Nocture, Threnody.  Duration is important for all those.
-- So I guess you would put in macc, magic skill, CHR, recast reduction.
-- Exception: I'm putting haste and fast cast in Lullaby to reduce recast time.  Testing it anyway.
sets.midcast.Ballad = {legs="Fili Rhingrave +1"}


-- This is a set for higher macc.
-- It keeps the macc gear.
sets.midcast.Lullaby = {hands="Brioso Cuffs +3"}

--[[
-- This is a set for fast recast.
-- It replaces macc gear with recast gear.
sets.midcast.Lullaby = {
    head="Nahtirah Hat",
    hands="Brioso Cuffs +3",
    waist="Sailfi Belt +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
}
]]--

sets.midcast.Madrigal = {head="Fili Calot +1",back="Intarabus's Cape"}
sets.midcast.Prelude = {back="Intarabus's Cape"}
sets.midcast.March = {hands="Fili Manchettes +1"}
sets.midcast.HonorMarch = {hands="Fili Manchettes +1",range="Marsyas"}
sets.midcast.Minuet = {body="Fili Hongreline +1"}
sets.midcast.Minne = {}
sets.midcast.Paeon = {head="Brioso Roundlet +3"}
sets.midcast.Carol = {}
sets.midcast.Etude = {
	head="Fili Calot +1",
        body="Fili Hongreline +1",
        hands="Fili Manchettes +1",
        legs="Fili Rhingrave +1",
	feet="Fili Cothurnes +1"
}
sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
sets.midcast['Magic Finale'] = {neck="Incanter's Torque",waist="Luminary Sash",legs="Fili Rhingrave +1"}
sets.midcast.Mazurka = {range=info.ExtraSongInstrument}


-- For song buffs
-- First duration.  Then AF3.  The recast.
-- Total duration 93: dagger 5, horn 40, neck 10, body 12, legs 15, feet 11
sets.midcast.SongEffect = {
    --main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    --sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

-- For song defbuffs (duration primary, accuracy secondary)
sets.midcast.SongDebuff = {
    --main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    --sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Fili Hongreline +1",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",    
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Sangoma Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

-- For song defbuffs (accuracy primary, duration secondary)
sets.midcast.ResistantSongDebuff = {
    --main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    --sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Brioso Justau. +3",
    hands="Brioso Cuffs +3",
    legs="Brioso Cannions +3",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Sangoma Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

-- It looks like GS never actually equips this set.
-- But Sammeh put in an alias to equip this set.
sets.midcast.LullabyFull = set_combine(sets.midcast.SongDebuff, sets.midcast.Lullaby)

-- Song-specific recast reduction
sets.midcast.SongRecast = {ear2="Loquacious Earring",ring1="Prolix Ring",legs="Fili Rhingrave +1"}

--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

-- Cast spell with normal gear, except using Daurdabla instead
sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
-- I also put in lots of recast reduction.  With this, song recast is 10 seconds.
-- That was you can put up 2 dummy songs and then immediately re-sing those same 2 songs with relic horn.
sets.midcast.DaurdablaDummy = {
    --main="Malevolence",  -- This is the only main hand weapon swapping I'm doing.
    range=info.ExtraSongInstrument,
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Fili Rhingrave +1",
    feet={ name="Bihu Slippers +1", augments={'Enhances "Nightingale" effect',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",  
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

-- Other general spells and classes.
-- Cure potency
-- Total 55, overcapped: head 10, neck 4, ear2 5, hands 17, back 7, feet 12
sets.midcast.Cure = {
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Phalaina Locket",
    waist="Luminary Sash",
    left_ear="Lifestorm Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Sirona's Ring",
    back="Solemnity Cape",
}

sets.midcast.Curaga = sets.midcast.Cure

sets.midcast['Enhancing Magic'] = {
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Siegel Sash",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Stikini Ring +1",
    back="Perimede Cape",
}

-- Nodens Gorget 30, Earthcry Earring 10, Stone Mufflers 30, Siegel Sash 20, Shedir Seraweels 35
-- Bard can't wear hands, Stone Mufflers
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
        
sets.midcast.Haste = {
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

sets.midcast.Flurry = sets.midcast.Haste
sets.midcast.Aquaveil = sets.midcast.Haste
sets.midcast.Protectra = set_combine(sets.midcast.Haste, {ring1="Sheltered Ring"})
sets.midcast.Shellra = set_combine(sets.midcast.Haste, {ring1="Sheltered Ring"})

sets.midcast.Refresh = {
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Baetyl Pendant",
    waist="Gishdubar Sash",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Grapevine Cape",
}

sets.midcast.Cursna = sets.midcast.Cure

--[[
sets.midcast['Elemental Magic'] = {    	    
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Wretched Coat",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -2%','INT+5','Mag. Acc.+5',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Static Earring",
    right_ear="Friomisi Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back="Toro Cape",
}
]]--

-- Sets to return to when not performing an action.
	    
-- Resting sets
sets.resting = {}   
    
-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle = {
    head={ name="Bihu Roundlet +1", augments={'Enhances "Foe Sirvente" effect',}},
    body="Vrikodara Jupon",
    hands="Aya. Manopolas +2",
    legs="Assid. Pants +1",
    feet="Fili Cothurnes +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Impreg. Earring",
    left_ring="Defending Ring",
    right_ring="Paguroidea Ring",
    back="Moonlight Cape",
}

sets.idle.Lullaby = sets.midcast.LullabyFull

-- Defense sets

sets.defense.PDT = {
    head="Blistering Sallet +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Genmei Earring",
    right_ear="Impreg. Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

sets.defense.MaxHP = {
    head="Blistering Sallet +1",
    body="Inyanga Jubbah +2",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}},
    feet="Brioso Slippers +3",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Meridian Ring",
    right_ring="Ilabrat Ring",
    back="Moonlight Cape",
}

sets.defense.MDT = {
    range="Gjallarhorn",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque +1",
    waist="Slipor Sash",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Engulfer Cape +1",
}

-- I did this to prevent an error with Sammeh's custom functions.
-- The sets.Idle.Current set needs to be defined for the custom functions to work.
sets.Idle = sets.idle
sets.Idle.Current = sets.idle

sets.Kiting = {feet="Fili Cothurnes +1"}

--sets.latent_refresh = {waist="Fucho-no-obi"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Check the haste.  I did Aya legs instead of Querk because  because Querk legs don't have enough haste.
sets.engaged = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    --legs="Querkening Brais",
    legs="Aya. Cosciales +2",
    feet="Battlecast Gaiters",
    --feet="Aya. Gambieras +2",
    neck="Combatant's Torque",
    --waist="Windbuffet Belt +1",
    waist="Reiki Yotai",
    left_ear="Telos Earring",	
    right_ear="Digni. Earring",
    left_ring="Rajas Ring",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
}

-- Acc set
sets.engaged.Acc = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
}

--The DW rule isn't funcitonal.  You have to change the name of the set.
sets.engaged.DW = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Battlecast Gaiters",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
}

sets.af1 = {
    head="Brioso Roundlet +3",
    body="Brioso Justau. +3",
    hands="Brioso Cuffs +3",
    legs="Brioso Cannions +3",
    feet="Brioso Slippers +3",
}

sets.af2 = {
    head={ name="Bihu Roundlet +1", augments={'Enhances "Foe Sirvente" effect',}},
    body={ name="Bihu Jstcorps +1", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Bihu Cuffs +1", augments={'Enh. "Adventurer\'s Dirge" effect',}},
    legs={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}},
    feet={ name="Bihu Slippers +1", augments={'Enhances "Nightingale" effect',}},	
}

sets.af3 = {
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Fili Rhingrave +1",
    feet="Fili Cothurnes +1",	
}

sets.ambus1 = {
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
}

sets.ambus2 = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
}

end
