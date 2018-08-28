--TODO
--Langly's warp ring rule
--DW sets
--acc sets


function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	include('sammeh_custom_functions.lua')
	--include('whiiskey_include.lua')	
end

function user_setup()
	state.IdleMode:options('Normal','Reraise','DT','MEVA')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c berserkmode')
	--send_command('bind f12 gs c wslist')
	
	--state.OffenseMode = M{['description']='Engaged Mode', 'Normal','Reraise','DT','MedAccuracy','HighAccuracy','ShieldBlock','MEVA'}
	state.OffenseMode = M{['description']='Engaged Mode', 'Normal','DT'}
	state.BerserkMode = M{['description']='Berserk Mode', 'Normal','Auto'}
    select_default_macro_book()
	
	-- Set Common Aliases --
	send_command("alias chang gs c equip chango")
	send_command("alias chango gs c equip chango")
	send_command("alias brav gs c equip brav")
	send_command("alias mont gs c equip mont")
	send_command("alias alg gs c equip algol")
	send_command("alias algol gs c equip algol")
	send_command("alias msw gs c equip msw")
	send_command("alias irr gs c equip irr")
	send_command("alias scy gs c equip scythe")
	send_command("alias scythe gs c equip scythe")
	send_command("alias scy2 gs c equip mscythe")
	send_command("alias mscy gs c equip mscythe")
	send_command("alias mscythe gs c equip mscythe")
	send_command("alias spear gs c equip spear")
	send_command("alias quint gs c equip quint")	
	send_command("alias sword gs c equip sword")
	send_command("alias swordd gs c equip swordd")
	send_command("alias axe gs c equip axe")
	send_command("alias club gs c equip club")
	
	send_command("alias wsset gs equip sets.ws")
	send_command("alias mwsset gs equip sets.ws.magic")
	send_command("alias strwsset gs equip sets.ws.strbased")
	send_command("alias vitwsset gs equip sets.ws.vitbased")
	send_command("alias eng gs equip sets.engaged")
	send_command("alias enmity gs equip sets.enmity")
	send_command("alias meva gs equip sets.meva")
	send_command("alias idle gs equip sets.Idle.Current")
	send_command("alias shieldblock gs equip sets.engaged.ShieldBlock")
	--send_command('@wait 5;input /lockstyleset 15')
	--send_command('@wait 5;input /lockstyleset 27')
	send_command("alias g11_m2g11 input /ja Defender <me>")
	send_command("alias g11_m2g12 input /ja Restraint <me>")
	send_command("alias g11_m2g13 input /ja Berserk <me>")
	send_command("alias g11_m2g14 input /ja Warcry <me>")
	send_command("alias g11_m2g15 input /ja Aggressor <me>")
	send_command("alias g11_m2g16 gs c ws 1")
	send_command("alias g11_m2g17 gs c ws 2")
	send_command("alias g11_m2g18 gs c ws 3")

	send_command("bind end gs c ws 1")
	send_command("bind home gs c ws 2")
	send_command("bind delete gs c ws 3")	
	send_command("bind ^numpad1 gs c ws 1")
	send_command("bind ^numpad2 gs c ws 2")
	send_command("bind ^numpad3 gs c ws 3")
	send_command("bind ^numpad4 gs c ws 4")
	send_command("bind ^numpad5 gs c ws 5")
	send_command("bind ^numpad6 gs c ws 6")
	
	res = require 'resources'
	
	WeaponSkill = {
		["Great Sword"] = {
			[1] = "Resolution",
			[2] = "Herculean Slash",
			[3] = "Shockwave",
			[4] = "Power Slash",
			[5] = "Hard Slash",
			[6] = "Freezebite",
		},
		["Great Axe"] = {
			[1] = "Upheaval",
			[2] = "King's Justice",
			[3] = "Full Break",
			[4] = "Metatron Torment",
			[5] = "Steel Cyclone",
			[6] = "Armor Break",
		},
		["Axe"] = {
			[1] = "Mistral Axe",
			[2] = "Calamity",
			[3] = "Cloudsplitter"
		},
		["Sword"] = {
			[1] = "Savage Blade",
			[2] = "Requiescat",
			[3] = "Vorpal Blade"
		},
		["Club"] = {
			[1] = "Realmrazer",
			[2] = "Black Halo",
			[3] = "Judgment"
		},
		["Dagger"] = {
			[1] = "Evisceration",
			[2] = "Aeolian Edge",
			[3] = "Exenterator"
		},
		["Polearm"] = {
			[1] = "Stardiver",
			[2] = "Penta Thrust",
			[3] = "Double Thrust"
		},
		["Scythe"] = {
			[1] = "Entropy",
			[2] = "Cross Reaper",
			[3] = "Vorpal Scythe"
		},
		["Staff"] = {
			[1] = "Cataclysm",
			[2] = "Earth Crusher",
			[3] = "Shattersoul"
		},

	}

	--#tpsets
    --Maybe if I comment it out then lua will load when you first log in.
	--update_combat_weapon()
    --update_melee_groups()
