-- What does dp gun command mean?

packets = require('packets')

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('sammeh_custom_functions.lua')
    --include('whiiskey_include.lua')
end

function job_setup()
	include('Mote-TreasureHunter')
	--state.TreasureMode:set('Tag')
end
	
function user_setup()
	windower.add_to_chat(4,'F11: Auto RA')
	windower.add_to_chat(4,'ALT  F11: WS Selection')
	windower.add_to_chat(4,'CTRL F11: Auto WS')
	-- for Auto RA
	rngdelay = 1
	state.OffenseMode:options('Normal','Acc')
	
        state.IdleMode:options('PDT','Refresh')
	state.TPMode = M{['description']='TP Mode', 'Normal','RACC'}
	--state.RngMode = M{['description']='Ranger Mode', 'Fail-Not','Yoichinoyumi','Fomalhaut','XBow'}
	state.RngMode = M{['description']='Ranger Mode', 'Fomalhaut','Annihilator'}
	state.Bolt = M{['description']='Bolt Mode','Normal','DefDown','Holy Bolt','Bloody Bolt'}
	state.AutoRA = M{['description']='Auto RA','false','true'}
	state.AutoWSMode = M{['description']='Auto WS Mode','false','true'}
	state.AutoWS = M{['description']='Auto WS',"Last Stand","Trueflight","Coronach"}
	state.Arrow = M{['description']='Arrow Mode','Normal'}
	state.Bullet = M{['description']='Bullet','Normal','Stun'}
	
	send_command('alias tp gs c cycle tpmode')
	send_command('alias rngmode gs c cycle rngmode')
	send_command('alias boltmode gs c cycle Bolt')
	send_command('bind f9 gs c cycle RngMode')
	send_command('bind !f9 gs c cycle Arrow')
	send_command('bind ^f9 gs c cycle Bolt')
	send_command('bind ^f10 gs c cycle Bullet')
        send_command('bind f10 gs c cycle idlemode')
	send_command('bind f11 gs c cycle AutoRA')
	send_command('bind ^f11 gs c cycle AutoWSMode')
	send_command('bind !f11 gs c cycle AutoWS')
	--send_command('bind End trueflight')
	--send_command('bind Delete laststand')
	--send_command('bind Home blastshot')
	send_command('bind !f8 ra')
	
	--these ws commands don't work
	--send_command('bind f12 gs c wslist')
	--send_command('bind Delte gs c ws 1')
	--send_command('bind End gs c ws 2')
	--send_command('bind Home gs c ws 3')
	send_command('bind ^= gs c cycle treasuremode')
	select_default_macro_book()
	if player.sub_job == 'NIN' then
	--send_command('@wait 1;input /equip sub "Perun"')   
	end
	--send_command('@wait 1;input /lockstyleset 22')
	
	
	-- Set Common Aliases --
	send_command("alias fc gs equip sets.precast.FastCast")
	send_command("alias preshot gs equip sets.precast.PreShot")
	send_command("alias rngtp gs equip sets.midcast.TP.normal")
	send_command("alias rngtpacc gs equip sets.midcast.TP.RACC")
	send_command("alias wsset gs equip sets.precast.WS")
	send_command("alias agiwsset gs equip sets.precast.WS['Last Stand']")
	send_command("alias mwsset gs equip sets.precast.WS['Trueflight']")
	send_command("alias jr gs equip sets.Jishnus")
	
	add_to_chat(2,'Ranged Weapon:'..player.equipment.range)

	--[[
	if player.equipment.range == "Yoichinoyumi" then
		send_command("gs c set RngMode Yoichinoyumi")
		send_command("dp bow")
		state.AutoWS = M{['description']='Auto WS',"Jishnu's Radiance","Namas Arrow"}
	elseif player.equipment.range == "Fail-Not" then
		send_command("gs c set RngMode Fail-Not")
		send_command("dp bow") 
		state.AutoWS = M{['description']='Auto WS',"Jishnu's Radiance","Apex Arrow"}
	elseif player.equipment.range == "Fomalhaut" then
		send_command("gs c set RngMode Fomalhaut")
		send_command("dp gun")
		state.AutoWS = M{['description']='Auto WS','Last Stand','Trueflight'}
	elseif player.equipment.range == "Annihilator" then
		send_command("gs c set RngMode Annihilator")
		send_command("dp gun")
		state.AutoWS = M{['description']='Auto WS','Coronach','Last Stand','Trueflight'}
	elseif player.equipment.range == "Wochowsen" then
		send_command("gs c set RngMode XBow")
		send_command("dp marksmanship")
		state.AutoWS = M{['description']='Auto WS','Last Stand','Trueflight'}	
	end
	]]--


	if player.equipment.range == "Fomalhaut" then
		send_command("gs c set RngMode Fomalhaut")
		send_command("dp gun")
		state.AutoWS = M{['description']='Auto WS','Last Stand','Trueflight'}
	elseif player.equipment.range == "Annihilator" then
		send_command("gs c set RngMode Annihilator")
		send_command("dp gun")
		state.AutoWS = M{['description']='Auto WS','Coronach','Last Stand','Trueflight'}
	end
	
	
	
	res = require 'resources'
	
	WeaponSkill = {
		["Marksmanship"] = {
			["1"] = "Trueflight",
			["2"] = "Last Stand",
			["3"] = "Blast Shot"
		},
		["Archery"] = {
		    ["1"] = "Jishnu's Radiance",
			["2"] = "Namas Arrow",
			["3"] = "Apex Arrow"
		},
		
	}
	
	
