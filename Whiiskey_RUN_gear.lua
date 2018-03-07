function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------

-----------------------------------------------------
-- #Special sets
-----------------------------------------------------

sets.enmity = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Unmoving Collar +1",
    waist="Goading Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Petrov Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

sets.TreasureHunter = {
    head={ name="Herculean Helm", augments={'"Fast Cast"+2','"Store TP"+2','"Treasure Hunter"+1','Accuracy+4 Attack+4','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    legs={ name="Herculean Trousers", augments={'Pet: STR+9','MND+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    waist="Chaac Belt",
}

sets.mab = {
    ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Evasionist's Cape",
}

sets.af1 = {
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Rune. Trousers +3",
    feet="Runeist's Boots +3",
}
    
sets.af2 = {
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands={ name="Futhark Mitons +1", augments={'Enhances "Sleight of Sword" effect',}},
    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
    feet={ name="Futhark Boots +1", augments={'Enhances "Rayke" effect',}},
}    

sets.af3 = {
    head="Erilaz Galea +1",
    body="Erilaz Surcoat +1",
    hands="Erilaz Gauntlets +1",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",	
}

sets.ambus1 = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
}
    
sets.ambus2 = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
}

sets.Turms = {
    head="Turms Cap",
    body="Turms Harness",
    hands="Turms Mittens",
    legs="Turms Subligar",
    feet="Turms Leggings",
}

sets.CapacityMantle = {back="Mecistopins Mantle"}
sets.buff.Doom = {ring2="Purity Ring", waist="Gishdubar Sash",}
sets.buff.Embolden = {back={ name="Evasionist's Cape", augments={'Enmity+2','"Embolden"+15','"Dbl.Atk."+3','Damage taken-3%',}},}


-----------------------------------------------------
-- #Defense
-----------------------------------------------------

-- DT 27. PDT 26. Total 53.
-- I need to get Relic +3 head.
sets.defense.DTdef = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

-- DT 27. PDT 21. Total 48.
-- Swaps out Relic +2 head for AF +3 head.  AF +3 head has more defense, VIT, and HP.
sets.defense.DTdef.DTGrip = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",    
    ammo="Staunch Tathlum +1",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

-- DT 33. PDT 18. Total 51.
-- I need to get Turms +1 hands and feet.
sets.defense.Parry = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body="Ayanmo Corazza +2",
    hands="Turms Mittens",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

-- DT 30. PDT 18. Total 48.
-- Swaps out Staunch Tahlum +1 for Amar Cluster.  The Amar Cluster has counter.
sets.defense.Parry.DTGrip = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",
    ammo="Amar Cluster",
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body="Ayanmo Corazza +2",
    hands="Turms Mittens",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}


-- DT 38. PDT 13. Total 51.
-- Get better augments on Herc Gloves.
sets.defense.Hybrid = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",    
    ammo="Yamarang",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands={ name="Herculean Gloves", augments={'"Triple Atk."+4','"Fast Cast"+2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+2','"Dbl.Atk."+3','Damage taken-5%',}},
}

-- DT 38. PDT 11. Total 49.
-- Drops Herc Gloves for Adhemar Wristbands +1.
sets.defense.Hybrid.DTGrip = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",    
    ammo="Yamarang",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+2','"Dbl.Atk."+3','Damage taken-5%',}},
}

-- Would be nice to get a rule where you don't lose max HP for fast cast when in this set.
-- get hp on fast cast body