end

	
function init_gear_sets()

sets.af1 = {
    head="Pummeler's Mask +2",
    body="Pumm. Lorica +3",
    hands="Pumm. Mufflers +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +2",
}	

sets.af2 = {
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body={ name="Agoge Lorica +3", augments={'Enhances "Aggressive Aim" effect',}},
    hands={ name="Agoge Mufflers +3", augments={'Enhances "Mighty Strikes" effect',}},
    legs={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}},
    feet={ name="Agoge Calligae +3", augments={'Enhances "Tomahawk" effect',}},
}	
	sets.chango = {
		main="Chango",
		sub="Utu Grip"
	}
	sets.brav = {
		main="Bravura",
		sub="Utu Grip"
	}
	sets.mont = {
		main="Montante +1",
		sub="Utu Grip"
	}
	sets.algol = {
		main="Raetic Algol +1",
		sub="Utu Grip"
	}
	sets.msw = {
		main="Mercurial Sword",
		sub="Utu Grip"
	}
	sets.irr = {
		main="Irradiance Blade",
		sub="Utu Grip"
	}	
	sets.scythe = {
		main="Raetic Scythe +1",
		sub="Utu Grip"
	}
	sets.mscythe = {
		main="Maliya Sickle",
		sub="Utu Grip"
	}
	sets.spear = {
		main="Exalted Spear +1",
		sub="Utu Grip"
	}
	sets.quint = {
		main="Quint Spear",
		sub="Utu Grip"
	}
	sets.sword = {
		main="Reikiko",
		sub="Blurred Shield +1"
	}
	sets.swordd = {
		main="Reikiko",
		sub="Adapa Shield"
	}
	sets.axe = {
		main="Barbarity",
		sub="Blurred Shield +1"
	}
	sets.club = {
		main="Beryllium Mace +1",
		sub="Blurred Shield +1"
	}	
	
	
	
	
	
	sets.meva = {
		ammo="Staunch Tathlum",
		head="Volte Salade",
		body="Pumm. Lorica +3",
		hands="Pumm. Mufflers +2",
		legs="Volte Brayettes",
		feet="Pumm. Calligae +2",
		neck="Warder's Charm +1",
		waist="Engraved Belt",
		left_ear="Eabani Earring",
		right_ear="Flashward Earring",
		left_ring="Purity Ring",
		right_ring="Vengeful Ring",
		back={ name="Cichol's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Mag. Evasion+15',}},
	}

sets.dt = {
    ammo="Vanir Battery",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Tartarus Platemail",
    hands={ name="Agoge Mufflers +3", augments={'Enhances "Mighty Strikes" effect',}},
    legs="Pumm. Cuisses +3",
    feet={ name="Agoge Calligae +3", augments={'Enhances "Tomahawk" effect',}},
    neck="Loricate Torque +1",
    waist="Engraved Belt",
    left_ear="Static Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.dtenmity = {
	    ammo="Staunch Tathlum",
		head="Pummeler's Mask +2",
		body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
		hands="Pumm. Mufflers +2",
		legs="Sulev. Cuisses +2",
		feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Cryptic Earring",
		right_ear="Trux Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Philidor Mantle",
	}
	
sets.engaged = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+10 Attack+10','"Dbl.Atk."+5','DEX+5','Accuracy+15','Attack+15',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+28','"Dbl.Atk."+5','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    --left_ring="Hetairoi Ring",
    --left_ring="Petrov Ring",
    left_ring={ name="Petrov Ring", priority=0},
    --right_ring="Hetairoi Ring",
    --right_ring="Niqmaddu Ring",
    right_ring={ name="Niqmaddu Ring", priority=15},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.engaged.DT = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Tartarus Platemail",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

--210 TP per hit
sets.engaged.DT30 = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Attack+30','"Store TP"+8','VIT+8','Accuracy+11',}},
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

sets.engaged.Chango = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+10 Attack+10','"Dbl.Atk."+5','DEX+5','Accuracy+15','Attack+15',}},
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    --left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

sets.engaged.Chango.DT = sets.engaged.DT

sets.engaged.Bravura = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+10 Attack+10','"Dbl.Atk."+5','DEX+5','Accuracy+15','Attack+15',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+28','"Dbl.Atk."+5','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    --right_ear="Brutal Earring",
    right_ear="Telos Earring",
    --left_ring="Hetairoi Ring",
    --left_ring="Petrov Ring",
    left_ring={ name="Petrov Ring", priority=0},
    --right_ring="Hetairoi Ring",
    --right_ring="Niqmaddu Ring",
    right_ring={ name="Niqmaddu Ring", priority=15},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.engaged.Bravura.DT = sets.engaged.DT

sets.engaged["Montante +1"] = sets.engaged.Chango
sets.engaged["Montante +1"].DT = sets.engaged.DT

sets.engaged["Raetic Algol +1"] = sets.engaged.Chango
sets.engaged["Raetic Algol +1"].DT = sets.engaged.DT

sets.engaged["Mercurial Sword"] = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Attack+30','"Store TP"+8','VIT+8','Accuracy+11',}},
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25','"Store TP"+7','AGI+10','Attack+6',}},
    feet="Flam. Gambieras +2",
    neck="Ainia Collar",
    waist="Tempus Fugit",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

sets.engaged["Irradiance Blade"] = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+10 Attack+10','"Dbl.Atk."+5','DEX+5','Accuracy+15','Attack+15',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25','"Store TP"+7','AGI+10','Attack+6',}},
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

