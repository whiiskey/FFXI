function init_gear_sets()

--------------------------------------
-- #Special sets
--------------------------------------

sets.af1 = {
    head="Assim. Keffiyeh +3",
    body="Assim. Jubbah +3",
    hands="Assim. Bazu. +3",
    legs="Assim. Shalwar +3",
    feet="Assim. Charuqs +3",
}

sets.af2 = {
    head={ name="Luh. Keffiyeh +1", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +1", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +1", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Luhlaza Shalwar +1", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},	
}
    
sets.af3 = {
    head="Hashishin Kavuk +1",
    body="Hashishin Mintan +1",
    hands="Hashi. Bazu. +1",
    legs="Hashishin Tayt +1",
    feet="Hashi. Basmak +1",
}	

sets.ambus1 = {
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
}

sets.ambus2 = {
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
}

sets.telchine = {
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
}

sets.amalric = {
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
}

sets.almaric = sets.amalric

sets.cursed = {
    waist="Gishdubar Sash",
    right_ring="Purity Ring",
}



sets.buff['Chain Affinity'] = {Head="Hashishin Kavuk +1", feet="Assimilator's Charuqs +3"}
sets.buff['Burst Affinity'] = {legs="Assimilator's Shalwar +3",feet="Hashishin Basmak +1"}
sets.buff.Convergence = {head="Luhlaza Keffiyeh +1"}
sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
sets.buff.Enchainment = {body="Luhlaza Jubbah +1"}
sets.buff.Efflux = {legs="Hashishin Tayt +1", back="Rosmerta's Cape"}

-- GO GO TH4!
sets.TreasureHunter = {
    head={ name="Herculean Helm", augments={'"Fast Cast"+2','"Store TP"+2','"Treasure Hunter"+1','Accuracy+4 Attack+4','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    legs={ name="Herculean Trousers", augments={'Pet: STR+9','MND+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    waist="Chaac Belt",
}

-- Gear for learning spells: +skill and AF hands.
sets.Learning = {
    ammo="Mavi Tathlum",
    head={ name="Luh. Keffiyeh +1", augments={'Enhances "Convergence" effect',}},
    body="Assim. Jubbah +3",
    hands="Assim. Bazu. +3",
    legs="Hashishin Tayt +1",
    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
    neck="Incanter's Torque",
    left_ring="Stikini Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+2','Blue Magic skill +9',}},
}

-- BLU Enmity sets
-- Enmity +71 in this set.  Pretty good for a BLU.
sets.enmity = {
    ammo="Sapience Orb",
    head="Rabid Visor",
    body="Emet Harness +1",
    hands="Nilas Gloves",
    legs="Zoar Subligar +1",
    feet={ name="Herculean Boots", augments={'Enmity+5','MND+9','Accuracy+10 Attack+10',}},
    neck="Unmoving Collar +1",
    waist="Goading Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Petrov Ring",
    back="Reiki Cloak",
}

sets.precast.JA['Provoke'] = sets.enmity
sets.precast.JA['Warcry'] = sets.enmity
sets.midcast.Fantod = sets.enmity
sets.midcast.Flash = sets.enmity

-- Total 43: ammo 3, head 6, neck 4, ear1 1, ear2 7, body 7, ring1 3, ring2 2, belt 2, legs 4, feet 4 
sets.enmitydown = {
    ammo="Psilomene",
    head="Pinga Crown",
    body="Adhemar Jacket +1",
    legs={ name="Herculean Trousers", augments={'Pet: STR+9','MND+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Clotharius Torque",
    waist="Reiki Yotai",
    left_ear="Lifestorm Earring",
    right_ear="Novia Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
}

sets.MaxHP = {
    ammo="Egoist's Tathlum",
    head="Blistering Sallet +1",
    body="Assim. Jubbah +3",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs="Assim. Shalwar +3",
    feet="Assim. Charuqs +3",
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Meridian Ring",
    right_ring="Ilabrat Ring",
    back="Moonbeam Cape",
}

sets.MinHP = {
    ammo="Staunch Tathlum",
    head="Pixie Hairpin +1",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Mephitas's Ring",
    back="Swith Cape +1",
}

--------------------------------------
-- #Precast
--------------------------------------

-- Precast sets to enhance JAs
sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands"}

-- Fast cast sets for spells.  No quick magic.
-- Total 72: ammo 2, head 14, neck 4, ear1 2, ear2 2, body 9, hand 8, ring1 2, ring2 4, back 10, leg 7, feet 8
-- With FC job trait from erratic flutter, extra 15.  Caps FC
sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}},
}

-- 65 FC in gear, 15 in trait.  7 quick magic.  Pinga body/legs could add more fast cast, letting me swap in more quick.
-- Total FC 65: ammo 2, head 14, neck 4, ear1 2, ear2 2, body 9, hand 8, ring1 2, ring2 4, waist 3, leg 7, feet 8
-- Total quick 7: back 4, belt 3
sets.quick = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
}

-- 77 in gear, 15 in trait.  No quick magic.
sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

-- 68 FC in gear, 15 in trait.  9 quick magic.  Get the Lebeche form mule for last 1%.
-- Total FC 68: head 14, neck 4, ear1 2, ear2 2, body 14, hand 8, ring1 2, ring2, 4, wasit 3, leg 7, feet 8
-- Total quick 9: ammo 2, back 4, waist 3
sets.quickblue = { 
    ammo="Impatiens",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Hashishin Mintan +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Doyen pants",})	

sets.precast.FC.Cure = set_combine(sets.precast.FC, {legs="Doyen pants",back="Pahtli Cape"})
sets.precast.FC.Curaga = sets.precast.FC.Cure


-- Non-blue spells I want to cast with quick magic gear.
sets.precast.FC['Warp'] = sets.quick
sets.precast.FC['Warp II'] = sets.quick

-- Blue magic spells I want to cast with quick magic gear.
sets.precast.FC['Occultation'] = sets.quickblue
sets.precast.FC['Erratic Flutter'] = sets.quickblue
sets.precast.FC['Cocoon'] = sets.quickblue
sets.precast.FC['Barrier Tusk'] = sets.quickblue

----------------------------
-- WEAPON SKILL
----------------------------

-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
    ammo="Floestone",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
    		
-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
-- 50% MND / 50% STR		
sets.precast.WS['Savage Blade'] = {
    ammo="Floestone",
    head="Jhakri Coronal +2",
    body="Assim. Jubbah +3",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet={ name="Herculean Boots", augments={'Accuracy+17','Weapon skill damage +4%','STR+7','Attack+15',}},
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
		
-- 30% STR / 30% INT / 20% DEX
sets.precast.WS['Expiacion'] = {
    ammo="Floestone",
    head="Jhakri Coronal +2",
    body="Assim. Jubbah +3",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet={ name="Herculean Boots", augments={'Accuracy+17','Weapon skill damage +4%','STR+7','Attack+15',}},
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
sets.precast.WS['Chant du Cygne'] = {
    ammo="Jukukik Feather",
    head="Adhemar Bonnet +1",
    body="Abnoba Kaftan",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    --left_ear="Mache Earring",
    right_ear="Moonshade Earring",
    --right_ear="Mache Earring",
    left_ring="Epona's Ring",
    --left_ring="Ramuh Ring +1",
    right_ring="Begrudging Ring",    
    --right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}

sets.precast.WS['Chant du Cygne'].Attack = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Abnoba Kaftan",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Bladeborn Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}

sets.precast.WS['Chant du Cygne'].Acc = {
    ammo="Falcon Eye",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body="Jhakri Robe +2",
    hands="Adhemar Wristbands +1",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}

sets.precast.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Archon Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}  

-- 73~85% MND
-- In this set I just prioritized STR and attack over MND.
sets.precast.WS['Requiescat'] = {
    ammo="Floestone",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Ifrit Ring +1",
    right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

sets.precast.WS['Black Halo'] = sets.precast.WS['Savage Blade']
sets.precast.WS['Realmrazer'] = sets.precast.WS['Requiescat']

sets.precast.WS.Proc = {
    ammo="Falcon Eye",
    head=empty,
    body=empty,
    hands=empty,
    legs=empty,
    feet=empty,
    neck="Subtlety Spec.",
    waist="Olseni Belt",
    left_ear="Zennaroi Earring",
    right_ear="Digni. Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Ramuh Ring +1",
    back="Moonbeam Cape",
}	

sets.precast.WS.EnmDown = sets.enmitydown
sets.precast.WS['Expiacion'].EnmDown = set_combine(sets.precast.WS['Expiacion'], sets.enmitydown)



-------------------------------
-- MIDCAST FOR MAGIC
-------------------------------

sets.midcast.FastRecast = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands="Leyline Gloves",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}},
}
  
sets.midcast['Blue Magic'] = set_combine(sets.midcast.FastRecast, {hands="Hashishin Bazubands +1"})

sets.midcast.ConserveMP = {
    ammo="Pemphredo Tathlum",
    body="Vedic Coat",
    hands="Shrieker's Cuffs",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Calamitous Earring",
    right_ear="Mendi. Earring",
    back="Solemnity Cape",
}
	
----------------------------------
-- MIDCAST FOR BLUE SPELLS
----------------------------------

sets.midcast['Blue Magic'].Physical = {
    ammo="Brigantia Pebble",
    head="Adhemar Bonnet +1",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Bladeborn Earring",
    left_ring="Apate Ring",
    right_ring="Rajas Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

       
sets.midcast['Blue Magic'].PhysicalAcc = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalStr = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalDex = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalVit = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalAgi = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalInt = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalMnd = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalChr = sets.midcast['Blue Magic'].Physical
sets.midcast['Blue Magic'].PhysicalHP = sets.midcast['Blue Magic'].Physical

-- Magical BLU Spells 
-- Lots of MAB
-- #TH feet
-- There's not a lot of haste here!!!!  Reconsider redoing the set for more haste.  Or adding extra set.
sets.midcast['Blue Magic'].Magical= {
    ammo="Pemphredo Tathlum",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    --head="Jhakri Coronal +2",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    --feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},    
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    --neck="Sanctity Necklace",
    neck="Baetyl Pendant",
    --waist="Eschan Stone",
    waist="Witful Belt",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical)
sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)
sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical)
sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