end

	
function init_gear_sets()
	
	
	TP_Hands = "Meg.7 Gloves +2"
	
	if state.RngMode.value == 'Fail-Not' then
	  --RNGWeapon = "Yoichinoyumi"
	  RNGWeapon = "Fail-Not"
	  TP_Ammo = "Chrono Arrow"
	  WS_Ammo = "Chrono Arrow"
	  send_command("alias rngws1 input /ws 'Jishnu\'s Radiance' <t>")
	  send_command("alias rngws2 input /ws 'Namas Arrow' <t>")
	  send_command("alias rngws3 input /ws 'Apex Arrow' <t>")
	  TP_Hands = "Amini Glovelettes +1"
	elseif state.RngMode.value == 'Yoichinoyumi' then
	  RNGWeapon = "Yoichinoyumi"
	  --TP_Ammo = "Yoichi's Arrow"
	  --WS_Ammo = "Yoichi's Arrow"
	  TP_Ammo = "Chrono Arrow"
	  WS_Ammo = "Chrono Arrow"
	  send_command("alias rngws1 input /ws 'Jishnu\'s Radiance' <t>")
	  send_command("alias rngws2 input /ws 'Namas Arrow' <t>")
	  send_command("alias rngws3 input /ws 'Apex Arrow' <t>")
	  TP_Hands = "Amini Glovelettes +1"
	elseif state.RngMode.value == 'Fomalhaut' then 
	  RNGWeapon = "Fomalhaut"
	  TP_Ammo="Chrono Bullet"
	  WS_Ammo="Chrono Bullet"
	  if state.Bullet.value == 'Stun' then
		TP_Ammo="Spartan Bullet"
		WS_Ammo="Spartan Bullet"
	  end
	  TP_Hands = "Meg. Gloves +2"
	  send_command("alias rngws1 input /ws 'Trueflight' <t>")
	  send_command("alias rngws2 input /ws 'Last Stand' <t>")
	  send_command("alias rngws3 input /ws 'Trueflight' <t>")
	elseif state.RngMode.value == 'Annihilator' then 
	  RNGWeapon = "Annihilator"
	  TP_Ammo="Chrono Bullet"
	  WS_Ammo="Chrono Bullet"
	  if state.Bullet.value == 'Stun' then
		TP_Ammo="Spartan Bullet"
		WS_Ammo="Spartan Bullet"
	  end
	  TP_Hands = "Meg. Gloves +2"
	  send_command("alias rngws1 input /ws 'Trueflight' <t>")
	  send_command("alias rngws2 input /ws 'Last Stand' <t>")
	  send_command("alias rngws3 input /ws 'Coronach' <t>")	
	 elseif state.RngMode.value == 'XBow' then
	  RNGWeapon = "Wochowsen"
	  TP_Ammo = "Achiyal. Bolt"
	  WS_Ammo = "Achiyal. Bolt"
	  if state.Bolt.value == 'DefDown' then 
		TP_Ammo = "Abrasion Bolt"
	  elseif state.Bolt.value == 'Holy Bolt' then
	    TP_Ammo = "Righteous Bolt"
	  elseif state.Bolt.value == 'Bloody Bolt' then
	    TP_Ammo = "Bloody Bolt"
	  end
	  send_command("alias rngws2 input /ws 'Wildfire' <t>")
	  send_command("alias rngws3 input /ws 'Slug Shot' <t>")
	  send_command("alias rngws1 input /ws 'Trueflight' <t>")
	end

	