sets.engaged['Quint Spear'] = sets.engaged["Mercurial Sword"]

sets.enmity = {
    ammo="Sapience Orb",
    head="Pummeler's Mask +2",
    body="Emet Harness +1",
    hands="Pumm. Mufflers +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+28','"Dbl.Atk."+5','Accuracy+10',}},
    neck="Moonlight Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Petrov Ring",
    right_ring="Eihwaz Ring",
}

sets.engaged.Reraise = set_combine(sets.engaged,{body="Twilight Mail",head="Twilight Helm"})
	sets.engaged.HighAccuracy = {
	    ammo="Ginsen",
		head="Pummeler's Mask +2",
		body="Pumm. Lorica +3",
		hands="Pumm. Mufflers +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +2",
		neck="Combatant's Torque",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	sets.engaged.MedAccuracy = {
	    ammo="Ginsen",
		head="Flamma Zucchetto +2",
		body="Pumm. Lorica +3",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +2",
		neck="Combatant's Torque",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	sets.engaged.ShieldBlock = {  
		ammo="Staunch Tathlum",  --2
    		-- head="Sulevia's Mask +2", -- 6
			head={ name="Valorous Mask", augments={'Mag. Acc.+22','MND+8','Chance of successful block +10','Accuracy+13 Attack+13','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    		body="Sulevia's Plate. +2", -- 9 
    		hands="Agoge Mufflers +3", -- pdt 6
    		legs="Arjuna Breeches", -- pdt 4
    		feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}, -- pdt 4
    		neck="Loricate Torque +1", -- 6
			--neck="Combatant's Torque",
    		waist="Ioskeha Belt",
    		left_ear="Thureous Earring",
    		right_ear="Telos Earring",
    		left_ring="Niqmaddu Ring",
    		right_ring="Defending Ring", -- 10 
    		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- Axe + Shield = 4 pdt + 5 DT.    Totals: DT-38, PDT-18  (total PDT: 56) (should consider swapping neck)
	sets.engaged.MEVA = sets.meva



sets.ws = {
		-- ammo="Seeth. Bomblet +1",
		ammo="Knobkierrie",   -- Losing 13 acc for +10 att +6WSD; not sure if that's a gr8 thing.
		head={ name="Valorous Mask", augments={'Weapon skill damage +5%','AGI+7','Accuracy+15','Attack+10',}},
		body="Pumm. Lorica +3",
		hands="Sulev. Gauntlets +2",
		legs={ name="Valor. Hose", augments={'Accuracy+29','"Dbl.Atk."+3','STR+15',}},
		feet="Sulev. Leggings +2",
		right_ear="Telos Earring",
		left_ear="Cessance Earring",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

sets.ws.vitbased = set_combine(sets.ws,{
		head="Sulevia's Mask +2",
		body="Pumm. Lorica +3",
		right_ring="Regal Ring",
		legs="Sulev. Cuisses +2",
		feet="Pumm. Calligae +2",
		back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','"Dbl.Atk."+10',}},
})

sets.ws.strbased = set_combine(sets.ws,{
	ammo="Seeth. Bomblet +1",
	head={ name="Argosy Celata +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Argosy Hauberk", augments={'STR+10','DEX+10','Attack+15',}},
	hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
    feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
})

sets.ws.magic = {
    ammo="Seeth. Bomblet +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Founder's Gauntlets", augments={'STR+8','Attack+15','"Mag.Atk.Bns."+13','Phys. dmg. taken -3%',}},
    legs="Flamma Dirs +2",
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.ws.wsd = {
	    ammo="Knobkierrie",
		head="Agoge mask +3",
		body="Pumm. Lorica +3",
		hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

--GA
	
sets.ws["King\'s Justice"] = {
    ammo="Seeth. Bomblet +1",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

sets.ws["Fell Cleve"] = sets.ws.strbased


sets.ws["Metatron Torment"] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
}

sets.ws["Upheaval"] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Pumm. Lorica +3",
    hands={ name="Odyssean Gauntlets", augments={'Accuracy+19','Weapon skill damage +5%',}},
    legs="Pumm. Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
}

sets.ws["Full Break"] = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

sets.ws["Armor Break"] = sets.ws["Full Break"]



-- GS
sets.ws["Resolution"] = {
    ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
    --hands="Sulev. Gauntlets +2",
    hands="Argosy Mufflers +1",
    legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
    --feet="Sulev. Leggings +2",
    feet="Argosy Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

sets.ws["Scourge"] = sets.ws.wsd

sets.ws["Shockwave"] = {
    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
sets.ws["Freezebite"] = sets.ws.magic



--SWORD
sets.ws["Sangine Blade"] = {
    ammo="Knobkierrie",
    head="Pixie Hairpin +1",
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Founder's Gauntlets", augments={'STR+8','Attack+15','"Mag.Atk.Bns."+13','Phys. dmg. taken -3%',}},
    legs="Flamma Dirs +2",
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Shiva Ring +1",
    right_ring="Archon Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}

sets.ws["Savage Blade"] = {
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+22','Weapon skill damage +3%','VIT+1','Accuracy+1',}},
    feet="Sulev. Leggings +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

--AXE
sets.ws["Decimation"] = sets.ws.strbased
sets.ws["Rampage"] = sets.ws.strbased
sets.ws["Mistral Axe"] = set_combine(sets.ws.wsd, {neck="Caro Necklace",waist="Engraved Belt"})
sets.ws["Cloudsplitter"] = {
    ammo="Seeth. Bomblet +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Founder's Gauntlets", augments={'STR+8','Attack+15','"Mag.Atk.Bns."+13','Phys. dmg. taken -3%',}},
    legs="Flamma Dirs +2",
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
sets.ws["Mistral Axe"] = sets.ws["Savage Blade"]


--CLUB
sets.ws["Judgment"] = sets.ws.savageblade
sets.ws["True Strike"] = sets.ws.wsd
sets.ws["Black Halo"] = sets.ws.savageblade
sets.ws["Flash Nova"] = sets.ws.magic

--SCYTHE
sets.ws["Cross Reaper"] = sets.ws["Savage Blade"]

--POLEARM
sets.ws["Stardiver"] = sets.ws["Resolution"]
sets.ws["Sonic Thrust/ch"] = sets.ws["Resolution"]

--DAGGER
sets.ws["Aeolian Edge"] = {
    ammo="Seeth. Bomblet +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Founder's Gauntlets", augments={'STR+8','Attack+15','"Mag.Atk.Bns."+13','Phys. dmg. taken -3%',}},
    legs="Flamma Dirs +2",
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}


--STAFF
sets.ws["Cataclysm"] = sets.ws.magic
sets.ws["Earth Crusher"] = sets.ws.magic

	
    ---  PRECAST SETS  ---
	sets.precast = {}
    sets.precast.JA = set_combine(sets.enmity, {})
	sets.precast.JA.Berserk = set_combine(sets.precast.JA, {back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},body="Pumm. Lorica +3",feet="Agoge Calligae +3"})
	sets.MaxBerserk = set_combine(sets.precast.JA, {back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},body="Pumm. Lorica +3",feet="Agoge Calligae +3",main="Instigator"})
	sets.precast.JA.Warcry = set_combine(sets.precast.JA, {head="Agoge mask +3"})
	sets.precast.JA.Aggressor = set_combine(sets.precast.JA, {head="Pummeler's Mask +2",body="Agoge Lorica +3"})
	sets.precast.JA['Mighty Strikes'] = set_combine(sets.precast.JA, {hands="Agoge Mufflers +3"})
	sets.precast.JA['Defender'] = set_combine(sets.precast.JA, {hands="Agoge Mufflers +3"})
	sets.precast.JA['Blood Rage'] = set_combine(sets.precast.JA, {body="Boii Lorica +1"})
	sets.precast.Restraint = set_combine(sets.precast.JA, {hands="Boii Mufflers +1"})
	sets.precast.JA.Tomahawk = set_combine(sets.precast.JA, {ammo="Thr. Tomahawk",feet="Agoge Calligae +3"})
	sets.precast.Ranged = { ammo="Dart" }


	
	sets.CurePotencyRecv = { 
		body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
		legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
		feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
	}
	
	sets.precast.WS = sets.ws
	
	sets.precast.FastCast = {
		ammo="Impatiens",
		head={ name="Odyssean Helm", augments={'Mag. Acc.+19','"Fast Cast"+6','AGI+6','"Mag.Atk.Bns."+3',}},
		body={ name="Odyss. Chestplate", augments={'Mag. Acc.+14','"Fast Cast"+5','"Mag.Atk.Bns."+6',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Arjuna Breeches",
		feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+4','Mag. Acc.+8',}},
		neck="Voltsurge Torque",
		waist="Flume Belt +1",
		left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Weather. Ring",
		right_ring="Defending Ring",
		back="Moonbeam Cape",
	}

	
    sets.midcast = {}
    
    ---  AFTERCAST SETS  ---
sets.Idle = {
    ammo="Staunch Tathlum +1",
    head="Sulevia's Mask +2",
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Genmei Earring",
    right_ear="Impreg. Earring",
    left_ring="Defending Ring",
    right_ring="Paguroidea Ring",
    back="Solemnity Cape",
}
	
	sets.Idle.Current = sets.Idle
    sets.Resting = sets.Idle
	
	sets.WakeSleep = {neck="Vim Torque +1"}
	sets.ProtectBuff = {ring1="Sheltered Ring"}

end



function job_pretarget(spell) 
checkblocking(spell)
end


function job_precast(spell)
    handle_equipping_gear(player.status)
	if spell.name == 'Utsusemi: Ichi' and (buffactive['Copy Image (3)'] or buffactive ['Copy Image (4+)']) then
	  cancel_spell()
	  send_command('@wait 1;')
	  equip(sets.Idle.Current)
	  return
	end
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif string.find(spell.name,'Cur') and spell.name ~= 'Cursna' then
        equip(sets.precast.Cure)
    elseif spell.skill == 'EnhancingMagic' then
        equip(sets.precast.EnhancingMagic)
    elseif spell.action_type == 'Magic' then
        equip(sets.precast.FastCast)
    end
	if spell.name == 'Ranged' then
		equip(sets.precast.Ranged)
	end	
end

function job_post_precast(spell)
	if player.tp < 2250 and spell.type == 'WeaponSkill' and player.equipment.main == "Chango" then
		equip({left_ear="Moonshade Earring"})
		windower.add_to_chat(10,"Adding in Moonshade Earring for more TP:"..player.tp)
	elseif player.tp < 2750 and spell.type == 'WeaponSkill' then
		windower.add_to_chat(10,"Adding in Moonshade Earring for more TP:"..player.tp)
		equip({left_ear="Moonshade Earring"})
	end
	if spell.name == "Berserk" and state.BerserkMode.value == "Auto" then
	   currentMain = player.equipment.main
	   currentSub = player.equipment.sub
	   windower.add_to_chat("Current Main: "..currentMain..", Current Sub: "..currentSub)
	   equip(sets.MaxBerserk)
	end
end

function job_midcast(spell)
	if spell.name == 'Ranged' then
		equip(sets.precast.Ranged)
	end	
	if spell.action_type == 'Magic' then 
		equip(sets.dtenmity)
	end
	if spell.name:contains('Utsusemi') then
		equip(sets.precast.FastCast)
	end
end

function job_post_midcast(spell)
    if spell.name == 'Utsusemi: Ichi' then
	  send_command('cancel Copy Image|Copy Image (2)')
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
    equip(sets.Idle.Current)    
end

function job_post_aftercast(spell)
	if spell.type == "WeaponSkill" and state.BerserkMode.value == "Auto" and windower.ffxi.get_ability_recasts()[1] == 0 then
	   currentMain = player.equipment.main
	   currentSub = player.equipment.sub
	   windower.add_to_chat(">> Triggering auto-berserk <<")
	   --equip(sets.MaxBerserk)
	   send_command("@wait 2.5;input /ja Berserk <me>")
	end
	if spell.name == "Berserk" and state.BerserkMode.value == "Auto" and currentMain and currentSub then
		equip({main=currentMain,sub=currentSub})
	end
end

function status_change(new,tab)	
    handle_equipping_gear(player.status)
    if new == 'Resting' then
        equip(sets.Resting)
    else
        equip(sets.Idle.Current)
    end
end


function job_buff_change(status,gain_or_loss)
   --job_handle_equipping_gear(player.status)
   if (gain_or_loss) then  
     add_to_chat(4,'------- Gained Buff: '..status..'-------')
	 if status == "sleep" then
	   equip(sets.WakeSleep)
	 end
	 if status == "KO" then
	   send_command('input /party These tears... they sting-wing....')
	 end
   else 
     add_to_chat(3,'------- Lost Buff: '..status..'-------')
   end
 end

 function job_self_command(command)
	if command[1]:lower() == "ws" and command[2] ~= nil then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.main == nil or EquipedGear.equipment.main == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.main).id].skill].en
		end
		send_command('input /ws '..WeaponSkill[CurrentSkill][tonumber(command[2])])
	end
	if command[1]:lower() == "wslist" then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.main == nil or EquipedGear.equipment.main == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.main).id].skill].en
		end
		windower.add_to_chat(2,"WS List:")
		for i,v in pairs(WeaponSkill[CurrentSkill]) do
			windower.add_to_chat(2,i..") "..v)
		end
	end
	if command[1]:lower() == "berserkmode" then
	   currentMain = player.equipment.main
	   currentSub = player.equipment.sub
	   send_command('gs c cycle BerserkMode')
	end
	
	if command[1] == 'equip' then
		if command[2] == nil then
			windower.add_to_chat(2,"No weapon specified")
		else
			equip(sets[command[2]])
			state.CombatWeapon:set(sets[command[2]].main)
			handle_equipping_gear(player.status)
		end
    end 
    	
end

function wslist()
	local EquipedGear = windower.ffxi.get_items()
	local CurrentSkill
	if EquipedGear.equipment.main == nil or EquipedGear.equipment.main == 0 then 
	  CurrentSkill = "Hand-to-Hand"
	else 
	  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.main).id].skill].en
	end
	windower.add_to_chat(2,CurrentSkill.." WS List:")
	--for i,v in pairs(WeaponSkill[CurrentSkill]) do
		--windower.add_to_chat(2,i..") "..v)
	--end
	--windower.add_to_chat(2,"1) "..WeaponSkill[CurrentSkill]["1"])
	--windower.add_to_chat(2,"2) "..WeaponSkill[CurrentSkill]["2"])
	--windower.add_to_chat(2,"3) "..WeaponSkill[CurrentSkill]["3"])
	
	for i,v in ipairs(WeaponSkill[CurrentSkill]) do
	    windower.add_to_chat(2,i..") "..v)
	end