-- Lots of macc
sets.midcast['Blue Magic'].MagicAccuracy = {
    ammo="Pemphredo Tathlum",
    head="Assim. Keffiyeh +3",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Assim. Shalwar +3",
    feet="Jhakri Pigaches +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Sangoma Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{})
                      
-- IDK what to put here.  Can't find advice on forums.  Heck, I never use breath spells anyway.
sets.midcast['Blue Magic'].Breath = sets.midcast['Blue Magic'].Magical
	
--TH spels
sets.midcast['Blue Magic']['Glutinous Dart']=set_combine(sets.midcast['Blue Magic'].Physical,sets.TreasureHunter)
sets.midcast['Blue Magic']['Whirl of Rage']=set_combine(sets.midcast['Blue Magic'].Physical,sets.TreasureHunter)

sets.midcast['Blue Magic'].Stun = sets.midcast['Blue Magic'].MagicAccuracy

sets.midcast['Blue Magic'].Healing = {
    ammo="Hydrocera",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body="Vrikodara Jupon",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="Medium's Sabots",
    neck="Phalaina Locket",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Sirona's Ring",
    back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
}

-- Cure potency caps at 50.  Cure potency recieved caps at 30
-- Cure potency.  Total 54, overcapped.  Neck 4, ear2 5, body 13, back 10, legs 10, feet 12
-- Cure potency recieved.  Total 32, overcapped.  Neck 4, hands 13, ring2 5, waist 10
sets.self_healing = {
    ammo="Hydrocera",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body="Vrikodara Jupon",
    hands={ name="Buremte Gloves", augments={'HP+30','MP+30','MND+8',}},
    legs="Gyve Trousers",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    --left_ear="Lifestorm Earring",
    left_ear="Odnowa Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Kunaji Ring",
    back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
}

sets.midcast['Blue Magic'].SkillBasedBuff = {
    ammo="Mavi Tathlum",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Assim. Jubbah +3",
    hands="Hashishin Bazubands +1",
    legs="Hashishin Tayt +1",
    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring",
    right_ring="Weather. Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+2','Blue Magic skill +9',}},
}

---------------------------------------
-- Midcast sets for specific blue spells
---------------------------------------

-- Head, 1 more MP per tick.  Waist, 20 extra seconds.  Back, 30 extra seconds
-- Maybe combine w fast recast or spell interrupt or conserve mp, idk
sets.midcast['Battery Charge'] = {head="Amalric Coif +1",waist="Gishdubar sash",back="Grapevine Cape"}

sets.midcast.Occultation = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Assim. Jubbah +3",
    hands="Hashi. Bazu. +1",
    legs="Hashishin Tayt +1",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+2','Blue Magic skill +9',}},
}