-- DT 34. PDT 18. Total 52.
sets.defense.DThp = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",    
    ammo="Staunch Tathlum +1",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands={ name="Herculean Gloves", augments={'DEX+6','INT+11','Damage taken-4%','Accuracy+1 Attack+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Moonlight Cape", priority=15},
}

-- DT 30. PDT 19. Total 49.
-- Drops Herc hands for AF +3 hands.
sets.defense.DThp.DTGrip = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    --sub="Utu Grip",    
    ammo="Staunch Tathlum +1",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

sets.defense.MaxHP = {
    --main="Epeolatry",
    --sub="Utu Grip",
    ammo="Psilomene",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Turms Subligar",
    feet="Runeist's Boots +3",
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Moonlight Ring",
    back={ name="Moonlight Cape", priority=15},
}

-- DT 19. MDT 5. Total 24. With DT Grip 27. Lots of meva. Shadow Ring.
-- Might redo this. Consider adding Engulfer Cape. Or that AF with the elemental resistance.
sets.defense.MDT26 = {
    --main="Epeolatry",
    --sub="Refined Grip +1",
    ammo="Staunch Tathlum +1",
    head="Turms Cap",
    body="Turms Harness",
    hands="Turms Mittens",
    legs="Turms Subligar",
    feet="Turms Leggings",
    neck="Loricate Torque +1",
    waist="Flax Sash",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

-- DT 40. MDT 11. For when Shell V is down.
-- make a rule for this!!
sets.defense.MDT50 = {
    ammo="Staunch Tathlum +1",
    head="Aya. Zucchetto +2",
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flax Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Engulfer Cape +1",
}

--maybe make a set that focuses on stat resistance too
sets.defense.meva = {		
    ammo="Yamarang",
    head="Turms Cap",
    body="Turms Harness",
    hands="Turms Mittens",
    legs="Turms Subligar",
    feet="Turms Leggings",
    neck="Warder's Charm +1",
    waist="Engraved Belt",
    left_ear="Eabani Earring",
    right_ear="Flashward Earring",
    left_ring="Purity Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}		

-- Dark, light
sets.defense.mevad = set_combine(sets.defense.meva, {neck="Invidia Torque", right_ring="Wuji Ring"})
sets.defense.meval = sets.defense.mevad

-- Blizzard, thunder
sets.defense.mevab = set_combine(sets.defense.meva, {right_ring="Icecrack Ring"})
sets.defense.mevat = sets.defense.mevab


-----------------------------------------------------
-- #PRECAST SECTION
-----------------------------------------------------

-- Precast sets to enhance JAs
sets.precast.JA['Vallation'] = set_combine(sets.enmity, {
    body="Runeist's coat +3",
    legs="Futhark Trousers +1",
})
sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist's Boots +3"})
sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity, {body="Futhark Coat +1"})
sets.precast.JA['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +1"})
sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head="Futhark Bandeau +2"})
sets.precast.JA['Swordplay'] = set_combine(sets.enmity, {hands="Futhark Mitons +1"})
sets.precast.JA['Rayke'] = set_combine(sets.enmity, {feet="Futhark Boots +1"})
sets.precast.JA['Gambit'] = set_combine(sets.enmity, {hands="Runeist's Mitons +3"})
sets.precast.JA['Embolden'] = {back={ name="Evasionist's Cape", augments={'Enmity+2','"Embolden"+15','"Dbl.Atk."+3','Damage taken-3%',}}}

-- When the word "for" in "One for All" was capitalized, this didn't work right.
sets.precast.JA['One for All'] = sets.defense.MaxHP
sets.precast.JA['Provoke'] = sets.enmity
sets.precast.JA['Warcry'] =  sets.enmity
sets.precast.JA['Vivacious Pulse'] = {
    ammo="Jukukik Feather",
    head="Erilaz Galea +1",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Rune. Trousers +3",
    feet="Runeist's Boots +3",
    neck="Incanter's Torque",
    waist="Engraved Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}
sets.precast.JA['Lunge'] = sets.mab
sets.precast.JA['Swipe'] = sets.mab

-- Waltz potency. Waltz received potency. VIT. CHR. HP.
-- Waltz potency total 51: ammo 5, head 11, ear1 5, hand 10, legs 10, feet 10.
-- Waltz potency received total 16: body 13, ring1 3
sets.precast.Waltz = {
    ammo="Yamarang",
    head={ name="Herculean Helm", augments={'Accuracy+6 Attack+6','"Waltz" potency +11%','Accuracy+10',}},
    body="Passion Jacket",
    hands={ name="Herculean Gloves", augments={'"Waltz" potency +10%','Accuracy+15','Attack+6',}},
    legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'Attack+17','"Waltz" potency +10%','VIT+12','Accuracy+13',}},
    neck="Unmoving Collar +1",
    waist="Flume Belt +1",
    left_ear="Roundel Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Asklepian Ring",
    right_ring="Regal Ring",
    back={ name="Moonlight Cape", priority=15},
}		

