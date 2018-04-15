-- This LUA is a work in progress.  Very sloppy, not clean, not organized.  Sorry.  Oh well.

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- TODO
-- Aquaveil set
-- Impact body
-- Put alias commands in
-- Maybe make an obi
-- get self-cure set

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
    indi_timer = ''
    indi_duration = 180

    state.Buff['Blaze of Glory'] = buffactive['Blaze of Glory'] or false    
    
    send_command("alias mb gs equip sets.mb.LOW")
    send_command("alias mbb gs equip sets.mb.LOW.mabbody")
    send_command("alias mb1 gs equip sets.mb.LOW")
    send_command("alias mb3 gs equip sets.mb.MED")
    send_command("alias mb5 gs equip sets.mb.HIGH")    
    send_command("alias mbb1 gs equip sets.mb.LOW.mabbody")
    send_command("alias mbb3 gs equip sets.mb.MED.mabbody")
    send_command("alias mbb5 gs equip sets.mb.HIGH.mabbody")
    send_command("alias nuke gs equip sets.midcast['Elemental Magic']")    
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    --Don't really know how None vs Normal works.
    --I think Normal is supposed to lock the weapon but it doesn't actually work.
    --state.OffenseMode:options('None', 'Normal')
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Damage', 'ProcNaked') -- Alt F11
    state.IdleMode:options('Refresh', 'DT')
    state.MagicBurst = M{"FreeNuke","MB"}  -- Control F11
    state.MagicAccuracy = M{'MED'}  -- Windows F11, for now just 1 macc set
    state.NukingBody = M{'MAB','MP'} -- Control F9

    -- Additional local binds
    -- The ^ is control, ! is alt, @ is windows key.
    send_command('bind ^f9 gs c cycle NukingBody')
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

-- Define sets and vars used by this job file.
function init_gear_sets()

sets.af1 = {
    head="Geo. Galero +3",
    body="Geomancy Tunic +3",
    hands="Geo. Mitaines +3",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +3",
}

sets.af2 = {
    head={ name="Bagua Galero +2", augments={'Enhances "Primeval Zeal" effect',}},
    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}},
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Bagua Sandals +2", augments={'Enhances "Radial Arcana" effect',}},
}

sets.buff['Blaze of Glory'] = {head="Bagua Galero +2"}

--------------------------------------
-- Precast sets
--------------------------------------

-- Precast sets to enhance JAs
-- Cardinal Chant isn't a JA.  It's a trait.  Mote's mistake, oh well
sets.precast.JA['Cardinal Chant'] = {head="Geo. Galero +3"}
sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +3"}
sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +1"}
sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +2"}
sets.precast.JA['Bolster'] = {body="Bagua Tunic +1"}
sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}

-- Fast cast sets for spells
sets.precast.FC = { 
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+6','Mag. Acc.+11',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+5','MND+7',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+10','"Mag.Atk.Bns."+7',}},
    legs="Geomancy Pants +3",
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','MND+2','"Mag.Atk.Bns."+7',}},
    neck="Voltsurge Torque",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}},
}
 
sets.precast.FC.Cure = {
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+5','MND+7',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+10','"Mag.Atk.Bns."+7',}},
    legs="Geomancy Pants +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Sanctity Necklace",
    waist="Channeler's Stone",
    left_ear="Mendi. Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Pahtli Cape",
}

sets.precast.FC.Geomancy = {
    main="Idris",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+6','Mag. Acc.+11',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+5','MND+7',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+10','"Mag.Atk.Bns."+7',}},
    legs="Geomancy Pants +3",
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','MND+2','"Mag.Atk.Bns."+7',}},
    neck="Voltsurge Torque",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}},
}

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})

sets.precast.WS = {
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Subtlety Spec.",
    waist="Eschan Stone",
    left_ear="Steelflash Earring",
    right_ear="Digni. Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Cacoethic Ring",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10',}},
}


--------------------------------------
-- Midcast sets
--------------------------------------

-- redo these sets
-- sets.midcast.Geomancy = {range="Nepote Bell"}
-- sets.midcast.Geomancy.Indi = {range="Nepote Bell",legs="Bagua Pants"}

sets.midcast.FastRecast = sets.precast.FC

sets.midcast['Enhancing Magic'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+11','"Mag.Atk.Bns."+17',}},
    sub="Ammurapi Shield",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +8',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
}

sets.midcast.Haste = sets.midcast['Enhancing Magic']
sets.midcast.Refresh = sets.midcast['Enhancing Magic']
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
    main="Vadose Rod",
    legs="Shedir Seraweels",
    waist="Emphatikos Rope",
})

sets.midcast.Geomancy = {
    --main="Solstice",
    range="Dunna",
    head="Azimuth Hood +1",
    body="Bagua Tunic +1",
    hands="Geo. Mitaines +3",
    legs="Bagua Pants +1",
    feet="Azimuth Gaiters",
    neck="Incanter's Torque",
    waist="Channeler's Stone",
    left_ear="Mendi. Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Nantosuelta's Cape",
}	
 
