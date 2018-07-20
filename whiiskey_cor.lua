-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    gs c toggle luzaf -- Toggles use of Luzaf Ring on and off
    
    Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
    for ranged weaponskills, but not actually meleeing.
    Acc on offense mode (which is intended for melee) will currently use .Acc weaponskill
    mode for both melee and ranged weaponskills.  Need to fix that in core.
--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.QDMode = M(false, 'STP')
	state.FlurryMode = M{['description']='Flurry Mode', 'Flurry I', 'Flurry II'}
	
    -- Whether to use Luzaf's Ring
    state.LuzafRing = M(false, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
    state.warned = M(false)

    define_roll_values()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc', 'Mage')
    state.RangedMode:options('Normal', 'Acc')
	--state.QDMode:Options('Normal', 'StoreTP')
    state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Mage')

	state.HasteMode = M{['description']='Haste Mode', 'Haste I', 'Haste II'}
    --include('Mote-TreasureHunter')
    --state.TreasureMode:set('Tag')
	
    gear.RAbullet = "Chrono Bullet"
    gear.RAccbullet = "Devastating Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Devastating Bullet"
    gear.QDbullet = "Devastating Bullet"
    options.ammo_warning_limit = 15

    gear.ElementalObi = {name="Hachirin-no-Obi"}
	gear.default.obi_waist = "Eschan Stone"
	gear.TaeonChapSnap = {name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}
	

	
    -- Additional local binds
    send_command('bind ^` gs c cycle FlurryMode')
    send_command('bind @` gs c cycle QDMode')
    send_command('bind !` gs c cycle LuzafRing')


	select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
    send_command('unbind !`')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	-- Capacity Set
    sets.CapacityMantle = {back="Mecistopins Mantle"}
	
    Camulus = {}
        Camulus.MAtk = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%','AGI+10'}}
        Camulus.RAcc = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	Camulus.Snap = {name="Camulus's Mantle", augments={'"Snapshot"+10',}}
	--Camulus.DA = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.TreasureHunter = { head="White Rarab Cap +1", body=gear.HerculeanBodyTH, hands=gear.HerculeanHandsTH, waist="Chaac Belt" }
	--sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
	sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
	sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
	sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}

-- Enmity - and Roll Potency/Duration +
sets.precast.CorsairRoll = {
    head={ name="Lanun Tricorne +1", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands="Chasseur's Gants +1",
    legs="Laksa. Trews +2",
    neck="Regal Necklace",
    waist="Reiki Yotai",
    left_ear="Enervating Earring",
    right_ear="Lifestorm Earring",
    left_ring="Cacoethic Ring +1",
    back="Camulus's Mantle",
}

sets.precast.JA['Double-Up'] = sets.precast.CorsairRoll
    
sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes +1"})
sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne"})
sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
sets.precast.Barataria = {ring1="Barataria Ring"}
sets.precast.WS.Moonshade = {}	
sets.precast.CorsairShot = {}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head=gear	.HerculeanHelmMAB,neck="Orunmila's Torque",ear1="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",
        waist="Hurch'lan Sash",legs="Blood Cuisses",feet="Lanun Bottes +3"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

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
    right_ring="Kishar Ring",
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


sets.precast.RA = {
    ammo=gear.RAbullet,
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="Oshosi Vest +1",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs="Adhemar Kecks",
    feet="Meg. Jam. +2",
    waist="Yemaya Belt",
    back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
}

sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
body="Laksa. Frac +3"
})
	