sets.precast.Waltz['Healing Waltz'] = {legs="Dashing Subligar"}

sets.precast.Step = {
    ammo="Yamarang",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Rune. Trousers +3",
    feet="Runeist's Boots +3",
    neck="Loricate Torque +1",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}	

-- Fast cast sets for spells
-- Total 63: ammo 2, head 14, neck 4, ear1 2, ear2 2, body 9, hands 8, ring1 4, ring2 2, legs 6, feet 8
-- I kept Moonlight Cape on to keep up max HP.
sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Rune. Bandeau +3", priority=14},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist={ name="Oneiros Belt", priority=13},
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Moonlight Cape", priority=15},
}

-- If i can get a 37+ HP augment on body that would be great.
-- I need a rule to use this set.  Also need to assign priority to the order of swaps.
sets.precast.FC.HighHP = {
    ammo="Sapience Orb",
    head="Rune. Bandeau +3",
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket",neck="Magoraga Beads",})
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",legs="Futhark Trousers +1"})	
sets.precast.Cure = set_combine(sets.precast.FC, {ear2="Mendicant's Earring"})
sets.precast.Curaga = sets.precast.Cure
       
-----------------------------------------------------
-- #Weaponskill
-----------------------------------------------------

sets.precast.WS = {
    ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+17','Weapon skill damage +4%','STR+7','Attack+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

sets.precast.WS.Acc = {
    ammo="Yamarang",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands="Runeist's Mitons +3",
    legs="Rune. Trousers +3",
    feet="Runeist's Boots +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Ramuh Ring +1",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

sets.precast.WS.Dimidiation = {
    ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

sets.precast.WS.Dimidiation.Acc = sets.precast.WS.Acc


sets.precast.WS.Resolution = {
    ammo="Knobkierrie",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    --hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    --left_ring="Niqmaddu Ring",
    left_ring="Shukuyu Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

sets.precast.WS['Resolution'].Acc = sets.precast.WS.Acc


sets.precast.WS['Ground Strike'] = sets.precast.WS.Acc
sets.precast.WS['Freezebite'] = sets.mab
sets.precast.WS['Herculean Slash'] = sets.mab

		
sets.precast.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
}

sets.precast.WS['Requiescat'] = sets.precast.WS.Resolution		
sets.precast.WS['Sanguine Blade'] = set_combine(sets.mab,{head="Pixie Hairpin +1",ring1="Evanescence Ring"})		
sets.precast.WS['Red Lotus Blade'] = sets.precast.WS['Herculean Slash']
sets.precast.WS['Seraph Blade'] = sets.precast.WS['Herculean Slash']

sets.precast.WS.Upheaval = sets.precast.WS.Resolution
sets.precast.WS.Upheaval.Acc = sets.precast.WS.Acc

sets.precast.WS['Full Break'] = sets.precast.WS.Resolution

sets.precast.MaxTP = {ear1="Ishvara Earring"}


-----------------------------------------------------
-- #Midcast
-----------------------------------------------------

sets.midcast.FastRecast = {
    ammo="Staunch Tathlum +1",
    head={ name="Rune. Bandeau +3", priority=14},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist="Flume Belt +1",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Moonlight Cape", priority=15},
}

-- enmity and fast cast with minimum hp
sets.midcast.Flash = {
    ammo="Sapience Orb",
    head="Rune. Bandeau +3",
    body="Runeist's Coat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    --legs="Aya. Cosciales +2",
    legs="Eri. Leg Guards +1",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Unmoving Collar +1",
    waist="Goading Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Petrov Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

sets.midcast.Foil = set_combine(sets.midcast.Flash, {
    head="Erilaz Galea +1",
    ammo="Staunch Tathlum +1",
    legs="Futhark Trousers +1",
})

sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
    head="Erilaz Galea +1",
    hands="Runeist's Mitons +3",
    legs="Futhark Trousers +1",
    waist="Olympus Sash",
    neck="Incanter's Torque",
    ear2="Andoaa Earring",
    back={ name="Moonlight Cape", priority=15},
})

sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})

-- Bar-element spells cap at 500 skill, giving 150 resistance.
-- Total 503: base 440, head 11, neck 10, ear2 5, hands 19, legs 18
sets.midcast.BarElement = {
    ammo="Staunch Tathlum +1",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    hands={ name="Runeist's Mitons +3", priority=14},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}, priority=13},
    neck="Incanter's Torque",
    right_ear="Andoaa Earring",
    back={ name="Moonlight Cape", priority=15},
}