sets.midcast.Cure = { 
    --main="Tamaxchi",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Geo. Mitaines +3",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Phalaina Locket",
    waist="Channeler's Stone",
    left_ear="Mendi. Earring",
    right_ear="Infused Earring",
    left_ring="Sirona's Ring",
    right_ring="Ephedra Ring",
    back="Pahtli Cape",
}

-- need vanya hand, ore back, 2 earrings, hq neck
sets.midcast.Cursna = { 
    main={ name="Divinity", augments={'Attack+8','Accuracy+9','Phys. dmg. taken -2%','DMG:+13',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Tempered Cape +1",
}

--original sets, no ea+1 gear borrowed from main character
--[[
sets.midcast['Elemental Magic'] = {
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Shiva Ring +1",
    right_ring="Acumen Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Elemental Magic'].Burst = {
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+19','Magic burst dmg.+10%','INT+5','Mag. Acc.+12',}},
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic burst dmg.+8%','MND+8','Mag. Acc.+11',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
]]--

-- Uses gear form main character, the Ea +1 gear
sets.midcast['Elemental Magic'] = {
    main={ name="Solstice", augments={'MP+60','INT+15','"Mag.Atk.Bns."+15',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','"Mag.Atk.Bns."+13',}},
    body="Ea Houppe. +1",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Fast Cast"+5','INT+9','"Mag.Atk.Bns."+13',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic Damage +2','VIT+1','"Mag.Atk.Bns."+9',}},
    feet={ name="Merlinic Crackows", augments={'"Dbl.Atk."+1','Mag. Acc.+29','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Elemental Magic'].Burst = {
    main={ name="Solstice", augments={'MP+60','INT+15','"Mag.Atk.Bns."+15',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands="Ea Cuffs +1",
    legs="Ea Slops +1",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+19','DEX+4','"Store TP"+8','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Shiva Ring +1",
    right_ring="Mujin Band",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Elemental Magic'].LOW = set_combine(sets.midcast['Elemental Magic'],{body="Seidr Cotehardie"})
sets.midcast['Elemental Magic'].MED = set_combine(sets.midcast['Elemental Magic'],{body="Seidr Cotehardie"})
sets.midcast['Elemental Magic'].HIGH = set_combine(sets.midcast['Elemental Magic'],{body="Seidr Cotehardie"})
sets.midcast['Elemental Magic'].LOW.mabbody = sets.midcast['Elemental Magic']
sets.midcast['Elemental Magic'].MED.mabbody = sets.midcast['Elemental Magic']	
sets.midcast['Elemental Magic'].HIGH.mabbody = sets.midcast['Elemental Magic']

sets.mb = {}
sets.mb.LOW = {
    main={ name="Solstice", augments={'MP+60','INT+15','"Mag.Atk.Bns."+15',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Seidr Cotehardie",
    hands="Ea Cuffs +1",
    legs="Ea Slops +1",
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
sets.mb.MED = sets.mb.LOW
sets.mb.HIGH = sets.mb.LOW
sets.mb.LOW.mabbody = sets.midcast['Elemental Magic'].Burst
sets.mb.MED.mabbody = sets.midcast['Elemental Magic'].Burst
sets.mb.HIGH.mabbody = sets.midcast['Elemental Magic'].Burst


sets.midcast['Elemental Magic'].ProcNaked = {
    main=empty,
    sub=empty,
    ammo=empty,
    head=empty,
    body=empty,
    hands=empty,
    legs=empty,
    feet=empty,
    neck=empty,
    waist=empty,
    left_ear=empty,
    right_ear=empty,
    left_ring=empty,
    right_ring=empty,
    back=empty,
}
	
-- Enfeebling Magic Sets
sets.midcast['Enfeebling Magic'] = {
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geo. Galero +3",
    body="Geomancy Tunic +3",
    hands="Geo. Mitaines +3",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast.MndEnfeebles = sets.midcast['Enfeebling Magic']
 
sets.midcast.IntEnfeebles = sets.midcast['Enfeebling Magic']
 
sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
 

--------------------------------------
-- Idle sets
--------------------------------------

sets.idle = { 
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body="Jhakri Robe +2",
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs="Assid. Pants +1",
    feet={ name="Bagua Sandals +2", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10',}},
}

sets.idle.Refresh = { 
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body="Jhakri Robe +2",
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs="Assid. Pants +1",
    feet={ name="Bagua Sandals +2", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10',}},
}

sets.idle.DT = { 
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body="Mallquis Saio +2",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+15','"Repair" potency +4%','Damage taken-3%','Accuracy+15 Attack+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Damage taken-4%',}},
    feet={ name="Bagua Sandals +2", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10',}},
}

--re-think these sets
--[[
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Nepote Bell",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    sets.idle.PDT.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Nepote Bell",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})
]]--


--------------------------------------
-- Defense sets
--------------------------------------


sets.defense.PDT = {
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+10','Damage taken-4%','INT+5',}},
    body="Mallquis Saio +2",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+15','"Repair" potency +4%','Damage taken-3%','Accuracy+15 Attack+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Damage taken-4%',}},
    feet="Battlecast Gaiters",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back="Solemnity Cape",
}
	
sets.defense.MDT = { 
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+10','Damage taken-4%','INT+5',}},
    body="Mallquis Saio +2",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+15','"Repair" potency +4%','Damage taken-3%','Accuracy+15 Attack+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Damage taken-4%',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Solemnity Cape",
}

sets.Kiting = {feet="Geo. Sandals +3"}

sets.latent_refresh = {waist="Fucho-no-obi"}


--------------------------------------
-- Engaged sets
--------------------------------------

sets.engaged = {
    head="Blistering Sallet +1",
    body="Jhakri Robe +2",
    hands="Gazu Bracelet +1",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Subtlety Spec.",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Digni. Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Cacoethic Ring",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10',}},
}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- #nottoosoon #3/4
function job_pretarget(spell)    
    checkblocking(spell)
	    if spell.action_type == 'Magic' then
	    	if aftercast_start and os.clock() - aftercast_start < waittime then
            		windower.add_to_chat(8,"Too soon!  Adding delay: " .. 0.01 * math.floor(100*(waittime - (os.clock() - aftercast_start))) .. " seconds")
            		cast_delay(waittime - (os.clock() - aftercast_start))
            	end
            end 
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and spell.name ~= "Impact" and spellMap ~= 'ElementalEnfeeble' then
        if state.CastingMode.value == 'StoreTP' then
            equip(sets.midcast['Elemental Magic'].StoreTP)
            add_to_chat(8,'----- StoreTP casting mode (aF11) -----')
        elseif state.CastingMode.value == 'ProcNaked' then    
            equip(sets.midcast['Elemental Magic'].ProcNaked)
            add_to_chat(8,'----- ProcNaked casting mode (aF11) -----')
        elseif state.CastingMode.value == 'Proc119' then
            equip(sets.midcast['Elemental Magic'].Proc119)
            add_to_chat(8,'----- Proc119 casting mode (aF11) -----')
        else
            if state.MagicBurst.value == 'MB' then
                if state.NukingBody.value == 'MP' then
                    equip(sets.mb[state.MagicAccuracy.value])
                    add_to_chat(8,'----- MB (cF11) ----- Seidr Cotehardie (cF9)')
                else
                    equip(sets.mb[state.MagicAccuracy.value].mabbody)
                    add_to_chat(8,'----- MB (cF11)----- Max Burst Body (cF9)')            
                end
            else
                if state.NukingBody.value == 'MP' then
                    equip(sets.midcast['Elemental Magic'][state.MagicAccuracy.value])
                    add_to_chat(8,'----- FreeNuke (cF11) ----- Seidr Cotehardie (cF9)')
                else
                    equip(sets.midcast['Elemental Magic'][state.MagicAccuracy.value].mabbody)
                    add_to_chat(8,'----- FreeNuke (cF11) ----- MAB Body (cF9)')            
                end
            end
        end
        --[[
        if (spell.element == world.day_element or spell.element == world.weather_element) and spellMap ~= 'Helix' and state.CastingMode.value ~= 'StoreTP' then
            equip({waist="Hachirin-No-Obi"})
            add_to_chat(8,'----- Obi Equipped -----')          
        end
        ]]--
    end
end


function job_aftercast(spell, action, spellMap, eventArgs)

    -- #nottoosoon #4/4
    aftercast_start = os.clock()
    if spell.action_type ~= 'Magic' then
      aftercast_start = nil
    end 

    --Looks like a custom timer for Indi-spells.  It's not accuracte.
    --[[
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
    ]]--    
    
    
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

--[[
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end
]]--

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
--[[
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
]]--

function display_current_job_state(eventArgs)
    local msg = ''

    if state.CastingMode.value ~= 'Damage' then
        msg = msg .. state.CastingMode.value .. '-aF11'
    else 
        if state.MagicBurst.value == 'MB' then
            msg = msg .. '**MB-cF11'
        else
            msg = msg .. 'Free-cF11'
        end
        --msg = msg .. '    macc: ' .. state.MagicAccuracy.value
    end
    
    --msg = msg .. '   Melee: ' .. state.OffenseMode.value
    msg = msg .. '     Idle-' .. state.IdleMode.value

    if state.NukingBody.value == 'MP' then
        msg = msg ..'     **Seidr-cF9**'
    end    
    if state.NukingBody.value == 'MAB' then
        msg = msg ..'     MABbody-cF9'
    end       
    if state.DefenseMode.value ~= 'None' then
        msg = msg ..'      ' .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end
    
    if state.Kiting.value == true then
        msg = msg .. '     Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. '    Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. '    Target NPCs'
    end

    --add_to_chat(122, msg)
    add_to_chat(123, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 6)
end
