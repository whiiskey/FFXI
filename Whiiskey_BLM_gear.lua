function init_gear_sets()

-- MP in each set
-- No vorseals.  No Lathi.  No MP from main or sub.
--
-- mb1    1588
-- mb3    1588
-- mb5    1570
-- nuke1  1619
-- nuke3  1533
-- nuke5  1630
-- faste  1604
-- 
-- I guess aim for 1600ish in defense and idle and precast sets.
-- Also get more mp in enhancing/buff sets.  Might have to assign priorities there.


------------------------------------------------------
-- SPECIAL SETS
------------------------------------------------------

sets.af1 = {
    head="Spae. Petasos +3",
    body="Spaekona's Coat +3",
    hands="Spae. Gloves +3",
    legs="Spae. Tonban +3",
    feet="Spae. Sabots +3",
}    

sets.ambus1 = {
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
}

sets.telchine = {
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
}

sets.th = {
    head="Wh. Rarab Cap +1",
    hands={ name="Merlinic Dastanas", augments={'STR+12','"Treasure Hunter"+1',}},
    legs={ name="Merlinic Shalwar", augments={'Accuracy+7','Mag. Acc.+26','"Treasure Hunter"+1','Accuracy+20 Attack+20','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    waist="Chaac Belt",
}

--sets.Kiting = {feet="Crier's Gaiters"}
sets.latent_refresh = {waist="Fucho-no-obi"}


------------------------------------------------------
-- PRECAST SECTION
------------------------------------------------------

------------------------------------------------------
-- JA SETS
------------------------------------------------------

-- Mana wall stuff
-- I bet we don't really need this.  I'm going to comment it out and see if stuff still works.  2/19/2018
--[[
sets.precast.JA['Mana Wall'] = {
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
    feet="Wicce Sabots +1"
}
]]--

-- It gives you a 20 or 30 second longer Manafront.  Wiki says 30.  My testing shows 20.
-- Normal Manafont lasts 60 seconds.
sets.precast.JA.Manafont = {body="Arch. Coat +1"}
    
-- I haven't messed with this.
sets.precast.JA.Convert = {}

-- LOL at this!
-- This is for when you need to pull Archaic Gears in Nyzul Isle without them agroing to magic.
sets.precast.RA = {ammo="Leafkin Grenade"}
--sets.precast.RA = {ammo="Bonanza Ball"}

------------------------------------------------------
-- FAST CAST SETS
------------------------------------------------------

-- Total 80: ammo 2, head 14, neck 4, ear1 2, ear2 2, body 13, hands 6, ring1 2, ring2 4, back 10, waist 2, legs 7, feet 12
-- No insta-cast here
-- Maybe go through all the sets and look for MP loss
sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+5',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

-- Total 69: head 14, neck 4, ear1 2, ear2 2, body 13, hands 6, ring1 2, ring2 4, waist 3, legs 7, feet 12
-- Insta-cast total 9: ammo 2, back 4, waist 3
-- Could put Lebeche Ring in here
-- I need to assign quick cast to certain spells
sets.quick = {
    ammo="Impatiens",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+5',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
}
	
-- This is over-kill
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

-- Total 72: head 14, neck 4, ear1 2, ear2 2, body 13, hands 6, ring1 2, ring2 4, waist 3, legs 10, feet 12
-- Insta-cast 9
sets.precast.FC.Stoneskin = set_combine(sets.quick, {legs="Doyen Pants"})

-- Total 81: ammo 2, head 14, neck 4, ear1 2, ear2 3, body 13, hands 6, ring1 2, ring2 4, back 10, waist 2, legs 7, feet 12
-- No insta-cast
-- In Mana Wall is up then we don't get FC from back or feet.  81 - 10 - 12 = 59
sets.precast.FC['Elemental Magic'] = {
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+5',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Barkaro. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

-- Precast for Cure
-- I put cure potency gear here.  That way, if insta-cast fires, and you midcast in this set, you have cure potency.
-- Total 67: head 14, neck 4, ear1 2, ear2 5, body 7, hands 7, ring1 2, ring2 4, waist 3, legs 7, feet 12 
sets.precast.FC.Cure = {
    ammo="Impatiens",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Mendi. Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Perimede Cape",
}

sets.precast.FC.Curaga = sets.precast.FC.Cure
	
-- Death precast
-- The first goal is MP.  Look at the MP of your midcast Death set.  Make sure you have at least that much MP here.
-- The second goal is fast cast.  Try to get as high as you can.  But if you don't cap, don't worry.
-- Death is only a 3 second cast.  Not a big deal if you don't cap FC.
sets.precast.FC.Death = {
    ammo="Psilomene",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Channeler's Stone",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

------------------------------------------------------
-- WEAPONSKILL SETS
------------------------------------------------------

-- This set is for all WS that are not defined below.
sets.precast.WS = {
    ammo="Amar Cluster",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Zennaroi Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Ramuh Ring +1",
    back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10',}},
}

-- WS modifier 50% MND / 50% INT.
-- You also need accuracy so it hopefully doesn't miss.
sets.precast.WS['Spirit Taker'] = {
    ammo="Amar Cluster",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Zennaroi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}	

-- Myrkr set.  This is important to define.  Just put as much MP in as possible.  Also TP bonus. 
sets.precast.WS['Myrkr'] = {
    ammo="Psilomene",
    head="Amalric Coif +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands="Spae. Gloves +3",
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    neck="Dualism Collar +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Etiolation Earring",
    left_ring="Mephitas's Ring",
    right_ring="Mephitas's Ring +1",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

-- Defense down 25%, additional effect, wind-based.  Will prob not land on wind or ice enemies.
-- I put in phys acc and macc
-- WS mod 100% STR, in case you were wondering
sets.precast.WS['Shell Crusher'] = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Ramuh Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- Proc set.  No mab.
-- Just a set to hit this ws with low damage.
sets.precast.WS['Rock Crusher'] = {
    ammo="Staunch Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Loricate Torque +1",
    waist="Cetl Belt",
    left_ear="Genmei Earring",
    right_ear="Impreg. Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

------------------------------------------------------
-- MIDCAST SECTION
------------------------------------------------------

-- First cap gear haste at 26.  Then add fast cast.
-- Haste 26.  Fast cast 78.
sets.midcast.FastRecast = {
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','MND+8','Mag. Acc.+5',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+5',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+7','"Fast Cast"+7','"Mag.Atk.Bns."+8',}},
    neck="Baetyl Pendant",
    waist="Cetl Belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

-- Total 63: ammo 4, head 12, ear1 4, ear2 2, body 10, hands 7, back 5, legs 12, feet 7
-- BLM job trait: Conserve MP III 31	
-- Spend no MP 2
sets.midcast.ConserveMP = {
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
    body="Vedic Coat",
    hands="Shrieker's Cuffs",
    legs={ name="Vanya Slops", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Calamitous Earring",
    right_ear="Mendi. Earring",
    back="Solemnity Cape",
}

------------------------------------------------------
-- HEALING MAGIC SETS
------------------------------------------------------

-- Midcast for Cure.
-- Aim for 50% cure potency.
-- You could also aim for emnity reduction.  If you want.  Cap is 50 I believe.
-- Then add Healing Magic Skill, MND, and VIT.
-- Healing Magic Skill is the most potent of these three stats.   (Power = floor(MND/2) + floor(VIT/4) + Healing Magic Skill)
-- I use a lot of Healing Magic Skill for BLM (also GEO, BRD, SMN) because there is no native healing magic.  Vanya Path B.
-- Cure potency 61: head 10, neck 4, ear2 5, body 13, hands 17, back 7, feet 5 (over-capped)
sets.midcast.Cure = {
    ammo="Hydrocera",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Vrikodara Jupon",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Phalaina Locket",
    waist="Luminary Sash",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Sirona's Ring",
    back="Solemnity Cape",
}

-- The contribution of Healing Magic Skill, MND, VIT to Cure Power is different for Curaga spells.
-- MND is the most potent stat.  (Power = 3×MND + VIT + 3×floor( Healing Magic Skill÷5 ))
-- I guess we could make a different set.  But BLM doesn't Curaga much at all.  So I didn't.
sets.midcast.Curaga = sets.midcast.Cure

-- Cure potency 61: head 10, neck 4, ear2 5, body 13, hands 17, back 7, feet 5 (over-capped)
-- Cure potency recieved 25: neck 4, ring1 5, ring2 6, waist 10
-- Maybe get a Telchine Hands with cure potency recieved on it go cap this
sets.self_healing = {
    ammo="Hydrocera",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Vrikodara Jupon",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','INT+4 MND+4',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Mendi. Earring",
    left_ring="Kunaji Ring",
    right_ring="Vocane Ring +1",
    back="Solemnity Cape",
}


------------------------------------------------------
-- ENHANCING MAGIC SETS
------------------------------------------------------

sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,sets.midcast.ConserveMP,sets.telchine)
sets.midcast.Haste = set_combine(sets.midcast.FastRecast,sets.midcast.ConserveMP,sets.telchine)
sets.midcast.Flurry = sets.midcast.Haste
sets.midcast.Aquaveil = set_combine(sets.midcast.Haste, {head="Amalric Coif +1",legs="Shedir Seraweels",waist="Emphatikos Rope"}) -- Maybe get other things.
sets.midcast.Refresh = set_combine(sets.midcast.Haste, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"})
sets.midcast.Protect = set_combine(sets.midcast.Haste, {ring1="Sheltered Ring"})
sets.midcast.Protectra = sets.midcast.Protect 
sets.midcast.Shell = sets.midcast.Protect
sets.midcast.Shellra = sets.midcast.Protect
sets.midcast.Stoneskin = set_combine(sets.midcast.Haste, {neck="Stone Gorget",waist="Siegel Sash"})
--Barspells
--Spikes
--Maybe spell interrupt reduction

-- This phalanx set enhancing skill 338: naked 316, neck 10, body 12
-- It also has +40% duration.
-- 20 more enhancing skill could get 1 more point of damage reduction.
-- If you wanna add in that gear, go for it.  Stikini Rings (+1), Andoaa Earring, Enhancing Earring, Fi Follet Cape +1, others?
-- 300 skill, 28 damage reduction
-- 329 skill, 29 damage reduction
-- 358 skill, 30 damage reduction
sets.midcast.Phalanx = set_combine(sets.midcast.Haste, {hands={ name="Merlinic Dastanas", augments={'"Dbl.Atk."+1','STR+6','Phalanx +4','Accuracy+15 Attack+15',}},})


------------------------------------------------------
-- ENFEEBLING MAGIC SETS
------------------------------------------------------

-- Lots of macc in this set
sets.midcast['Enfeebling Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Spae. Petasos +3",
    body="Spaekona's Coat +3",
    hands="Spae. Gloves +3",
    legs="Spae. Tonban +3",
    feet="Spae. Sabots +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- I have Dia proc TH
sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.th)
sets.midcast.Diaga = sets.midcast.Dia
sets.midcast["Dia II"] = sets.midcast.Dia

-- Caps at 150 INT.  5 damage/tick.  11 lower on the stat.
-- That's easy to hit these days.
-- Relic +3 boots have a bonus to this.
sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

------------------------------------------------------
-- DARK MAGIC SETS
------------------------------------------------------

-- Not quite sure what to put here.  I just copied the Drain/Aspir set.
-- Maybe we want dark magic skill for Bio potency.  I don't know.
sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +10','MND+7','Mag. Acc.+15',}},
    neck="Incanter's Torque",
    waist="Fucho-no-Obi",
    left_ear="Hirudinea Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- Free nuke set for hitting the 15k nuke in omen.  No added Burst Damage.
-- 1770 MP
sets.midcast.Death = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+2','Mag. Acc.+13','"Mag.Atk.Bns."+9',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Sangoma Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

--[[
-- This is high macc set for HELMS
sets.midcast.Death = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+2','Mag. Acc.+13','"Mag.Atk.Bns."+9',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+5%','INT+7','Mag. Acc.+1','"Mag.Atk.Bns."+4',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Static Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}
]]--

--[[
-- Balanced set for bursting.  Pixie +1.
sets.midcast.Death = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+5%','INT+7','Mag. Acc.+1','"Mag.Atk.Bns."+4',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Static Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Sangoma Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}
]]--

--[[
-- This is a set for the ambuscade cactus.  I used Elemental Seal on each cast, so lots of macc was not needed.
-- It has max Burst Damage I, boht Pixie +1 and Archon, and lots of MP
-- 1886 MP.
sets.midcast.Death = {
    ammo="Psilomene",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+28','Magic burst dmg.+10%','INT+3','Mag. Acc.+8',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','Magic burst dmg.+11%','CHR+7',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Static Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Mephitas's Ring +1",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}
]]--

--low acc
sets.midcast.Drain = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+29','"Drain" and "Aspir" potency +10','"Mag.Atk.Bns."+12',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Drain" and "Aspir" potency +11','MND+1','Mag. Acc.+10',}},
    legs="Spae. Tonban +3",
    feet={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +10','MND+7','Mag. Acc.+15',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Hirudinea Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}


--high acc
--[[
sets.midcast.Drain = {
    ammo="Pemphredo Tathlum",
    head="Spae. Petasos +3",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+29','"Drain" and "Aspir" potency +10','"Mag.Atk.Bns."+12',}},
    hands="Spae. Gloves +3",
    legs="Spae. Tonban +3",
    feet={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +10','MND+7','Mag. Acc.+15',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Hirudinea Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
]]--

sets.midcast.Aspir = sets.midcast.Drain

-- For fast recasts of stun
sets.midcast.Stun = sets.midcast.FastRecast


------------------------------------------------------
-- ELEMENTAL MAGIC SETS
------------------------------------------------------

sets.nuke = {}
sets.mb = {}

------------------------------------------------------
-- #FREE NUKE SETS
------------------------------------------------------

-- LOW ACC FREE NUKE SET
sets.nuke.macc1 = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- LOW-MED ACC FREE NUKE SET
-- Just changed neck and waist.  The LUA never uses this set.
sets.nuke.macc2 = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- MED ACC FREE NUKE SET
-- Changes neck, waist, legs for pieces with more macc.
sets.nuke.macc3 = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- HIGH MACC FREE NUKE SET
sets.nuke.macc5 = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body="Spaekona's Coat +3",
    hands="Spae. Gloves +3",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','INT+6','Mag. Acc.+10','"Mag.Atk.Bns."+8',}},
    feet="Spae. Sabots +3",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- Don't really need this, I don't think, but I thinkk it's good for this set to be defined anyway.
sets.midcast['Elemental Magic'] = sets.nuke.macc1

-- Here are sets for free-nuking in a body with more MAB than the AF body (which returns MP)
sets.nuke.mabbody = {}
sets.nuke.mabbody.macc1 = set_combine(sets.nuke.macc1,{
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
})
sets.nuke.mabbody.macc3 = set_combine(sets.nuke.macc3,{
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+2','Mag. Acc.+13','"Mag.Atk.Bns."+9',}},
})
sets.nuke.mabbody.macc5 = sets.nuke.macc5


------------------------------------------------------
-- #MB MAGIC BURST ELEMENTAL MAGIC SETS
------------------------------------------------------

--LOW MACC MB SET
sets.mb.macc1 = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Static Earring",
    right_ear={ name="Regal Earring", priority=1},
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

--OLD MB1 SET
sets.mb.old = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+9%','Mag. Acc.+14','"Mag.Atk.Bns."+15',}},
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Static Earring",
    right_ear={ name="Regal Earring", priority=1},
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

--MED MACC MB SET
sets.mb.macc3 = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet="Spae. Sabots +3",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear={ name="Barkaro. Earring",priority=15},
    left_ring="Shiva Ring +1",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

--HIGH MACC MB SET
sets.mb.macc5 = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Spaekona's Coat +3",
    hands="Spae. Gloves +3",
    legs="Ea Slops +1",
    feet="Spae. Sabots +3",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- Here are sets for bursting in a body with more MAB than the AF body (which returns MP)
sets.mb.mabbody = {}
sets.mb.mabbody.macc1 = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear={ name="Regal Earring", priority=1},
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.mb.mabbody.macc3 = set_combine(sets.mb.mabbody.macc1,{waist="Eschan Stone"})
sets.mb.mabbody.macc5 = sets.mb.macc5

------------------------------------------------------
-- OTHER ELEMENTAL MAGIC SETS
------------------------------------------------------

-- Occult accmen
-- nuking for TP
sets.midcast['Elemental Magic'].StoreTP = {
    ammo="Seraphic Ampulla",
    head="Welkin Crown",
    body="Spaekona's Coat +3",
    --hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+27','"Occult Acumen"+11','INT+8',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Occult Acumen"+10','INT+1','Mag. Acc.+10',}},
    --feet="Battlecast Gaiters",
    neck="Combatant's Torque",
    waist="Oneiros Rope",    
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}	

--sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].StoreTP, {head=empty,body="Twilight Cloak"})

sets.midcast['Elemental Magic'].ProcNaked = {
    -- main=empty,
    -- sub=empty,
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

sets.midcast['Elemental Magic'].Proc119 = {
    -- main=empty,
    -- sub=empty,
    ammo="Psilomene",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    neck="Bathy Choker +1",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Swith Cape +1",
}

------------------------------------------------------
-- OTHER MIDCAST SETS
------------------------------------------------------

-- Macc
sets.midcast.BardSong = sets.midcast['Enfeebling Magic']

-- Maybe add ninjitsu



------------------------------------------------------
-- DEFENSE SETS
------------------------------------------------------

-- This one aims for capped DT while keeping as much MP and defense as possible.
-- MP 1526, defense 981, VIT 92+101
sets.defense.PDT = {
    ammo="Staunch Tathlum",
    head="Blistering Sallet +1",
    body="Mallquis Saio +2",
    hands="Spae. Gloves +3",
    legs={ name="Vanya Slops", augments={'HP+50','Mag. Evasion+15','Phys. dmg. taken -3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','Damage taken-3%','"Mag.Atk.Bns."+4',}},
    neck="Loricate Torque +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

-- only 47PDT.  Need 3 more.  Can get HQ ammo/back and get 4 on a head or foot.
sets.defense.PDT.WhatIWant = {
    ammo="Staunch Tathlum",
    head="Blistering Sallet +1",
    body="Mallquis Saio +2",
    hands="Spae. Gloves +3",
    legs="Spae. Tonban +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','Damage taken-3%','"Mag.Atk.Bns."+4',}},
    neck="Loricate Torque +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

-- sets.defense.PDT.DefDT = {}

sets.defense.PDT.old = {
    ammo="Staunch Tathlum",
    head="Blistering Sallet +1",
    body="Mallquis Saio +2",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+3','Phys. dmg. taken -5%',}},
    --hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+9','Damage taken-3%','MND+7',}},
    legs={ name="Vanya Slops", augments={'HP+50','Mag. Evasion+15','Phys. dmg. taken -3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','Damage taken-3%','"Mag.Atk.Bns."+4',}},
    neck="Loricate Torque +1",
    waist="Cetl Belt",
    left_ear="Genmei Earring",
    right_ear="Impreg. Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

sets.defense.MDT = {
    ammo="Vanir Battery",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Mallquis Saio +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+9','Damage taken-3%','MND+7',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','Damage taken-3%','"Mag.Atk.Bns."+4',}},
    neck="Loricate Torque +1",
    waist="Slipor Sash",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Moonbeam Cape",
}


------------------------------------------------------
-- IDLE SETS
------------------------------------------------------

-- I took out the "Normal" idle set.
-- Currently, only 2 sets: Death, Regen
-- Death: has refresh, DT, MP.  Use this most of the time.
-- Regen: use when you want regen and don't need DT.
-- Toggle your idle sets with control F12.
sets.idle = {}

-- Idle in this when you burst death.
-- Check MP of your death midcast.  Have at least that much MP in this set.
-- Refresh, DT, and MP gear.
-- Refresh: head 1, body 4, pants 1.  Lathi is another 1.  
-- DT: neck 6, ring 10, back 4.  I could swap in more DT, but I'll lose MP.
-- MP 1814.  HP 1631.
sets.idle.Death = {    	
    -- main="Lathi",
    -- sub="Enki Strap",
    ammo="Psilomene",
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Spae. Gloves +3",
    legs="Assid. Pants +1",
    feet={ name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    neck="Loricate Torque +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Sangoma Ring",
    back="Solemnity Cape",
}

--[[
-- This is an alternative idle set for death.
-- It has more MP and less DT.
-- I used this set when I was nuking death on the ambuscade cactus.
-- I made a special death midcast set for that cactus with more mp and less macc.
-- I didn't need macc for the cactus because I was using elemental seal on each cast.
-- MP 1885.  HP 1447 only!  I should have used Psycloth path D feet.
sets.idle.Death = {
    ammo="Psilomene",
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs="Assid. Pants +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','Damage taken-3%','"Mag.Atk.Bns."+4',}},
    neck="Sanctity Necklace",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Mephitas's Ring",
    right_ring="Mephitas's Ring +1",
    back="Solemnity Cape",
}
]]--

-- Refresh, regen, and MP gear.
-- No DT gear here.
-- Refresh: head 1, body 4, pants 1.  Lathi is another 1.  
-- Regen: neck 3, ear1 1, ring1 2, ring2 1.
-- MP 1794.  HP 1666.
sets.idle.Regen = {    
    ammo="Psilomene",
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs="Assid. Pants +1",
    feet={ name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    neck="Bathy Choker +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Infused Earring",
    right_ear="Etiolation Earring",
    left_ring="Paguroidea Ring",
    right_ring="Sheltered Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
}

-- Put your Mana Wall gear here.  It has to stay equipped when taking damage in order to take effect.
sets.buff['Mana Wall'] = {
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    feet="Wicce Sabots +1"
}

-- Added these 2/19/208.  Haven't done anything with them yet.  Might use them later.  See what happens.
sets.buff['Mana Wall'].FastCast = {
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10',}},
    feet="Wicce Sabots +1"
}

sets.buff['Mana Wall'].Engaged = {
    back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10',}},
    feet="Wicce Sabots +1"
}


------------------------------------------------------
-- ENGAGED SETS
------------------------------------------------------

sets.engaged = {}

-- Death engaged set is same as Death idle.
-- So when you engage so you Myrkr, you don't lose MP.
sets.engaged.Death = sets.idle.Death

-- I guess I could put in a lower acc set with more store tp and multi attack.  If I ever need it.
sets.engaged.Acc = {    
    ammo="Amar Cluster",
    head="Blistering Sallet +1",
    body="Jhakri Robe +2",
    hands="Gazu Bracelet +1",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Ramuh Ring +1",
    back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10',}},
}

end