-- Temper
-- Per BGWiki: This spell is no longer capped at 500 Enhancing magic skill.
-- 500 enhancing skill = 20 double attack, 510 = 21, 520 = 22, etc
-- Total 532: base 440, head 11, neck 10, ear1 3, ear2 5, hands 19, ring1 8, ring2 8, back 5, waist 5, legs 18
-- 23 double attack.
sets.midcast.Temper = {
    ammo="Staunch Tathlum +1",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Runeist's Coat +3", priority=15},
    hands={ name="Runeist's Mitons +3", priority=13},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Runeist's Boots +3", priority=12},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Augment. Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Merciful Cape",
}	

sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast,{neck="Stone Gorget",waist="Siegel Sash",})


-- PHALANX SETS

-- Phanalx damage reduction formula: F = 28 + Floor( (Enhancing Magic Skill - 300.5) / 28.5)
-- 415 enhancing skill = 32 damage reduction
-- 443 enhancing skill = 33 damage reduction
-- 472 enhancing skill = 34 damage reduction
-- For master RUN, base enhancing magic skill is 440.


-- This set has enhancing skill 476 = 34 damage reduction.  Not much DT or HP.
-- Enhancing skill 476: base 440, neck 10, ear1 3, ear2 5, ring2 8, back 5, waist 5
-- Gear phalanx bonus 18: head 6, body 3, hands 3, legs 3, feet 3
-- Total damage reduction from phalanx 52: base 34 + gear 18
sets.phalanx473 = {
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body={ name="Taeon Tabard", augments={'Evasion+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Evasion+24','Spell interruption rate down -10%','Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','Phalanx +3',}},
    feet={ name="Herculean Boots", augments={'MND+3','Phalanx +3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Augment. Earring",
    right_ear="Andoaa Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Merciful Cape",
}

-- This set has enhancing skill 445 = 33 damage reduction.  More DT and HP.
-- Enhancing skill 445: base 440, ear1 5
-- Gear phalanx bonus 18: head 6, body 3, hands 3, legs 3, feet 3
-- Total damage reduction from phalanx 51: base 33 + gear 18
-- DT 33. PDT 11. Total 44. It could be 50 with a DT grip and vorseal buffs.
sets.phalanx445 = {
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
    body={ name="Taeon Tabard", augments={'Evasion+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Evasion+24','Spell interruption rate down -10%','Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','Phalanx +3',}},
    feet={ name="Herculean Boots", augments={'MND+3','Phalanx +3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Andoaa Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonlight Cape",
}

--sets.midcast.Phalanx = sets.phalanx473
sets.midcast.Phalanx = sets.phalanx445

-- Cure potency 52, overcap: neck 4, ear1 5, ear2 5, body 13, hand 9, back 7, feet 9	
-- Cure potency recieved 25: neck 4, ring1 5, ring2 6, waist 10
-- A head or leg piece with cure potency recieved could max cures but HP would be lost.
sets.midcast.Cure = {
    ammo="Hydrocera",
    head="Rune. Bandeau +3",
    body="Vrikodara Jupon",
    hands="Weath. Cuffs +1",
    legs="Turms Subligar",
    feet={ name="Herculean Boots", augments={'Phys. dmg. taken -1%','"Cure" potency +9%','Quadruple Attack +2','Accuracy+16 Attack+16',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Kunaji Ring",
    right_ring="Vocane Ring +1",
    back="Solemnity Cape",
}
		
sets.midcast.Curaga = sets.midcast.Cure
		
sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
    ammo="Staunch Tathlum +1",
    --neck="Malison Medallion",
    waist="Gishdubar Sash",
    neck="Incanter's Torque",
    --ring1="Ephedra Ring",
    ring2="Purity Ring"
})
	
sets.midcast.Regen = {
    ammo="Staunch Tathlum +1",
    neck="Incanter's Torque",
    head="Rune. Bandeau +3",
    legs="Futhark Trousers +1"
}
	
sets.midcast.Protect = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +1",
    neck="Incanter's Torque",
    legs="Futhark Trousers +1",
    ring1="Sheltered Ring"
}
	
sets.midcast.Shell = sets.midcast.Protect
sets.midcast.Cursade = sets.midcast.DTdef

sets.midcast['Blue Magic'] = sets.midcast.Flash
sets.midcast.Cocoon = sets.defense.DTdef	
sets.midcast['Healing Breeze'] = sets.midcast.Cure
sets.midcast['Wild Carrot'] = sets.midcast.Cure
sets.midcast.Pollen = sets.midcast.Cure
	

-----------------------------------------------------
-- #Idle
-----------------------------------------------------

sets.idle.DTdef = sets.defense.DTdef

sets.idle.Refresh = {
    ammo="Homiliary",
    head={ name="Herculean Helm", augments={'Attack+4','"Mag.Atk.Bns."+24','"Refresh"+2',}},
    body="Runeist's Coat +3",
    hands={ name="Herculean Gloves", augments={'Pet: "Store TP"+2','Enmity-2','"Refresh"+2','Accuracy+4 Attack+4',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    feet={ name="Herculean Boots", augments={'Attack+7','"Refresh"+1','Accuracy+9 Attack+9',}},
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Infused Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Moonlight Cape", priority=15},
}	

sets.latent_refresh = {waist="Fucho-no-Obi"}

sets.idle.Regen = {
    ammo="Homiliary",
    head="Turms Cap",
    body="Turms Harness",
    hands="Turms Mittens",
    legs="Turms Subligar",
    feet="Turms Leggings",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Infused Earring",
    left_ring="Paguroidea Ring",
    right_ring="Sheltered Ring",
    back={ name="Moonlight Cape", priority=15},
}


-----------------------------------------------------
-- #Engaged
-----------------------------------------------------

-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

sets.engaged = {
    ammo="Yamarang",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Herculean Vest", augments={'"Triple Atk."+4','Accuracy+12','Attack+13',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

sets.engaged.Acc = {
    ammo="Yamarang",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

sets.engaged.DTdef = sets.defense.DTdef
sets.engaged.DD = sets.engaged
sets.engaged.Hybrid = sets.defense.Hybrid
sets.engaged.Parry = sets.defense.Parry

sets.engaged.Acc.DTdef = sets.defense.DTdef
sets.engaged.Acc.DD = sets.engaged.Acc
sets.engaged.Acc.Hybrid = sets.defense.Hybrid
sets.engaged.Acc.Parry = sets.defense.Parry


end