-- First cap cure potency.  Then cap Max HP.  Optional self cure too.
sets.midcast['Blue Magic']['White Wind'] = {
    ammo="Egoist's Tathlum",
    head="Blistering Sallet +1",
    body="Vrikodara Jupon",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs="Gyve Trousers",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Meridian Ring",
    right_ring="Kunaji Ring",
    back="Moonbeam Cape",
}

sets.midcast['Blue Magic']['Tenebral Crush'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    --waist="Eschan Stone",
    waist="Tempus Fugit",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Archon Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}    

sets.midcast['Blue Magic']['Silent Storm'] = sets.midcast['Blue Magic'].MagicAccuracy

-- Reacst for Magic Hammer is 3:00.  That's too much!  Need to reduce that!
-- Empy hands for recast reduction.  25% haste.  Try to have erratic flutter up.  FC on Vampirisms will cut down time too.
sets.midcast['Blue Magic']['Magic Hammer'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands="Hashi. Bazu. +1",
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

		
sets.midcast['Blue Magic'].Buff = {hands="Hashishin Bazubands +1"}	

-------------------------------------
-- MIDCAST FOR NON BLU MAGIC
-------------------------------------

sets.midcast.Cure = sets.midcast['Blue Magic'].Healing
sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Saida Ring",waist="Gishdubar sash"}

-- Maybe check these for max mp, make sure we're not losing any mp
sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,sets.midcast.ConserveMP,sets.telchine)
sets.midcast.Haste = set_combine(sets.midcast.FastRecast,sets.midcast.ConserveMP,sets.telchine)
sets.midcast.Flurry = sets.midcast.Haste
sets.midcast.Aquaveil = set_combine(sets.midcast.Haste, {
    head="Amalric Coif +1",
    legs="Shedir Seraweels",
    waist="Emphatikos Rope"
})
sets.midcast.Refresh = set_combine(sets.midcast.Haste, {head="Amalric Coif +1",back="Grapevine Cape"})
sets.midcast.Protect = set_combine(sets.midcast.Haste, {ring1="Sheltered Ring"})
sets.midcast.Protectra = sets.midcast.Protect 
sets.midcast.Shell = sets.midcast.Protect
sets.midcast.Shellra = sets.midcast.Protect
sets.midcast.Stoneskin = set_combine(sets.midcast.Haste, {
    legs="Shedir Seraweels",
    neck="Stone Gorget",
    waist="Siegel Sash"
})
--Barspells
--Spikes