sets.af1 = {
    head="Orion Beret +3",
    body="Orion Jerkin +3",
    hands="Orion Bracers +3",
    legs="Orion Braccae +3",
    feet="Orion Socks +3",
}
	
sets.TreasureHunter = {
    head={ name="Herculean Helm", augments={'"Fast Cast"+2','"Store TP"+2','"Treasure Hunter"+1','Accuracy+4 Attack+4','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    legs={ name="Herculean Trousers", augments={'Pet: STR+9','MND+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    waist="Chaac Belt",
}

---  PRECAST SETS  ---
sets.precast = {}

-- Fast cast sets for spells
sets.precast.FC = {
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Baetyl Pendant",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Rahab Ring",
}

sets.precast.PreShot = {
    range=RNGWeapon,
    ammo=TP_Ammo,
    head="Taeon Chapeau",
    --body="Amini Caban +1",
    body="Oshosi Vest +1",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs="Adhemar Kecks",
    feet="Meg. Jam. +2",
    waist="Impulse Belt",
    back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
}
	
sets.precast.PreShot.Overkill = set_combine(sets.precast.PreShot, {})
	
sets.midcast.TP = {} 
sets.midcast.TP.normal = {
    range=RNGWeapon,
    ammo=TP_Ammo,
    head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
    body="Orion Jerkin +3",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
}

sets.midcast.TP.RACC = {
    range=RNGWeapon,
    ammo=TP_Ammo,
    head="Arcadian Beret +3",
    body="Orion Jerkin +3",
    hands="Orion Bracers +3",
    legs="Orion Braccae +3",
    feet="Orion Socks +3",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt +1",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
}


sets.midcast.TP.MaxRACC = {
    head="Orion Beret +3",
    body="Orion Jerkin +3",
    hands="Orion Bracers +3",
    legs="Orion Braccae +3",
    feet="Orion Socks +3",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}

sets.midcast['Elemental Magic'] = {
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Pet: STR+9','MND+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    --back="Moonlight Cape",	
}

--Job Abilities
sets.precast.JA = {}
sets.precast.JA.Scavenge = {feet="Orion Socks +3"}
sets.precast.JA.Sharpshot = {legs="Orion Braccae +3"}
sets.precast.JA['Bounty Shot'] = { hands="Amini Glove. +1"}
sets.precast.JA.Camouflage = {body="Orion Jerkin +3"}
sets.precast.JA['Eagle Eye Shot'] = {}
sets.precast.JA.Shadowbind = {}
sets.precast.JA.Sharpshot = {}
sets.Barrage = {hands="Orion Bracers +3"}



-- Waltz potency. Waltz received potency. VIT. CHR. HP.
-- Waltz potency total 51: ammo 5, head 11, ear1 5, hand 10, legs 10, feet 10.
-- Waltz potency received total 16: body 13, ring1 3
sets.precast.Waltz = {
    head="Mummu Bonnet +2",
    body="Passion Jacket",
    hands={ name="Herculean Gloves", augments={'"Waltz" potency +10%','Accuracy+15','Attack+6',}},
    --legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'Attack+17','"Waltz" potency +10%','VIT+12','Accuracy+13',}},
    --neck="Unmoving Collar +1",
    waist="Flume Belt +1",
    --left_ear="Roundel Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Asklepian Ring",
    right_ring="Valseur's Ring",
    back={ name="Moonlight Cape", priority=15},
}		

--sets.precast.Waltz['Healing Waltz'] = {legs="Dashing Subligar"}

--[[
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
]]--


  
-- WS Sets
sets.precast.WS = {
    ammo=TP_Ammo,
    head="Orion Beret +3",
    body={ name="Herculean Vest", augments={'Accuracy+11 Attack+11','Weapon skill damage +5%','AGI+9','Accuracy+13','Attack+11',}},
    --body="Orion Jerkin +3",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    --legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Rng.Acc.+26','Weapon skill damage +3%','AGI+14','Rng.Atk.+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}