end

function job_state_change(stateField, newValue, oldValue)
    job_handle_equipping_gear(player.status)
	equip(sets.Idle.Current)
end

--#tpsets
function job_status_change(newStatus, oldStatus, eventArgs)
	update_combat_weapon()
	update_melee_groups()
end 

--#tpsets
function update_combat_weapon()
	if player.equipment.main == nil then
		windower.add_to_chat(2,"CombatWeapon nil.  Hit f12 after inventory loads")
	else
		state.CombatWeapon:set(player.equipment.main)
	end
end

--#tpsets
--copied from BLU, do that's why Tizona
function update_melee_groups()

    classes.CustomMeleeGroups:clear()
    -- mythic AM	
    if player.equipment.main == 'Tizona' then
        if buffactive['Aftermath: Lv.3'] then
            classes.CustomMeleeGroups:append('AM3')
        end
    end

end

--#tpsets
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
job_status_change()
local msg = 'Melee'
if state.CombatForm.has_value then
msg = msg .. ' (' .. state.CombatForm.value .. ')'
end
if state.CombatWeapon.has_value then
msg = msg .. ' (' .. state.CombatWeapon.value .. ')'
end
msg = msg .. ': '
msg = msg .. state.OffenseMode.value
if state.HybridMode.value ~= 'Normal' then
msg = msg .. '/' .. state.HybridMode.value
end
msg = msg .. ', WS: ' .. state.WeaponskillMode.value
if state.DefenseMode.value ~= 'None' then
msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
end
if state.Kiting.value == true then
msg = msg .. ', Kiting'
end
if state.PCTargetMode.value ~= 'default' then
msg = msg .. ', Target PC: '..state.PCTargetMode.value
end
if state.SelectNPCTargets.value == true then
msg = msg .. ', Target NPCs'
end
add_to_chat(122, msg)
handle_equipping_gear(player.status)
wslist()
eventArgs.handled = true
end