sets.precast.RA.FlurryII = set_combine(sets.precast.RA.Flurry, {
})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body=gear.HerculeanVestAcc,hands=gear.HerculeanHandsTA,ring1="Petrov Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Fotia Belt",legs="Samnuha Tights",feet=gear.HerculeanBootsTA}
	sets.precast.WS.Moonshade = {ear2="Moonshade Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = sets.precast.WS

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		head=gear.HerculeanHeadWS,neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Laksa. Frac +3",hands="Meghanada Gloves +2",ring1="Epona's Ring",ring2="Regal Ring",
		back=Camulus.MAtk,waist="Fotia Belt",legs="Meghanada Chausses +2",feet=gear.HerculeanFeetWS}
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Laksa. Frac +3",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back=Camulus.MAtk,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"}
	sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Laksa. Frac +3",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back=Camulus.RAtk,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"}
	sets.precast.WS['Split Shot'] = set_combine(sets.precast.WS['Last Stand'], {})
	
	sets.precast.WS['Detonator'] = {ammo=gear.WSbullet,
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back=Camulus.RAcc,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"}
	sets.precast.WS['Detonator'].Acc = {ammo=gear.WSbullet,
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back=Camulus.RAcc,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2"}

sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body="Laksa. Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.precast.WS['Wildfire'].Brew = sets.precast.WS['Wildfire']

sets.precast.WS['Leaden Salute'] = {
	--ammo="Devastating Bullet",
    head="Pixie Hairpin +1",
    --body="Laksa. Frac +3",
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    --hands="Leyline Gloves",
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    --feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    feet="Lanun Bottes +3",
    neck="Sanctity Necklace",
    --waist="Eschan Stone",
    waist="Hachirin-no-Obi",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

--[[
sets.precast.WS['Leaden Salute'].Proc = {
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
    back=empty
}    
]]--

sets.precast.WS['Aeolian Edge'] = {
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body="Laksa. Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','"Mag.Atk.Bns."+25','"Treasure Hunter"+2','Accuracy+8 Attack+8',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}	

-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC
	
-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {neck="Phalaina Locket",ring1="Leviathan Ring",ring2="Sirona's Ring",})

sets.midcast.CorsairShot = {
    ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+19','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Pet: DEX+13','MND+9','Weapon skill damage +8%','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Sanctity Necklace",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}	
	
sets.midcast.CorsairShot.STP = {
    ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'"Store TP"+5','Pet: AGI+8','Quadruple Attack +2',}},
    body="Oshosi Vest +1",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet={ name="Herculean Boots", augments={'"Store TP"+8','"Snapshot"+2','Accuracy+5 Attack+5',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
}

	sets.midcast.CorsairShot.Acc = {ammo=gear.QDbullet,
		head=gear.HerculeanHelmMAB,neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Lanun Frac +3",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Sangoma Ring",
		back="Navarch's Mantle",waist="Eschan Stone",legs=gear.HerculeanLegsMAB,feet="Chasseur's Bottes +1"}

sets.midcast.CorsairShot['Light Shot'] = {
    ammo=gear.QDbullet,
    head="Oshosi Mask +1",
    neck="Sanctity Necklace",
    ear1="Gwati Earring",
    ear2="Dignitary's Earring",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
    waist="Eschan Stone",
    legs="Mummu Kecks +2",
    feet="Mummu Gamashes +2"
}

	sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']


	-- Ranged gear
sets.midcast.RA = {ammo=gear.RAbullet,
    head="Meghanada Visor +2",
    body="Oshosi Vest +1",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}
		
sets.midcast.RA.Triple = {
    head="Oshosi Mask +1",
    body="Oshosi Vest +1",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
}
		
sets.midcast.RA.Acc = {
    --ammo=gear.RAccbullet,
    head="Mummu Bonnet +2",
    body="Laksa. Frac +3",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet="Mummu Gamash. +2",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Cacoethic Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
}

    
    -- Sets to return to when not performing an action.
    
	-- Resting sets
	sets.resting = {neck="Sanctity Necklace",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	

-- Idle sets
sets.idle = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonlight Cape",
    --back="Mecisto. Mantle",
}		
	sets.idle.Mage = {
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
		
	-- Defense sets
	sets.defense.PDT = {
		head=gear.HerculeanHeadDT,neck="Loricate Torque +1",ear1="Impregnable Earring",ear2="Etiolation Earring",
		body="Emet Harness +1",hands="Umuthi Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Mummu Kecks +2",feet=gear.HerculeanBootsDT}

	sets.defense.MDT = {
		head=gear.HerculeanHeadDT,neck="Loricate Torque +1",ear1="Impregnable Earring",ear2="Etiolation Earring",
		body="Samnuha Coat",hands="Floral Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Mummu Kecks +2",feet=gear.HerculeanBootsDT}
		
    sets.MEva = {ammo="",
		head="Adhemar Bonnet",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Flashward Earring",
		body="Mummu Jacket +2",hands="Leyline Gloves",ring1="Defending Ring",ring2="Purity Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Carmine Greaves"
	}
	
	sets.Resist = {ammo="",
		head="Adhemar Bonnet",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Flashward Earring",
		body="Adhemar Jacket",hands="Leyline Gloves",ring1="Defending Ring",ring2="Purity Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Carmine Cuisses",feet="Carmine Greaves"
	}
	
	sets.Kiting = {legs="Blood Cuisses"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
-- Normal melee group
sets.engaged.Melee = {    
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Drain" and "Aspir" potency +11','"Store TP"+4','Quadruple Attack +2','Accuracy+19 Attack+19',}},
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
}	

sets.engaged.Acc = {ammo=gear.RAbullet,
		head="Mummu Bonnet +2",neck="Ej Necklace",ear1="Telos Earring",ear2="Cessance Earring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands +1",ring1="Cacoethic Ring +1",ring2="Ramuh Ring",
		back=Camulus.DA,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.HerculeanBootsTA}

sets.engaged.Melee.DW = sets.engaged.Melee

sets.engaged.Acc.DW = sets.engaged.Melee.Acc

	sets.engaged.Ranged = {ammo=gear.RAbullet,
		head="Whirlpool Mask",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Volley Earring",
		body=gear.HerculeanVestAcc,hands="Iuitl Wristbands",ring1="Dark Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet=gear.HerculeanBootsTA}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- Check that proper ammo is available if we're using ranged attacks or similar.
    if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        do_bullet_checks(spell, spellMap, eventArgs)
    end
    -- gear sets
    if spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
        classes.CustomClass = 'Acc'
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
        if sets.precast.FoldDoubleBust then
            equip(sets.precast.FoldDoubleBust)
            eventArgs.handled = true
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' or spell.type == 'Magic' then
		--if moonshade_WS:contains(spell.english) and (player.tp < 2749) then 
		--	equip(sets.precast.WS.Moonshade)
		--end
    end
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
        equip(sets.precast.LuzafRing)
	end
	if spell.action_type == 'Ranged Attack' then
		if buffactive['flurry'] then
			if state.FlurryMode.value == "Flurry I" then
				equip(sets.precast.RA.Flurry)
			else
				equip(sets.precast.RA.FlurryII)
			end
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.type == 'CorsairShot' and state.QDMode.value then
		equip(sets.midcast.CorsairShot.STP)
	end
	if spell.action_type == 'Ranged Attack' and buffactive['Triple Shot'] then
		equip(sets.midcast.RA.Triple)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
        display_roll_info(spell)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    return idleSet
end
 
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    return meleeSet
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
    if buffactive['Transcendancy'] then
        return 'Brew'
    end
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
        state.OffenseMode:set('Ranged')
    end
end

function job_buff_change(buff, gain)

end

function update_melee_groups()

end

function job_handle_equipping_gear(playerStatus, eventArgs)    	
    if player.equipment.back == 'Mecisto. Mantle' or player.equipment.back == 'Aptitude Mantle' or player.equipment.back == 'Aptitude Mantle +1' or player.equipment.back == 'Nexus Cape' then
        disable('back')
    else
        enable('back')
    end
        if player.equipment.ring1 == 'Warp Ring' or player.equipment.ring1 == 'Vocation Ring' or player.equipment.ring1 == 'Capacity Ring' then
        disable('ring1')
    else
        enable('ring1')
    end
    if player.equipment.ring2 == 'Warp Ring' or player.equipment.ring2 == 'Vocation Ring' or player.equipment.ring2 == 'Capacity Ring' then
        disable('ring2')
    else
        enable('ring2')
    end		
end


-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = ''
    
    msg = msg .. 'Off.: '..state.OffenseMode.current
    msg = msg .. ', Rng.: '..state.RangedMode.current
    msg = msg .. ', WS.: '..state.WeaponskillMode.current
    msg = msg .. ', QD.: '..state.CastingMode.current
	msg = msg .. ', QD. STP: '..state.QDMode.current

    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end
    
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end

    --msg = msg .. ', Roll Size: ' .. (state.LuzafRing.value and 'Large') or 'Small'
    
    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=3, unlucky=7, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
		["Runeist's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Evasion"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=4, unlucky=8, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		["Naturalist's Roll"]= {lucky=3, unlucky=7, bonus="Buff Duration"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end

function determine_preshot()

end

-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
    local bullet_name
    local bullet_min_count = 1
    
    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if spell.element == 'None' then
                -- physical weaponskills
                bullet_name = gear.WSbullet
            else
                -- magical weaponskills
                bullet_name = gear.MAbullet
            end
        else
            -- Ignore non-ranged weaponskills
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.RAbullet
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end
    
    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    
    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
            add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
            return
        else
            add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end
    
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
        add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
        eventArgs.cancel = true
        return
    end
    
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and state.warned.value == false
        and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
        local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end
        
        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_bullets.count > options.ammo_warning_limit and state.warned then
        state.warned:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(5, 1)
end