sets.precast.WS['Last Stand'] = {
    ammo=TP_Ammo,
    head="Orion Beret +3",
    body={ name="Herculean Vest", augments={'Accuracy+11 Attack+11','Weapon skill damage +5%','AGI+9','Accuracy+13','Attack+11',}},
    --body="Orion Jerkin +3",
    hands="Meg. Gloves +2",
    --legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    --legs="Meg. Chausses +2",
    legs="Arcadian Braccae +3",
    feet={ name="Herculean Boots", augments={'Rng.Acc.+26','Weapon skill damage +3%','AGI+14','Rng.Atk.+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']

sets.precast.WS['Last Stand'].Acc = {
    ammo=TP_Ammo,
    head="Orion Beret +3",
    body="Orion Jerkin +3",
    hands="Meg. Gloves +2",
    --legs="Meg. Chausses +2",
    legs="Arcadian Braccae +3",
    feet="Orion Socks +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.precast.WS.Coronach = {
    ammo=TP_Ammo,
    head="Orion Beret +3",
    body={ name="Herculean Vest", augments={'Accuracy+11 Attack+11','Weapon skill damage +5%','AGI+9','Accuracy+13','Attack+11',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Rng.Acc.+26','Weapon skill damage +3%','AGI+14','Rng.Atk.+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.precast.WS['Split Shot'] = {
    ammo=TP_Ammo,
    head="Orion Beret +3",
    body="Orion Jerkin +3",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Orion Socks +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.precast.WS['Jishnu\'s Radiance'] = {
		ammo=TP_Ammo,
		--head={ name="Herculean Helm", augments={'Rng.Acc.+28','Weapon skill damage +3%','DEX+11','Rng.Atk.+12',}},
		head="Orion Beret +3",
		body="Meg. Cuirie +2",
		hands="Meg. Gloves +2",
		legs="Darraigner's Brais",
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Regal Ring",
		right_ring="Dingir Ring",
		--back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10',}},
	        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.Jishnus = sets.precast.WS['Jishnu\'s Radiance']

sets.precast.WS['Trueflight'] = {
    ammo="Devastating Bullet",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    --head="Orion Beret +3",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    --hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    hands="Leyline Gloves",
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    neck="Sanctity Necklace",
    --neck="Baetyl Pendant",
    --waist="Fotia Belt",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

--proc set for 1st magian trial	

--[[
sets.precast.WS.Trueflight = {
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
]]--

sets.precast.WS['Wildfire'] = sets.precast.WS['Trueflight']
sets.precast.WS['Aeolian Edge'] = sets.precast.WS['Trueflight']

---  AFTERCAST SETS  ---
sets.idle = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonlight Cape",
}

sets.idle.PDT = sets.idle

sets.idle.Refresh = {
    head={ name="Herculean Helm", augments={'Attack+4','"Mag.Atk.Bns."+24','"Refresh"+2',}},
    body="Mekosu. Harness",
    hands={ name="Herculean Gloves", augments={'Pet: "Store TP"+2','Enmity-2','"Refresh"+2','Accuracy+4 Attack+4',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    feet={ name="Herculean Boots", augments={'"Dual Wield"+3','Crit. hit damage +1%','"Refresh"+2',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Impreg. Earring",
    right_ear="Genmei Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

sets.Idle = sets.idle
sets.Idle.Current = sets.Idle

--[[
sets.engaged = {
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    --head="Adhemar Bonnet +1",
    --body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Adhemar Jacket +1",
    --hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands="Floral Gauntlets",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    legs="Samnuha Tights",
    --feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},    
    neck="Combatant's Torque",
    --neck="Iskur Gorget",
    waist="Olseni Belt",
    --waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    --left_ear="Dedition Earring",
    --right_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    --right_ring="Rajas Ring",
    right_ring="Petrov Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
]]--

-- Set for trials in abyssea with kraken club
-- No extra acc, minimal multi-attack, max store tp


sets.engaged = {
    head={ name="Herculean Helm", augments={'"Store TP"+5','Pet: AGI+8','Quadruple Attack +2',}},
    body="Mummu Jacket +2",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Adhemar Kecks +1",
    feet={ name="Herculean Boots", augments={'"Store TP"+8','"Snapshot"+2','Accuracy+5 Attack+5',}},
    neck="Iskur Gorget",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Ilabrat Ring",
    right_ring="Rajas Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
}


sets.engaged.Acc = {
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Adhemar Jacket +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Cacoethic Ring +1",
    back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
}
	
end

function job_precast(spell)
	last_precast = spell
    handle_equipping_gear(player.status)
	checkblocking(spell)
	if not buffactive["Velocity Shot"] and spell.name == "Ranged" then
	  velocity_recasttime = windower.ffxi.get_ability_recasts()[129] 
	  if velocity_recasttime == 0 then 
	    windower.add_to_chat(8,"Turn on Velocity Shot!")
	  else
	    windower.add_to_chat(8,"You need to turn on Velocity Shot!	Time Remaining: "..velocity_recasttime)
	  end
	end
	if spell.name == 'Utsusemi: Ichi' and (buffactive['Copy Image (3)'] or buffactive ['Copy Image (4+)']) then
	  cancel_spell()
	  send_command('@wait 1;')
	  return
	end
    if spell.name == 'Ranged' then
        equip(sets.precast.PreShot)
        if buffactive.Overkill then
            equip(sets.precast.PreShot.Overkill)
        end
    end
end

function job_post_precast(spell)
  if spell.type == "WeaponSkill" and buffactive["Velocity Shot"] and spell.name ~= "Trueflight" and spell.name ~= "Wildfire" and (spell.skill == "Marksmanship" or spell.skill == "Archery") then
		if sets.precast.WS[spell.name] then 
			equip(set_combine(sets.precast.WS[spell.name], {body="Amini Caban +1"}))
		else
			equip(set_combine(sets.precast.WS, {body="Amini Caban +1"}))
		end
  end
	--weathercheck(spell.element)
end

function job_post_midcast(spell)
    if spell.english == 'Sneak' and buffactive.sneak and spell.target.type == 'SELF' then
        send_command('@wait 1;cancel 71;')
    end
	if spell.name == 'Utsusemi: Ichi' then
	  send_command('cancel Copy Image|Copy Image (2)')
	end
	
	if spell.name == 'Ranged' then
	 if state.TPMode.value == 'Normal' then
	   equip(sets.midcast.TP.normal)
	 elseif state.TPMode.Value == 'RACC' then
	   equip(sets.midcast.TP.RACC)
	 end
     if buffactive.Barrage then
        equip(sets.Barrage)
     end
    end
	if spell.type == "WeaponSkill" then
	  tpspent = spell.tp_cost
	end

end        

function job_aftercast(spell)
	if state.SpellDebug.value == "On" then 
      spelldebug(spell)
	end
	handle_equipping_gear(player.status)
    equip(sets.idle)
end

function status_change(new,tab)
	handle_equipping_gear(player.status)
    if new == 'Resting' then
        equip(sets.Resting)
    else
        equip(sets.idle)
    end
end

function job_state_change(stateField, newValue, oldValue)
    job_handle_equipping_gear(player.status)
	equip(sets.idle)
end


function job_handle_equipping_gear(playerStatus, eventArgs)    	
	init_gear_sets()
	disable_specialgear()
end



function select_default_macro_book()
    set_macro_page(4, 1)
end


 function job_self_command(command)
	if command[1]:lower() == "ws" and command[2] ~= nil then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.range == nil or EquipedGear.equipment.range == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.range).id].skill].en
		end
		send_command('input /ws '..WeaponSkill[CurrentSkill][command[2]])
	end
	if command[1]:lower() == "wslist" then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.range == nil or EquipedGear.equipment.range == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.range).id].skill].en
		end
		windower.add_to_chat(2,"WS List:")
		for i,v in pairs(WeaponSkill[CurrentSkill]) do
			windower.add_to_chat(2,i..") "..v)
		end
	end
end

windower.raw_register_event('incoming chunk', function(id,original,modified,injected,blocked)
	local self = windower.ffxi.get_player()
    if id == 0x028 then
		local packet = packets.parse('incoming', original)
		local category = packet['Category']
		if packet.Actor == self.id and category == 2 then 
			if state.AutoRA.value == 'true' then 
				if state.AutoWSMode.value == 'true' and player.tp >= 1000 then 
					send_command('wait '..rngdelay..';input /ws "'..state.AutoWS.value..'" <t>')
				else 
					send_command('wait '..rngdelay..'; input /ra <t>')
				end
			end
		end
		if packet.Actor == self.id and category == 3 and state.AutoRA.value == 'true' then 
			send_command('wait 3.5; input /ra <t>')
		end
	end
end)

--[[
windower.raw_register_event('incoming text', function(original)
	if string.contains(original,"You must wait longer") then 
		--print('Interrupted:'..last_precast.name,os.clock())
		if last_precast.name == 'Ranged' then 
			send_command('wait .5; input /ra <t>')
			return true
		end
	end
end)

]]