sets.midcast['Elemental Magic']= {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
    
sets.midcast['Enfeebling Magic'] = sets.midcast['Blue Magic'].MagicAccuracy

--sets.midcast.MndEnfeebles = {
--sets.midcast.IntEnfeebles = {


-----------------------------------
-- IDLE SETS
-----------------------------------
	
sets.latent_refresh = {waist="Fucho-no-obi"}
    
-- Idle sets
sets.idle = {
    ammo="Vanir Battery",
    head={ name="Herculean Helm", augments={'Attack+4','"Mag.Atk.Bns."+24','"Refresh"+2',}},
    body="Jhakri Robe +2",
    hands={ name="Herculean Gloves", augments={'Pet: "Store TP"+2','Enmity-2','"Refresh"+2','Accuracy+4 Attack+4',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    feet={ name="Herculean Boots", augments={'Attack+7','"Refresh"+1','Accuracy+9 Attack+9',}},
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Infused Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Moonbeam Cape", priority=15},
}

sets.idle.PDT = {
    ammo="Brigantia Pebble",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands={ name="Herculean Gloves", augments={'DEX+6','INT+11','Damage taken-4%','Accuracy+1 Attack+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs="Aya. Cosciales +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

sets.idle.Learning = set_combine(sets.idle, sets.Learning)

sets.lockstyle={
    head="Assim. Keffiyeh +3",
    body="Assim. Jubbah +3",
    hands="Assim. Bazu. +3",
    legs="Assim. Shalwar +3",
    feet="Assim. Charuqs +3",
}   

-- Defense sets
-- DT 41.  PDT 9.  Add max HP.
sets.defense.DThp = {
    ammo="Staunch Tathlum",
    head="Blistering Sallet +1",
    body="Ayanmo Corazza +2",
    hands="Assim. Bazu. +3",
    legs="Aya. Cosciales +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Meridian Ring",
    back="Moonbeam Cape",
}

-- DT 41. PDT 13.  Add defense.  PDT is over-capped.  O well.
sets.defense.DTdef = {    
    ammo="Brigantia Pebble",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Assim. Bazu. +3",
    legs="Aya. Cosciales +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

-- DT 41. PDT 9.  Lots of acc.
sets.defense.DTacc = {
    ammo="Falcon Eye",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Assim. Bazu. +3",
    legs="Aya. Cosciales +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

-- Not much DT or PDT.  Just lots of HP.  DT 5.  PDT 3.
sets.defense.MaxHP = sets.MaxHP

sets.defense.MDT50 = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Assim. Bazu. +3",
    legs="Aya. Cosciales +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Damage taken-3%','Accuracy+5','Attack+6',}},
    neck="Loricate Torque +1",
    waist="Flax Sash",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Engulfer Cape +1",
}

sets.defense.MDT25 = {
    ammo="Vanir Battery",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands="Assim. Bazu. +3",
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Loricate Torque +1",
    waist="Flax Sash",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Engulfer Cape +1",
}

sets.defense.meva = {
    ammo="Staunch Tathlum",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands="Assim. Bazu. +3",
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Flashward Earring",
    left_ring="Purity Ring",
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}},
}	

-- Dark, light
sets.defense.mevad = set_combine(sets.defense.meva, {neck="Invidia Torque", right_ring="Wuji Ring"})
sets.defense.meval = sets.defense.mevad

-- Blizzard, thunder
sets.defense.mevab = set_combine(sets.defense.meva, {right_ring="Icecrack Ring"})
sets.defense.mevat = sets.defense.mevab

-- I can't get these to work
sets.buff.Doom = {
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
}

sets.buff.Doomed = {
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
}

sets.Kiting = {legs="Carmine Cuisses +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
    
-- Normal melee group

-- 1186 acc (no sushi, outside reis)
-- If you switch to Combatabt's Torque it's 1210.
sets.engaged = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    --body={ name="Herculean Vest", augments={'"Triple Atk."+4','Accuracy+12','Attack+13',}},
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Ainia Collar",
    --neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    --right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}


sets.engaged.Acc = {
    ammo="Falcon Eye",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}


-- Old MaxAcc set.  I replaced it with the set below.
--[[
sets.engaged.MaxAcc = {
    ammo="Falcon Eye",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Assim. Jubbah +3",
    hands="Assim. Bazu. +3",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Assim. Charuqs +3",
    neck="Subtlety Spec.",
    waist="Olseni Belt",
    left_ear="Zennaroi Earring",
    right_ear="Telos Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Ramuh Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
]]--

-- The above set is actually 7 higher acc.
-- I swapped the neck and 1 ring.
-- The swap drops 7 acc for 11 STP.  Good swap IMO.
sets.engaged.MaxAcc = {
    ammo="Falcon Eye",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Assim. Jubbah +3",
    hands="Assim. Bazu. +3",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Assim. Charuqs +3",
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

-- For Zerging WOC and Kirin.
-- Because of buffs, attack and accuracy are capped, so these aren't important in the sets.
-- I have a special Zerg spellset with 35DW.  And magic haste will be capped, so don't want DW in the set.
-- So we want the most multi-attack and STP possible.
sets.engaged.Zerg = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body={ name="Herculean Vest", augments={'"Triple Atk."+4','Accuracy+12','Attack+13',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    --left_ear="Digni. Earring",
    --left_ear="Cessance Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}	

-- Hybrid sets
sets.engaged.DT16 = set_combine(sets.engaged, {neck="Loricate Torque +1",left_ring="Defending Ring"})
sets.engaged.Acc.DT16 = set_combine(sets.engaged.Acc, {neck="Loricate Torque +1",left_ring="Defending Ring"})
sets.engaged.MaxAcc.DT16 = set_combine(sets.engaged.MaxAcc, {neck="Loricate Torque +1",left_ring="Defending Ring"})
sets.engaged.Zerg.DT16 = set_combine(sets.engaged.Zerg, {neck="Loricate Torque +1",left_ring="Defending Ring"})

-- TIZONA.  NON-AM3 sets.
sets.engaged.Tizona = sets.engaged
sets.engaged.Tizona.Acc = sets.engaged.Acc
sets.engaged.Tizona.MaxAcc = sets.engaged.MaxAcc
sets.engaged.Tizona.Zerg = sets.engaged.Zerg
sets.engaged.Tizona.DT16 = sets.engaged.DT16
sets.engaged.Tizona.Acc.DT16 = sets.engaged.Acc.DT16
sets.engaged.Tizona.MaxAcc.DT16 = sets.engaged.MaxAcc.DT16
sets.engaged.Tizona.Zerg.DT16 = sets.engaged.Zerg.DT16

-- TIZONA.  AM3 sets.
-- 1162 acc (Ainia, Dedition, Body A, Hands B)
sets.engaged.Tizona.AM3 = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body={ name="Herculean Vest", augments={'"Triple Atk."+4','Accuracy+12','Attack+13',}},
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+25','"Triple Atk."+4',}},
    --feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Ainia Collar",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    --right_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    --right_ring="Hetairoi Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}	

--sets.engaged.Tizona.AM3 = sets.engaged
sets.engaged.Tizona.Acc.AM3 = sets.engaged.Acc
sets.engaged.Tizona.MaxAcc.AM3 = sets.engaged.MaxAcc
sets.engaged.Tizona.DT16.AM3 = set_combine(sets.engaged.Tizona.AM3, {neck="Loricate Torque +1",left_ring="Defending Ring"})
sets.engaged.Tizona.Acc.DT16.AM3 = sets.engaged.Acc.DT16
sets.engaged.Tizona.MaxAcc.DT16.AM3 = sets.engaged.MaxAcc.DT16

end