function job_handle_equipping_gear(playerStatus, eventArgs)    	
	disable_specialgear()
    if buffactive.sleep then
	equip(sets.WakeSleep)
	end
	if playerStatus == 'Idle' then
        equip(sets.Idle.Current)
    end
    
    if player.equipment.main == 'Bravura' then
    	if buffactive['Aftermath'] then   
    	    sets.engaged.Bravura.DT = sets.engaged.DT30
    	else
    	    sets.engaged.Bravura.DT = sets.engaged.DT
    	end
    end

        --[[
        if state.IdleMode.value == "Reraise" then
	   sets.Idle.Current = set_combine(sets.Idle,{body="Twilight Mail",head="Twilight Helm"})   
	elseif state.IdleMode.value == "MEVA" or state.OffenseMode.value == "MEVA" then
		sets.Idle.Current = sets.meva
	elseif state.IdleMode.value == "DT" or state.OffenseMode.value == "DT" then
		if buffactive['Aftermath'] then
			sets.Idle.Current = sets.dt30
			sets.engaged.DT = sets.dt30
		else
			sets.Idle.Current = sets.dt
			sets.engaged.DT = sets.engaged.DT50
		end
	else
	   sets.Idle.Current = sets.Idle
	end
	]]--
end



function select_default_macro_book()
    set_macro_page(9, 1)
end
