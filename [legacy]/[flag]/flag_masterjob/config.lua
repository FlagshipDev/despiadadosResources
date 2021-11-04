-------------------------------------------------
--Created  by Flagship Dev
-------------------------------------------------------

Config = {}
Config.Locale = 'es'
Config.EnablePlayerManagement = true -- True for esx_society
Config.EnableESXIdentity = true -- True for esx_idendity
Config.EnableLicenses = false -- True for esx_licenses
Config.EnableHandcuffTimer = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer = 10 * 60000 -- 10 mins
Config.ReviveReward = 0

-- Commands EN
Config.RecordCommandEN = 'record'
Config.OpenEditorCommandEN = 'rockstar'
Config.DiscardCommandEN = 'discard'
Config.SaveCommandEN = 'save'

Config.RecordCommandSuggestEN = 'Start Recording with Rockstar Editor'
Config.OpenEditorCommandSuggestEN = 'Save Rockstar Editor Recording'
Config.DiscardCommandSuggestEN = 'Discard Rockstar Editor Recording'
Config.SaveCommandSuggestEN = 'Open the Rockstar editor'


-- Command ES
Config.RecordCommandES = 'grabar'
Config.OpenEditorCommandES = 'rockstar'
Config.DiscardCommandES = 'descartar'
Config.SaveCommandES = 'guardar'

Config.RecordCommandSuggestES = 'Empezar grabación de Rockstar Editor'
Config.OpenEditorCommandSuggestES = 'Guardar la grabación de Rockstar Editor'
Config.DiscardCommandSuggestES = 'Descartar la grabación de Rockstar Editor'
Config.SaveCommandSuggestES = 'Abrir el editor de Rockstar'



Config.LSPD = {}

Config.LSPD.DrawDistance               = 100.0
Config.LSPD.MarkerType                 = 27
Config.LSPD.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.LSPD.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.LSPD.EnablePlayerManagement     = true
Config.LSPD.EnableArmoryManagement     = true
Config.LSPD.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.LSPD.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.LSPD.EnableLicenses             = true -- enable if you're using esx_license

Config.LSPD.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.LSPD.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.LSPD.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.LSPD.MaxInService               = -1
Config.LSPD.Locale = 'en'

-- Vehicles list: https://wiki.gtanet.work/index.php?title=Vehicle_Models
config	= {}
Config.LSPD.vehicle1 = 'police2'
Config.LSPD.vehicle2 = 'police3'

-- Ped model list: https://forums.gta5-mods.com/topic/7789/npc-or-peds-data-list-base-gtav
Config.LSPD.ped1 = 's_f_y_cop_01' -- model of security personel
Config.LSPD.ped2 = 's_m_y_cop_01' -- model of security personel

-- Set weapons: https://forum.fivem.net/t/list-of-weapon-spawn-names-after-hours/90750
Config.LSPD.weapon1 = 'WEAPON_MICROSMG'
Config.LSPD.weapon2 = 'WEAPON_CARBINERIFLE'


-- Set Config.LSPD.usejob = true if you want to use a job
Config.LSPD.usejob = true  -- restrict to a job?
Config.LSPD.jobname = 'police' -- which job to use the menu?


Config.LSPD.WhitelistedCops = {
	'police',
	'sheriff'
}

Config.LSPD.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 3
		},

--		Blip2 = {
--			Coords  = vector3(-1075.09, -848.64, 4.88),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 0.8,
--			Colour  = 3
--		},

--		Blip3 = {
--			Coords  = vector3(577.1, -8.18, 101.25),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 1.2,
--			Colour  = -1
--		},

		Cloakrooms = {
			vector3(462.97, -998.99, 29.70),
			vector3(-1098.11, -831.79, 14.28),
		--	vector3(610.04, -2.3, 90.65),
		},


		Armories = {
			vector3(481.86, -996.27, 29.70),	
			vector3(-1106.01, -822.91, 14.28),
		--	vector3(601.37, 15.65, 90.65),
		},

		Vehicles = {
--[[			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(435.41, -1020.92, 28.7), heading = 90.0,
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-1071.98, -857.27, 4.87),
				InsideShop = vector3(-1075.59, -848.39, 4.88), heading = 213.0,
				SpawnPoints = {
					{ coords = vector3(-1067.94, -857.57, 4.87), heading = 217.41, radius = 6.0 },
					--{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			}

			{
				Spawner = vector3(626.69, 20.54, 87.81),
				InsideShop = vector3(616.14, 28.37, 88.84), heading = 73.75,
				SpawnPoints = {
					{ coords = vector3(627.2, 24.77, 87.85), heading = 249.07, radius = 6.0 },
					{ coords = vector3(629.93, 25.56, 88.44), heading = 248.11, radius = 6.0 },
					--{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			}
			]]--
		},


		Helicopters = {
			{
				Spawner = vector3(-1099.95, -839.55, 37.7),
				InsideShop = vector3(-1096.6, -833.06, 37.69),
				SpawnPoints = {
					{ coords = vector3(-1096.6, -833.06, 37.69), heading = 87.26, radius = 10.0 }
				}
			},

			{
				Spawner = vector3(451.62, -989.3, 43.69),
				InsideShop = vector3(449.53, -981.37, 43.69),
				SpawnPoints = {
					{ coords = vector3(449.53, -981.37, 43.69), heading = 87.26, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(460.39, -985.21, 29.73),
			vector3(-1113.22, -833.24, 34.36),
			--vector3(547.54, -22.37, 87.76),
		}

	}

}
Config.LSPD.AuthorizedWeapons = {
	Shared = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		{ weapon = 'WEAPON_FLASHBANG', price = 1500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	officer = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.LSPD.AuthorizedVehicles = {
	Shared = {
		{ model = 'pol1', label = 'Ford Crown Victoria', price = 1 },
		{ model = 'pol2', label = 'Ford Crown Victoria V.2', price = 1 },
		{ model = 'police2', label = 'Dodge Charger', price = 1 },
		{ model = 'polchar', label = 'Dodge Charger V.2', price = 1 },
		{ model = 'pol3', label = 'Ford Taurus', price = 1 },
		{ model = 'intscout', label = 'Scout', price = 1 },
		{ model = 'pol8', label = 'BMW R1200', price = 1 },
		{ model = 'pol9', label = 'Ford Raptor', price = 1 },
		{ model = 'poltah', label = 'Chevrolet Caprice K9', price = 1 },
		{ model = '', label = '------------ Secretas -------------', price = 1 },
		{ model = 'ucwashington', label = 'Washington', price = 1 },
		{ model = 'ucrancher', label = 'Rancher', price = 1 },
		{ model = 'ucbuffalo', label = 'Buffalo', price = 1 },
		{ model = 'truscout2', label = 'Scout', price = 1 },
		{ model = 'pbus2', label = 'San Andreas State Prison', price = 1 }
	}
}

Config.LSPD.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 1 }
	},

	boss = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.LSPD.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	recruit_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 17,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 25,   ['pants_2'] = 1,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	recruit_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 17,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 25,   ['pants_2'] = 1,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	mary_lspd = {
		male = {
			['tshirt_1'] = 57,  ['tshirt_2'] = 0,
			['torso_1'] = 239,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 176,
			['pants_1'] = 101,   ['pants_2'] = 11,
			['shoes_1'] = 62,   ['shoes_2'] = 3,
			['bproof_1'] = 30,   ['bproof_2'] = 3,
			['bags_1'] = 0,		['bags_2'] = 0,
			['helmet_1'] = 16,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 17,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 28,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 31,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 28,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer3_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 28,   ['decals_2'] = 1,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer3_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 31,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	officer3_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 28,   ['decals_2'] = 1,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 28,   ['decals_2'] = 3,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 10,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	sergeant_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 31,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	sergeant_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 28,   ['decals_2'] = 3,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	detective_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 28,   ['decals_2'] = 6,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	detective_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 31,   ['decals_2'] = 6,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	detective_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 28,   ['decals_2'] = 6,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	lieutenant_wear = { 
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	lieutenant_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	lieutenant_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	captain_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 1,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	captain_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	captain_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 1,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	commander_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 2,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	commander_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	commander_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 2,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	supervisor_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 3,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	supervisor_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	supervisor_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 3,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	adjunto_wear = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 4,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	adjunto_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 4,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	adjunto_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 4,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 287,   ['torso_2'] = 1,
			['decals_1'] = 61,   ['decals_2'] = 5,
			['arms'] = 37,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 52,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 12,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	boss_wear1 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 5,
			['arms'] = 41,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	boss_wear2 = {
		male = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 0,
			['decals_1'] = 61,   ['decals_2'] = 5,
			['arms'] = 39,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['bproof_1'] = 54,   ['bproof_2'] = 0,
			['bags_1'] = 57,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 15,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	tenu_lspd = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 16,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 19,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 192,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 6,
			['arms'] = 19,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 44,  ['helmet_2'] = 1,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	tenu_hiv = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 164,   ['pants_2'] = 0,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
		},
		female = {
			['tshirt_1'] = 192,  ['tshirt_2'] = 0,
			['torso_1'] = 17,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	tenu_ma = {
		male = {
			['tshirt_1'] = 67,  ['tshirt_2'] = 0,
			['torso_1'] = 274,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 12,   ['shoes_2'] = 6,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,		['bags_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
		},
		female = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	tenu_swat = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 180,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 164,   ['pants_2'] = 0,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
		},
		female = {
			['tshirt_1'] = 192,  ['tshirt_2'] = 0,
			['torso_1'] = 17,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 18,   ['pants_2'] = 3,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	tenu_swatgr = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 109,  ['tshirt_2'] = 0,
			['torso_1'] = 307,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 164,   ['pants_2'] = 0,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = 79,  ['helmet_2'] = 0,
			['mask_1'] = 0,  ['mask_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['bproof_1'] = 15,  ['bproof_2'] = 0,
			['bags_1'] = 0,		['bags_2'] = 0,
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 25,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 3,
			['pants_1'] = 20,   ['pants_2'] = 2,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 9,  ['bproof_2'] = 2,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	tenu_doag = {
		male = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 307,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 121,   ['pants_2'] = 2,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = 154,  ['helmet_2'] = 0,
			['mask_1'] = 0,  ['mask_2'] = 0,
			['chain_1'] = 2,    ['chain_2'] = 0,
			['bproof_1'] = 30,  ['bproof_2'] = 0,
			['bags_1'] = 0,		['bags_2'] = 0,
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 25,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 3,
			['pants_1'] = 20,   ['pants_2'] = 0,
			['shoes_1'] = 36,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 9,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	tenu_sahp = {
		male = {
			['tshirt_1'] = 53,  ['tshirt_2'] = 0,
			['torso_1'] = 32,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 12,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 1,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 33,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	tenu_sahpg = { 
		male = {
			['tshirt_1'] = 53,  ['tshirt_2'] = 0,
			['torso_1'] = 32,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 12,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 12,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 33,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	bullet_wear = {
		male = {
			['bproof_1'] = 30,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 2
		}
	},

}

Config.Actividades = {}

Config.Actividades.DeleteZones = {
	Teledirigidos = {
		Pos = {
			{x = 1153.19, y = 267.98, z = 80.73},  
			{x = 832.86, y = 2362.8, z = 51.0},
			{x = -196.42, y = 787.04, z = 195.22},
			{x = 2848.46, y = -642.42, z = -0.9},
			{x = 3370.24, y = 5180.48, z = -0.9},
			{x = 713.11, y = 4087.21, z = 28.72},
			{x = 426.08, y = 3634.95, z = 29.95},
			{x = -1630.97, y = -1152.75, z = -0.95},
			{x = -163.52, y = -2134.73, z = 14.62}
		}
	}
}

Config.Actividades.SpawnZonesTele = {
		{x = 1158.64, y = 270.73, z = 82.08, h = 147.18},  
		{x = 1163.61, y = 270.34, z = 81.9, h = 133.48},  
		{x = 1165.12, y = 268.54, z = 81.85, h = 144.01},  
}

Config.Actividades.SpawnZonesMotocross = {
	{x = 840.08, y = 2357.65, z = 51.84, h = 236.68},  
	{x = 844.92, y = 2361.54, z = 52.8, h = 173.48},  
	{x = 847.24, y = 2357.26, z = 52.5, h = 204.64},  
}

Config.Actividades.SpawnZonesKarts = {
	{x = -158.83, y = -2131.97, z = 16.71, h = 209.07},  
	{x = -156.75, y = -2135.96, z = 16.71, h = 209.07},  
	{x = -154.72, y = -2139.88, z = 16.71, h = 209.07},  
}

Config.Actividades.SpawnZonesMotoagua = {
	uno = {
		x = -1630.97, 
		y = -1152.75, 
		z = -0.55,
		h = 288.95
	},
	dos = {
		x = 426.08, 
		y = 3634.95, 
		z = 29.8,
		h = 346.33
	},
	tres = {
		x = 713.11, 
		y = 4087.21, 
		z = 30.00,
		h = 156.75
	},
	cuatro = {
		x = 3370.24, 
		y = 5180.48, 
		z = 0.0,
		h = 231.28
	},
	cinco = {
		x = 2848.46, 
		y = -642.42, 
		z = 0.0, 
		h = 259.27
	},
	seis = {
		x = -196.42, 
		y = 787.04,
		z = 196.32,
		h = 90.0
	},
}

Config.Actividades.Marker = 1										-- marker type
Config.Actividades.MarkerColor = { r = 255, g = 0, b = 0, a = 100 } 			-- rgba color of the marker
Config.Actividades.MarkerScale = { x = 2.5, y = 2.5, z = 1.5 }  				-- the scale for the marker on the x, y and z axis
Config.Actividades.DeleteDraw3DText = "Presiona ~y~E~s~ para ~g~acabar~s~ la actividad."	

Config.LSPDGar = {}

Config.LSPDGar.KeyToOpenCarGarage = 38			-- default 38 is E
Config.LSPDGar.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.LSPDGar.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.LSPDGar.PoliceDatabaseName = 'police'	-- set the exact name from your jobs database for police

--Police Car Garage:
Config.LSPDGar.CarZones = {
	PoliceCarGarage = {
		Pos = {
			{x = 436.97,  y = -1012.82, z = 28.66},  
			{x = 1866.86,  y = 3697.01, z = 34.52}, 
		}
	}
}

Config.LSPDGar.DeleteZones = {
	PoliceCarGarage = {
		Pos = {
			{x = 455.29,  y = -1018.04, z = 27.41},  
		}
	}
}

--Police Heli Garage:
Config.LSPDGar.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = 0,  y = 0, z = 43.69},
			{x = 0,  y = 0, z = 54.037}
		}
	}
}


-- Police Car Garage Marker Settings:
Config.LSPDGar.PoliceDeleteMarker = 27										-- marker type
Config.LSPDGar.PoliceDeleteMarkerColor = { r = 255, g = 0, b = 0, a = 100 } 			-- rgba color of the marker
Config.LSPDGar.PoliceDeleteMarkerScale = { x = 2.5, y = 2.5, z = 1.5 }  				-- the scale for the marker on the x, y and z axis
Config.LSPDGar.DeleteDraw3DText = "Presiona ~y~E~s~ para ~g~aparcar~s~ la unidad"			-- set your desired text here

Config.LSPDGar.PoliceCarMarker = 27											-- marker type
Config.LSPDGar.PoliceCarMarkerColor = { r = 0, g = 128, b = 255, a = 100 } 			-- rgba color of the marker
Config.LSPDGar.PoliceCarMarkerScale = { x = 1.5, y = 1.5, z = 0.5 }  				-- the scale for the marker on the x, y and z axis
Config.LSPDGar.CarDraw3DText = "Presiona ~y~E~s~ para ~g~abrir~s~ el garaje"			-- set your desired text here

-- Police Heli Garage Marker Settings:
Config.LSPDGar.PoliceHeliMarker = 27 												-- marker type
Config.LSPDGar.PoliceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.LSPDGar.PoliceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.LSPDGar.HeliDraw3DText = "Presiona [E] para abrir el garaje"		-- set your desired text here


-- Police Extra Garage Marker Settings:
Config.LSPDGar.PoliceExtraMarker = 27 												-- marker type
Config.LSPDGar.PoliceExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.LSPDGar.PoliceExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.LSPDGar.ExtraDraw3DText = "Presiona ~g~E~s~ para ~y~Extras~s~"		-- set your desired text here

-- Police Cars:
Config.LSPDGar.PoliceVehicles = {
	{ model = 'code311cvpi', label = 'LSPD - Ford Crown Victoria'},
	{ model = 'code316impala', label = 'LSPD - Chevrolet Impala' },
	{ model = 'code3fpis', label = 'LSPD - Ford Taurus' },
	{ model = 'code314charg', label = 'LSPD - Dodge Charger 2014' },
	{ model = 'code318charg', label = 'LSPD - Dodge Charger 2018' },
--	{ model = 'blazer2', label = 'LSPD - Ford Explorer 2016' },
	{ model = 'code320exp', label = 'LSPD - Ford Explorer 2020' },
	{ model = 'code318tahoe', label = 'LSPD - Chevrolet Tahoe 2018' },
--	{ model = 'blazer2', label = 'LSPD - Chevrolet Tahoe K9' },
	{ model = 'code3ram', label = 'LSPD - Dogde Ram' },
--	{ model = 'blazer2', label = 'LSPD - Chevrolet Camaro Interceptor' },
	{ model = 'code3mustang', label = 'LSPD - Ford Mustang Interceptor' },
	{ model = 'code3bmw', label = 'LSPD - BMW R1200RT' },
	{ model = 'code3dirtbike', label = 'LSPD - Sanchez' },
	{ model = 'pbike', label = 'LSPD - Bicicleta'},
	{ model = 'pbus2', label = 'San Andreas State Prison' },
	{ model = 'riot', label = 'Unidad Blindada' },
}

-- Police Helicopters:
Config.LSPDGar.PoliceHelicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
}

-- Menu Labels & Titles:
Config.LSPDGar.LabelStoreVeh = "Guardar un vehículo"
Config.LSPDGar.LabelGetVeh = "Sacar un vehículo"
Config.LSPDGar.LabelExtra = "Extra"
Config.LSPDGar.LabelLivery = "Livery"
Config.LSPDGar.TitlePoliceGarage = "SAPD"
Config.LSPDGar.TitlePoliceExtra = "Extra"
Config.LSPDGar.TitlePoliceLivery = "Livery"

-- ESX.ShowNotifications:
Config.LSPDGar.VehicleParked = "Vehículo aparcado!"
Config.LSPDGar.NoVehicleNearby = "No tienes vehículo!"
Config.LSPDGar.CarOutFromPolGar = "Has sacado un vehículo policial"
Config.LSPDGar.HeliOutFromPolGar = "You took out a ~b~Helicopter~s~ from ~y~Police Heli Garage~s~!"


Config.LSPDGar.VehicleLoadText = "Espera..."			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.LSPDGar.Distance = 10

Config.LSPDGar.DrawDistance      = 20.0
Config.LSPDGar.TriggerDistance 	 = 3.0
Config.LSPDGar.Marker 			 = {Type = 4, r = 0, g = 127, b = 22}

-- Police Extra Menu Positions:
Config.LSPDGar.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 0,  y = -1019.36, z = 28.4},
			{x = 0,  y = 3693.1, z = 33.52},
		}
	}
}

Config.MECAGar = {}

Config.MECAGar.KeyToOpenCarGarage = 38			-- default 38 is E
Config.MECAGar.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.MECAGar.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.MECAGar.PoliceDatabaseName = 'mechanic'	-- set the exact name from your jobs database for police

--Police Car Garage:
Config.MECAGar.CarZones = {
	PoliceCarGarage = {
		Pos = {
			{x = -361.59,  y = -113.9, z = 38.7},  -- Los Santos Normal
			{x = 916.8,  y = -964.7, z = 39.49}, -- Hayes Repairs
			{x = -1144.16,  y = -1980.29, z = 13.16}, -- Los Santos Aeropuerto
			{x = 1182.32,  y = 2655.0, z = 37.81},  --Sandy
			{x = 127.47,  y = 6621.5, z = 31.81}, --Paleto
			{x = -159.77, y = -1301.11, z = 31.34}, --Bennys
		} 
	}
}

Config.MECAGar.DeleteZones = {
	PoliceCarGarage = {
		Pos = {
			{x = -368.16,  y = -108.72, z = 38.41},    -- Los Santos Normal
			{x = 924.4,  y = -964.01, z = 38.52}, -- Hayes Repairs
			{x = -1136.53,  y = -1977.98, z = 13.16}, -- Los Santos Aeropuerto
			{x = 1192.03,  y = 2662.27, z = 37.82}, --Sandy
			{x = 134.09,  y = 6627.8, z = 31.67}, --Paleto
			{x = -163.34, y = -1306.94, z = 30.37}, --Bennys
		}
	}
}

--Police Heli Garage:
Config.MECAGar.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = 0,  y = 0, z = 43.69},
			{x = 0,  y = 0, z = 54.037}
		}
	}
}


-- Police Car Garage Marker Settings:
Config.MECAGar.PoliceDeleteMarker = 27										-- marker type
Config.MECAGar.PoliceDeleteMarkerColor = { r = 255, g = 0, b = 0, a = 100 } 			-- rgba color of the marker
Config.MECAGar.PoliceDeleteMarkerScale = { x = 2.5, y = 2.5, z = 1.5 }  				-- the scale for the marker on the x, y and z axis
Config.MECAGar.DeleteDraw3DText = "Presiona ~y~E~s~ para ~g~guardar~s~ el vehículo"			-- set your desired text here

Config.MECAGar.PoliceCarMarker = 27											-- marker type
Config.MECAGar.PoliceCarMarkerColor = { r = 0, g = 128, b = 255, a = 100 } 			-- rgba color of the marker
Config.MECAGar.PoliceCarMarkerScale = { x = 1.5, y = 1.5, z = 0.5 }  				-- the scale for the marker on the x, y and z axis
Config.MECAGar.CarDraw3DText = "Presiona ~y~E~s~ para ~g~abrir~s~ el garaje"			-- set your desired text here

-- Police Heli Garage Marker Settings:
Config.MECAGar.PoliceHeliMarker = 27 												-- marker type
Config.MECAGar.PoliceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.MECAGar.PoliceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.MECAGar.HeliDraw3DText = "Presiona [E] para abrir el garaje"		-- set your desired text here


-- Police Extra Garage Marker Settings:
Config.MECAGar.PoliceExtraMarker = 27 												-- marker type
Config.MECAGar.PoliceExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.MECAGar.PoliceExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.MECAGar.ExtraDraw3DText = "Presiona ~g~E~s~ para ~y~Extras~s~"		-- set your desired text here

-- Police Cars:
Config.MECAGar.PoliceVehicles = {
	{ model = 'flatbed3', label = 'Grúa LS Customs', job = 'mechanic'},
	{ model = 'flatbed3', label = 'Grúa LS Customs', job = 'mechanic5'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic2'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic3'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic4'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic5'},
	{ model = 'youga', label = 'Furgo', job = 'mechanic6'},
	{ model = 'flatbed', label = 'Grúa', job = 'mechanic2'},
	{ model = 'flatbed', label = 'Grúa', job = 'mechanic3'},
	{ model = 'flatbed', label = 'Grúa', job = 'mechanic4'},
	{ model = 'flatbed', label = 'Grúa', job = 'mechanic6'},
}

-- Police Helicopters:
Config.MECAGar.PoliceHelicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
}

-- Menu Labels & Titles:
Config.MECAGar.LabelStoreVeh = "Guardar un vehículo"
Config.MECAGar.LabelGetVeh = "Sacar un vehículo"
Config.MECAGar.LabelExtra = "Extra"
Config.MECAGar.LabelLivery = "Livery"
Config.MECAGar.TitlePoliceGarage = "SAPD"
Config.MECAGar.TitlePoliceExtra = "Extra"
Config.MECAGar.TitlePoliceLivery = "Livery"

-- ESX.ShowNotifications:
Config.MECAGar.VehicleParked = "Vehículo aparcado!"
Config.MECAGar.NoVehicleNearby = "No tienes vehículo!"
Config.MECAGar.CarOutFromPolGar = "Has sacado un vehículo"
Config.MECAGar.HeliOutFromPolGar = "You took out a ~b~Helicopter~s~ from ~y~Police Heli Garage~s~!"


Config.MECAGar.VehicleLoadText = "Espera..."			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.MECAGar.Distance = 10

Config.MECAGar.DrawDistance      = 20.0
Config.MECAGar.TriggerDistance 	 = 3.0
Config.MECAGar.Marker 			 = {Type = 4, r = 0, g = 127, b = 22}

-- Police Extra Menu Positions:
Config.MECAGar.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 0,  y = -1019.36, z = 28.4},
			{x = 0,  y = 3693.1, z = 33.52},
		}
	}
}


Config.Prision = {}

Config.Prision.JailPositions = {
	["Cell"] = { ["x"] = 1786.87, ["y"] = 2592.23, ["z"] = 45.83, ["h"] = 150.32 }
}

Config.Prision.Cutscene = {
	["PhotoPosition"] = { ["x"] = 402.91567993164, ["y"] = -996.75970458984, ["z"] = -99.000259399414, ["h"] = 186.22499084473 },

	["CameraPos"] = { ["x"] = 402.88830566406, ["y"] = -1003.8851318359, ["z"] = -97.419647216797, ["rotationX"] = -15.433070763946, ["rotationY"] = 0.0, ["rotationZ"] = -0.31496068835258, ["cameraId"] = 0 },

	["PolicePosition"] = { ["x"] = 402.91702270508, ["y"] = -1000.6376953125, ["z"] = -99.004028320313, ["h"] = 356.88052368164 }
}

Config.Prision.PrisonWork = {
	["DeliverPackage"] = { ["x"] = 1027.2347412109, ["y"] = -3101.419921875, ["z"] = -38.999870300293, ["h"] = 267.89135742188 },

	["Packages"] = {
		[1] = { ["x"] = 1003.6661987305, ["y"] = -3108.4221191406, ["z"] = -38.999866485596, ["state"] = true },
		[2] = { ["x"] = 1006.0420532227, ["y"] = -3103.0024414063, ["z"] = -38.999866485596, ["state"] = true },
		[3] = { ["x"] = 1015.7958374023, ["y"] = -3102.8337402344, ["z"] = -38.99991607666, ["state"] = true },
		[4] = { ["x"] = 1012.8907470703, ["y"] = -3108.2907714844, ["z"] = -38.999912261963, ["state"] = true },
		[5] = { ["x"] = 1018.2017822266, ["y"] = -3109.1982421875, ["z"] = -38.999897003174, ["state"] = true },
		[6] = { ["x"] = 1018.0194091797, ["y"] = -3096.5700683594, ["z"] = -38.999897003174, ["state"] = true },
		[7] = { ["x"] = 1015.6422119141, ["y"] = -3091.7392578125, ["z"] = -38.999897003174, ["state"] = true },
		[8] = { ["x"] = 1010.7862548828, ["y"] = -3096.6135253906, ["z"] = -38.999897003174, ["state"] = true },
		[9] = { ["x"] = 1005.7819824219, ["y"] = -3096.8415527344, ["z"] = -38.999897003174, ["state"] = true },
		[10] = { ["x"] = 1003.4543457031, ["y"] = -3096.7048339844, ["z"] = -38.999897003174, ["state"] = true }
	}
}

Config.Prision.Teleports = {
	["Prison Work"] = { 
		["x"] = 992.51770019531, 
		["y"] = -3097.8413085938, 
		["z"] = -38.995861053467, 
		["h"] = 81.15771484375, 
		["goal"] = { 
			"Jail" 
		} 
	},

	["Boiling Broke"] = { 
		["x"] = 1845.6022949219, 
		["y"] = 2585.8029785156, 
		["z"] = 45.672061920166, 
		["h"] = 92.469093322754, 
		["goal"] = { 
			"Security" 
		} 
	},

	["Jail"] = { 
		["x"] = 1676.222778, 
		["y"] = 2593.1923, 
		["z"] = 45.585, 
		["h"] = 87.4532, 
		["goal"] = { 
			"Prison Work", 
			"Security", 
			"Visitor" 
		} 
	},

	["Security"] = { 
		["x"] = 1706.7625732422,
		["y"] = 2581.0793457031, 
		["z"] = -69.407371520996, 
		["h"] = 267.72802734375, 
		["goal"] = { 
			"Jail",
			"Boiling Broke"
		} 
	},

	["Visitor"] = {
		["x"] = 1699.7196044922, 
		["y"] = 2574.5314941406, 
		["z"] = -69.403930664063, 
		["h"] = 169.65020751953, 
		["goal"] = { 
			"Jail" 
		} 
	}
}

Config.LSCustoms = {}
Config.LSCustoms.IsMechanicJobOnly = true
Config.LSCustoms.MechanicJobs = { 'mechanic', 'mechanic2', 'mechanic3', 'mechanic4', 'mechanic5', 'mechanic6'}
Config.LSCustoms.EnableFreeTunning = true

Config.LSCustoms.Zones = {

	ls1 = {
		Pos   = { x = -323.04, y = -131.18, z = 38.97 },
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	ls2 = {
		Pos   = { x = -327.26, y = -144.47, z = 39.06 },
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	ls3 = {
		Pos   = { x = -320.27, y = -126.06, z = 39.01}, 
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	ls4 = {
		Pos   = { x = -318.78, y = -119.9, z = 39.01},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	-----------------------------------------

	lsruta68_1 = {
		Pos   = { x = 1175.43, y = 2640.83, z = 36.25},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
	lsruta68_2 = {
		Pos   = { x = 1182.84, y = 2638.85, z = 36.28},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	-----------------------------------------

	lspaleto = {
		Pos   = { x = 110.2566986084, y = 6626.814453125, z = 31.5172290802},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
	lspaleto_2 = {
		Pos   = { x = 104.13, y = 6621.7, z = 31.82},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	-----------------------------------------

	lsbenny1 = {
		Pos   = { x = -222.33, y = -1330.24, z = 30.89},
		Size  = {x = 5.0, y = 5.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
	lsbenny2 = {
		Pos   = { x = -210.80, y = -1324.26, z = 30.89},
		Size  = {x = 5.0, y = 5.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},

	-----------------------------------------

	rrclub = {
		Pos   = { x = 979.06, y = -3000.96, z = -39.65},
		Size  = {x = 5.0, y = 5.0, z = 0.2},
		Color = {r = 0, g = 0, b = 255},
		Marker= 1,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	}
}

Config.LSCustoms.Colors = {
	{ label = _U('black'), value = 'black'},
	{ label = _U('white'), value = 'white'},
	{ label = _U('grey'), value = 'grey'},
	{ label = _U('red'), value = 'red'},
	{ label = _U('pink'), value = 'pink'},
	{ label = _U('blue'), value = 'blue'},
	{ label = _U('yellow'), value = 'yellow'},
	{ label = _U('green'), value = 'green'},
	{ label = _U('orange'), value = 'orange'},
	{ label = _U('brown'), value = 'brown'},
	{ label = _U('purple'), value = 'purple'},
	{ label = _U('chrome'), value = 'chrome'},
	{ label = _U('gold'), value = 'gold'}
}
Config.LSCustoms.XenonColors = {
	{ label = 'Por defecto', value = -1},
	{ label = 'Blanco', value = 0},
	{ label = 'Azul', value = 1},
	{ label = 'Azul eléctrico', value = 2},
	{ label = 'Verde menta', value = 3},
	{ label = 'Verde lima', value = 4},
	{ label = 'Amarillo', value = 5},
	{ label = 'Lluvia dorada', value = 6},
	{ label = 'Naranja', value = 7},
	{ label = 'Rojo', value = 8},
	{ label = 'Rosa pony', value = 9},
	{ label = 'Rosa fuerte', value = 10},
	{ label = 'Morado', value = 11},
	{ label = 'Negra', value = 12}
}

function GetColors(color)
	local colors = {}
	if color == 'black' then
		colors = {
			{ index = 0, label = _U('black')},
			{ index = 1, label = _U('graphite')},
			{ index = 2, label = _U('black_metallic')},
			{ index = 3, label = _U('caststeel')},
			{ index = 11, label = _U('black_anth')},
			{ index = 12, label = _U('matteblack')},
			{ index = 15, label = _U('darknight')},
			{ index = 16, label = _U('deepblack')},
			{ index = 21, label = _U('oil')},
			{ index = 147, label = _U('carbon')}
		}
	elseif color == 'white' then
		colors = {
			{ index = 106, label = _U('vanilla')},
			{ index = 107, label = _U('creme')},
			{ index = 111, label = _U('white')},
			{ index = 112, label = _U('polarwhite')},
			{ index = 113, label = _U('beige')},
			{ index = 121, label = _U('mattewhite')},
			{ index = 122, label = _U('snow')},
			{ index = 131, label = _U('cotton')},
			{ index = 132, label = _U('alabaster')},
			{ index = 134, label = _U('purewhite')}
		}
	elseif color == 'grey' then
		colors = {
			{ index = 4, label = _U('silver')},
			{ index = 5, label = _U('metallicgrey')},
			{ index = 6, label = _U('laminatedsteel')},
			{ index = 7, label = _U('darkgray')},
			{ index = 8, label = _U('rockygray')},
			{ index = 9, label = _U('graynight')},
			{ index = 10, label = _U('aluminum')},
			{ index = 13, label = _U('graymat')},
			{ index = 14, label = _U('lightgrey')},
			{ index = 17, label = _U('asphaltgray')},
			{ index = 18, label = _U('grayconcrete')},
			{ index = 19, label = _U('darksilver')},
			{ index = 20, label = _U('magnesite')},
			{ index = 22, label = _U('nickel')},
			{ index = 23, label = _U('zinc')},
			{ index = 24, label = _U('dolomite')},
			{ index = 25, label = _U('bluesilver')},
			{ index = 26, label = _U('titanium')},
			{ index = 66, label = _U('steelblue')},
			{ index = 93, label = _U('champagne')},
			{ index = 144, label = _U('grayhunter')},
			{ index = 156, label = _U('grey')}
		}
	elseif color == 'red' then
		colors = {
			{ index = 27, label = _U('red')},
			{ index = 28, label = _U('torino_red')},
			{ index = 29, label = _U('poppy')},
			{ index = 30, label = _U('copper_red')},
			{ index = 31, label = _U('cardinal')},
			{ index = 32, label = _U('brick')},
			{ index = 33, label = _U('garnet')},
			{ index = 34, label = _U('cabernet')},
			{ index = 35, label = _U('candy')},
			{ index = 39, label = _U('matte_red')},
			{ index = 40, label = _U('dark_red')},
			{ index = 43, label = _U('red_pulp')},
			{ index = 44, label = _U('bril_red')},
			{ index = 46, label = _U('pale_red')},
			{ index = 143, label = _U('wine_red')},
			{ index = 150, label = _U('volcano')}
		}
	elseif color == 'pink' then
		colors = {
			{ index = 135, label = _U('electricpink')},
			{ index = 136, label = _U('salmon')},
			{ index = 137, label = _U('sugarplum')}
		}
	elseif color == 'blue' then
		colors = {
			{ index = 54, label = _U('topaz')},
			{ index = 60, label = _U('light_blue')},
			{ index = 61, label = _U('galaxy_blue')},
			{ index = 62, label = _U('dark_blue')},
			{ index = 63, label = _U('azure')},
			{ index = 64, label = _U('navy_blue')},
			{ index = 65, label = _U('lapis')},
			{ index = 67, label = _U('blue_diamond')},
			{ index = 68, label = _U('surfer')},
			{ index = 69, label = _U('pastel_blue')},
			{ index = 70, label = _U('celeste_blue')},
			{ index = 73, label = _U('rally_blue')},
			{ index = 74, label = _U('blue_paradise')},
			{ index = 75, label = _U('blue_night')},
			{ index = 77, label = _U('cyan_blue')},
			{ index = 78, label = _U('cobalt')},
			{ index = 79, label = _U('electric_blue')},
			{ index = 80, label = _U('horizon_blue')},
			{ index = 82, label = _U('metallic_blue')},
			{ index = 83, label = _U('aquamarine')},
			{ index = 84, label = _U('blue_agathe')},
			{ index = 85, label = _U('zirconium')},
			{ index = 86, label = _U('spinel')},
			{ index = 87, label = _U('tourmaline')},
			{ index = 127, label = _U('paradise')},
			{ index = 140, label = _U('bubble_gum')},
			{ index = 141, label = _U('midnight_blue')},
			{ index = 146, label = _U('forbidden_blue')},
			{ index = 157, label = _U('glacier_blue')}
		}
	elseif color == 'yellow' then
		colors = {
			{ index = 42, label = _U('yellow')},
			{ index = 88, label = _U('wheat')},
			{ index = 89, label = _U('raceyellow')},
			{ index = 91, label = _U('paleyellow')},
			{ index = 126, label = _U('lightyellow')}
		}
	elseif color == 'green' then
		colors = {
			{ index = 49, label = _U('met_dark_green')},
			{ index = 50, label = _U('rally_green')},
			{ index = 51, label = _U('pine_green')},
			{ index = 52, label = _U('olive_green')},
			{ index = 53, label = _U('light_green')},
			{ index = 55, label = _U('lime_green')},
			{ index = 56, label = _U('forest_green')},
			{ index = 57, label = _U('lawn_green')},
			{ index = 58, label = _U('imperial_green')},
			{ index = 59, label = _U('green_bottle')},
			{ index = 92, label = _U('citrus_green')},
			{ index = 125, label = _U('green_anis')},
			{ index = 128, label = _U('khaki')},
			{ index = 133, label = _U('army_green')},
			{ index = 151, label = _U('dark_green')},
			{ index = 152, label = _U('hunter_green')},
			{ index = 155, label = _U('matte_foilage_green')}
		}
	elseif color == 'orange' then
		colors = {
			{ index = 36, label = _U('tangerine')},
			{ index = 38, label = _U('orange')},
			{ index = 41, label = _U('matteorange')},
			{ index = 123, label = _U('lightorange')},
			{ index = 124, label = _U('peach')},
			{ index = 130, label = _U('pumpkin')},
			{ index = 138, label = _U('orangelambo')}
		}
	elseif color == 'brown' then
		colors = {
			{ index = 45, label = _U('copper')},
			{ index = 47, label = _U('lightbrown')},
			{ index = 48, label = _U('darkbrown')},
			{ index = 90, label = _U('bronze')},
			{ index = 94, label = _U('brownmetallic')},
			{ index = 95, label = _U('Expresso')},
			{ index = 96, label = _U('chocolate')},
			{ index = 97, label = _U('terracotta')},
			{ index = 98, label = _U('marble')},
			{ index = 99, label = _U('sand')},
			{ index = 100, label = _U('sepia')},
			{ index = 101, label = _U('bison')},
			{ index = 102, label = _U('palm')},
			{ index = 103, label = _U('caramel')},
			{ index = 104, label = _U('rust')},
			{ index = 105, label = _U('chestnut')},
			{ index = 108, label = _U('brown')},
			{ index = 109, label = _U('hazelnut')},
			{ index = 110, label = _U('shell')},
			{ index = 114, label = _U('mahogany')},
			{ index = 115, label = _U('cauldron')},
			{ index = 116, label = _U('blond')},
			{ index = 129, label = _U('gravel')},
			{ index = 153, label = _U('darkearth')},
			{ index = 154, label = _U('desert')}
		}
	elseif color == 'purple' then
		colors = {
			{ index = 71, label = _U('indigo')},
			{ index = 72, label = _U('deeppurple')},
			{ index = 76, label = _U('darkviolet')},
			{ index = 81, label = _U('amethyst')},
			{ index = 142, label = _U('mysticalviolet')},
			{ index = 145, label = _U('purplemetallic')},
			{ index = 148, label = _U('matteviolet')},
			{ index = 149, label = _U('mattedeeppurple')}
		}
	elseif color == 'chrome' then
		colors = {
			{ index = 117, label = _U('brushedchrome')},
			{ index = 118, label = _U('blackchrome')},
			{ index = 119, label = _U('brushedaluminum')},
			{ index = 120, label = _U('chrome')}
		}
	elseif color == 'gold' then
		colors = {
			{ index = 37, label = _U('gold')},
			{ index = 158, label = _U('puregold')},
			{ index = 159, label = _U('brushedgold')},
			{ index = 160, label = _U('lightgold')}
		}
	end
	return colors
end

function GetWindowName(index)
	if (index == 1) then
		return "Pure Black"
	elseif (index == 2) then
		return "Darksmoke"
	elseif (index == 3) then
		return "Lightsmoke"
	elseif (index == 4) then
		return "Limo"
	elseif (index == 5) then
		return "Green"
	else
		return "Unknown"
	end
end

function GetHornName(index)
	if (index == 0) then
		return "Truck Horn"
	elseif (index == 1) then
		return "Cop Horn"
	elseif (index == 2) then
		return "Clown Horn"
	elseif (index == 3) then
		return "Musical Horn 1"
	elseif (index == 4) then
		return "Musical Horn 2"
	elseif (index == 5) then
		return "Musical Horn 3"
	elseif (index == 6) then
		return "Musical Horn 4"
	elseif (index == 7) then
		return "Musical Horn 5"
	elseif (index == 8) then
		return "Sad Trombone"
	elseif (index == 9) then
		return "Classical Horn 1"
	elseif (index == 10) then
		return "Classical Horn 2"
	elseif (index == 11) then
		return "Classical Horn 3"
	elseif (index == 12) then
		return "Classical Horn 4"
	elseif (index == 13) then
		return "Classical Horn 5"
	elseif (index == 14) then
		return "Classical Horn 6"
	elseif (index == 15) then
		return "Classical Horn 7"
	elseif (index == 16) then
		return "Scale - Do"
	elseif (index == 17) then
		return "Scale - Re"
	elseif (index == 18) then
		return "Scale - Mi"
	elseif (index == 19) then
		return "Scale - Fa"
	elseif (index == 20) then
		return "Scale - Sol"
	elseif (index == 21) then
		return "Scale - La"
	elseif (index == 22) then
		return "Scale - Ti"
	elseif (index == 23) then
		return "Scale - Do"
	elseif (index == 24) then
		return "Jazz Horn 1"
	elseif (index == 25) then
		return "Jazz Horn 2"
	elseif (index == 26) then
		return "Jazz Horn 3"
	elseif (index == 27) then
		return "Jazz Horn Loop"
	elseif (index == 28) then
		return "Star Spangled Banner 1"
	elseif (index == 29) then
		return "Star Spangled Banner 2"
	elseif (index == 30) then
		return "Star Spangled Banner 3"
	elseif (index == 31) then
		return "Star Spangled Banner 4"
	elseif (index == 32) then
		return "Classical Horn 8 Loop"
	elseif (index == 33) then
		return "Classical Horn 9 Loop"
	elseif (index == 34) then
		return "Classical Horn 10 Loop"
	elseif (index == 35) then
		return "Classical Horn 8"
	elseif (index == 36) then
		return "Classical Horn 9"
	elseif (index == 37) then
		return "Classical Horn 10"
	elseif (index == 38) then
		return "Funeral Loop"
	elseif (index == 39) then
		return "Funeral"
	elseif (index == 40) then
		return "Spooky Loop"
	elseif (index == 41) then
		return "Spooky"
	elseif (index == 42) then
		return "San Andreas Loop"
	elseif (index == 43) then
		return "San Andreas"
	elseif (index == 44) then
		return "Liberty City Loop"
	elseif (index == 45) then
		return "Liberty City"
	elseif (index == 46) then
		return "Festive 1 Loop"
	elseif (index == 47) then
		return "Festive 1"
	elseif (index == 48) then
		return "Festive 2 Loop"
	elseif (index == 49) then
		return "Festive 2"
	elseif (index == 50) then
		return "Festive 3 Loop"
	elseif (index == 51) then
		return "Festive 3"
	else
		return "Unknown Horn"
	end
end

function GetNeons()
	local neons = {
		{ label = _U('white'),		r = 255, 	g = 255, 	b = 255},
		{ label = "Slate Gray",		r = 112, 	g = 128, 	b = 144},
		{ label = "Blue",			r = 0, 		g = 0, 		b = 255},
		{ label = "Light Blue",		r = 0, 		g = 150, 	b = 255},
		{ label = "Navy Blue", 		r = 0, 		g = 0, 		b = 128},
		{ label = "Sky Blue", 		r = 135, 	g = 206, 	b = 235},
		{ label = "Turquoise", 		r = 0, 		g = 245, 	b = 255},
		{ label = "Mint Green", 	r = 50, 	g = 255, 	b = 155},
		{ label = "Lime Green", 	r = 0, 		g = 255, 	b = 0},
		{ label = "Olive", 			r = 128, 	g = 128, 	b = 0},
		{ label = _U('yellow'), 	r = 255, 	g = 255, 	b = 0},
		{ label = _U('gold'), 		r = 255, 	g = 215, 	b = 0},
		{ label = _U('orange'), 	r = 255, 	g = 165, 	b = 0},
		{ label = _U('wheat'), 		r = 245, 	g = 222, 	b = 179},
		{ label = _U('red'), 		r = 255, 	g = 0, 		b = 0},
		{ label = _U('pink'), 		r = 255, 	g = 161, 	b = 211},
		{ label = _U('brightpink'),	r = 255, 	g = 0, 		b = 255},
		{ label = _U('purple'), 	r = 153, 	g = 0, 		b = 153},
		{ label = "Ivory", 			r = 41, 	g = 36, 	b = 33}
	}

	return neons
end

function GetPlatesName(index)
	if (index == 0) then
		return _U('blue_on_white_1')
	elseif (index == 1) then
		return _U('yellow_on_black')
	elseif (index == 2) then
		return _U('yellow_blue')
	elseif (index == 3) then
		return _U('blue_on_white_2')
	elseif (index == 4) then
		return _U('blue_on_white_3')
	elseif (index == 5) then
		return _U('yankton')
	end
end

Config.VestVariation1 = { componentId = 9, drawableId = 4, textureId = 0, paletteId = 0  } -- 25%
Config.VestVariation2 = { componentId = 9, drawableId = 20, textureId = 0, paletteId = 0  } -- 50%
Config.VestVariation3 = { componentId = 9, drawableId = 7, textureId = 0, paletteId = 0  } -- 75%
Config.VestVariation4 = { componentId = 0, drawableId = 125, textureId = 0, paletteId = 18 } -- 100%
Config.VestVariation5 = { componentId = 9, drawableId = 14, textureId = 0, paletteId = 12 } -- 100%
Config.VestVariation6 = { componentId = 9, drawableId = 15, textureId = 0, paletteId = 12 } -- 100%
Config.VestVariation7 = { componentId = 9, drawableId = 16, textureId = 0, paletteId = 12 } -- 100%
Config.VestVariation8 = { componentId = 9, drawableId = 17, textureId = 0, paletteId = 12 } -- 100%

Config.VestVariation11 = { componentId = 9, drawableId = 28, textureId = 0, paletteId = 12  } -- 25%
Config.VestVariation22 = { componentId = 9, drawableId = 22, textureId = 2, paletteId = 12  } -- 50%
Config.VestVariation33 = { componentId = 9, drawableId = 21, textureId = 1, paletteId = 12  } -- 75%
Config.VestVariation44 = { componentId = 9, drawableId = 11, textureId = 2, paletteId = 12 } -- 100%
Config.VestVariation55 = { componentId = 9, drawableId = 10, textureId = 3, paletteId = 12 } -- 100%
Config.VestVariation66 = { componentId = 9, drawableId = 9, textureId = 0, paletteId = 12 } -- 100%
Config.VestVariation77 = { componentId = 9, drawableId = 9, textureId = 4, paletteId = 12 } -- 100%
Config.VestVariation88 = { componentId = 9, drawableId = 9, textureId = 3, paletteId = 12 } -- 100%
Config.RemoveVestTimer = 2
Config.WearVestTimer = 2

Config.LSCustoms.Menus = {
	main = {
		label		= 'Tuneo',
		parent		= nil,
		upgrades	= _U('upgrades'),
		cosmetics	= _U('cosmetics'),
		extras		= 'Extras',
		modCustomWheels = 'Gomas Custom'
		--modDriftkit = 'Drift Mod'
	},
	extras = {
		label			= 'Extras',
		parent			= 'main',
		modType			= 'extras'
	},
	modCustomWheels = {
		label			= 'Gomas Custom',
		parent			= 'main',
		modType			= 'modCustomWheels'
	},
	modDriftkit = {
		label			= 'Drift Mod',
		parent			= 'main',
		modType			= 'modDriftkit'
	},
	upgrades = {
		label			= _U('upgrades'),
		parent			= 'main',
		modEngine		= _U('engine'),
		modBrakes		= _U('brakes'),
		modTransmission	= _U('transmission'),
		modSuspension	= _U('suspension'),
		modArmor		= _U('armor'),
		modTurbo		= _U('turbo')
	},
	modEngine = {
		label = _U('engine'),
		parent = 'upgrades',
		modType = 11,
		price = {13.95, 32.56, 65.12, 139.53}
	},
	modBrakes = {
		label = _U('brakes'),
		parent = 'upgrades',
		modType = 12,
		price = {4.65, 9.3, 18.6, 13.95}
	},
	modTransmission = {
		label = _U('transmission'),
		parent = 'upgrades',
		modType = 13,
		price = {13.95, 20.93, 46.51}
	},
	modSuspension = {
		label = _U('suspension'),
		parent = 'upgrades',
		modType = 15,
		price = {3.72, 7.44, 14.88, 29.77, 40.2}
	},
	modArmor = {
		label = _U('armor'),
		parent = 'upgrades',
		modType = 16,
		price = {69.77, 116.28, 130.00, 150.00, 180.00, 190.00}
	},
	modTurbo = {
		label = _U('turbo'),
		parent = 'upgrades',
		modType = 17,
		price = {55.81}
	},
	cosmetics = {
		label				= _U('cosmetics'),
		parent				= 'main',
		bodyparts			= _U('bodyparts'),
		windowTint			= _U('windowtint'),
		modHorns			= _U('horns'),
		neonColor			= _U('neons'),
		resprays			= _U('respray'),
		modXenonMenu		= _U('headlights'),
		plateIndex			= _U('licenseplates'),
		wheels				= _U('wheels'),
		modPlateHolder		= _U('modplateholder'),
		modVanityPlate		= _U('modvanityplate'),
		modTrimA			= _U('interior'),
		modOrnaments		= _U('trim'),
		modDashboard		= _U('dashboard'),
		modDial				= _U('speedometer'),
		modDoorSpeaker		= _U('door_speakers'),
		modSeats			= _U('seats'),
		modSteeringWheel	= _U('steering_wheel'),
		modShifterLeavers	= _U('gear_lever'),
		modAPlate			= _U('quarter_deck'),
		modSpeakers			= _U('speakers'),
		modTrunk			= _U('trunk'),
		modHydrolic			= _U('hydraulic'),
		modEngineBlock		= _U('engine_block'),
		modAirFilter		= _U('air_filter'),
		modStruts			= _U('struts'),
		modArchCover		= _U('arch_cover'),
		modAerials			= _U('aerials'),
		modTrimB			= _U('wings'),
		modTank				= _U('fuel_tank'),
		modWindows			= _U('windows'),
		modLivery			= _U('stickers')
	},

	modPlateHolder = {
		label = _U('modplateholder'),
		parent = 'cosmetics',
		modType = 25,
		price = 3.49
	},
	modVanityPlate = {
		label = _U('modvanityplate'),
		parent = 'cosmetics',
		modType = 26,
		price = 1.1
	},
	modTrimA = {
		label = _U('interior'),
		parent = 'cosmetics',
		modType = 27,
		price = 6.98
	},
	modOrnaments = {
		label = _U('trim'),
		parent = 'cosmetics',
		modType = 28,
		price = 0.9
	},
	modDashboard = {
		label = _U('dashboard'),
		parent = 'cosmetics',
		modType = 29,
		price = 4.65
	},
	modDial = {
		label = _U('speedometer'),
		parent = 'cosmetics',
		modType = 30,
		price = 4.19
	},
	modDoorSpeaker = {
		label = _U('door_speakers'),
		parent = 'cosmetics',
		modType = 31,
		price = 5.58
	},
	modSeats = {
		label = _U('seats'),
		parent = 'cosmetics',
		modType = 32,
		price = 4.65
	},
	modSteeringWheel = {
		label = _U('steering_wheel'),
		parent = 'cosmetics',
		modType = 33,
		price = 4.19
	},
	modShifterLeavers = {
		label = _U('gear_lever'),
		parent = 'cosmetics',
		modType = 34,
		price = 3.26
	},
	modAPlate = {
		label = _U('quarter_deck'),
		parent = 'cosmetics',
		modType = 35,
		price = 4.19
	},
	modSpeakers = {
		label = _U('speakers'),
		parent = 'cosmetics',
		modType = 36,
		price = 6.98
	},
	modTrunk = {
		label = _U('trunk'),
		parent = 'cosmetics',
		modType = 37,
		price = 5.58
	},
	modHydrolic = {
		label = _U('hydraulic'),
		parent = 'cosmetics',
		modType = 38,
		price = 5.12
	},
	modEngineBlock = {
		label = _U('engine_block'),
		parent = 'cosmetics',
		modType = 39,
		price = 5.12
	},
	modAirFilter = {
		label = _U('air_filter'),
		parent = 'cosmetics',
		modType = 40,
		price = 3.72
	},
	modStruts = {
		label = _U('struts'),
		parent = 'cosmetics',
		modType = 41,
		price = 6.51
	},
	modArchCover = {
		label = _U('arch_cover'),
		parent = 'cosmetics',
		modType = 42,
		price = 4.19
	},
	modAerials = {
		label = _U('aerials'),
		parent = 'cosmetics',
		modType = 43,
		price = 1.12
	},
	modTrimB = {
		label = _U('wings'),
		parent = 'cosmetics',
		modType = 44,
		price = 6.05
	},
	modTank = {
		label = _U('fuel_tank'),
		parent = 'cosmetics',
		modType = 45,
		price = 4.19
	},
	modWindows = {
		label = _U('windows'),
		parent = 'cosmetics',
		modType = 46,
		price = 4.19
	},
	modLivery = {
		label = _U('stickers'),
		parent = 'cosmetics',
		modType = 48,
		price = 9.3
	},

	wheels = {
		label = _U('wheels'),
		parent = 'cosmetics',
		modFrontWheelsTypes = _U('wheel_type'),
		modFrontWheelsColor = _U('wheel_color'),
		tyreSmokeColor = _U('tiresmoke')
	},
	modFrontWheelsTypes = {
		label				= _U('wheel_type'),
		parent				= 'wheels',
		modFrontWheelsType0	= _U('sport'),
		modFrontWheelsType1	= _U('muscle'),
		modFrontWheelsType2	= _U('lowrider'),
		modFrontWheelsType3	= _U('suv'),
		modFrontWheelsType4	= _U('allterrain'),
		modFrontWheelsType5	= _U('tuning'),
		modFrontWheelsType6	= _U('motorcycle'),
		modFrontWheelsType7	= _U('highend')
	},
	modFrontWheelsType0 = {
		label = _U('sport'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 0,
		price = 4.65
	},
	modFrontWheelsType1 = {
		label = _U('muscle'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 1,
		price = 4.19
	},
	modFrontWheelsType2 = {
		label = _U('lowrider'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 2,
		price = 4.65
	},
	modFrontWheelsType3 = {
		label = _U('suv'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 3,
		price = 4.19
	},
	modFrontWheelsType4 = {
		label = _U('allterrain'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 4,
		price = 4.19
	},
	modFrontWheelsType5 = {
		label = _U('tuning'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 5,
		price = 5.12
	},
	modFrontWheelsType6 = {
		label = _U('motorcycle'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 6,
		price = 3.26
	},
	modFrontWheelsType7 = {
		label = _U('highend'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 7,
		price = 5.12
	},
	modFrontWheelsColor = {
		label = _U('wheel_color'),
		parent = 'wheels'
	},
	wheelColor = {
		label = _U('wheel_color'),
		parent = 'modFrontWheelsColor',
		modType = 'wheelColor',
		price = 0.66
	},
	plateIndex = {
		label = _U('licenseplates'),
		parent = 'cosmetics',
		modType = 'plateIndex',
		price = 1.1
	},
	resprays = {
		label = _U('respray'),
		parent = 'cosmetics',
		primaryRespray = _U('primary'),
		secondaryRespray = _U('secondary'),
		pearlescentRespray = _U('pearlescent'),
		dashboardRespray = _U('dashboard'),
		interiorRespray = _U('interior'),
	},
	primaryRespray = {
		label = _U('primary'),
		parent = 'resprays',
	},
	secondaryRespray = {
		label = _U('secondary'),
		parent = 'resprays',
	},
	pearlescentRespray = {
		label = _U('pearlescent'),
		parent = 'resprays',
	},
	dashboardRespray = {
		label = _U('dashboard'),
		parent = 'resprays',
	},
	interiorRespray = {
		label = _U('interior'),
		parent = 'resprays',
	},
	color1 = {
		label = _U('primary'),
		parent = 'primaryRespray',
		modType = 'color1',
		price = 1.12
	},
	color2 = {
		label = _U('secondary'),
		parent = 'secondaryRespray',
		modType = 'color2',
		price = 0.66
	},
	pearlescentColor = {
		label = _U('pearlescent'),
		parent = 'pearlescentRespray',
		modType = 'pearlescentColor',
		price = 0.88
	},
	dashboardColor = {
		label = _U('dashboard'),
		parent = 'dashboardRespray',
		modType = 'dashboardColor',
		price = 0.66
	},
	interiorColor = {
		label = _U('interior'),
		parent = 'interiorRespray',
		modType = 'interiorColor',
		price = 0.66
	},
	modXenonMenu = {
		label = _U('headlights'),
		parent = 'cosmetics',
		modXenon =  _U('headlights'),
		xenonColor = 'Faros Xenon Color'
	},
	modXenon = {
		label = _U('headlights'),
		parent = 'cosmetics',
		modType = 22,
		price = 3.72
	},
	xenonColor = {
		label = 'Faros Xenon Color',
		parent = 'modXenon',
		modType = 'xenonColor',
		price = 0.66
	},
	bodyparts = {
		label = _U('bodyparts'),
		parent = 'cosmetics',
		modFender = _U('leftfender'),
		modRightFender = _U('rightfender'),
		modSpoilers = _U('spoilers'),
		modSideSkirt = _U('sideskirt'),
		modFrame = _U('cage'),
		modHood = _U('hood'),
		modGrille = _U('grille'),
		modRearBumper = _U('rearbumper'),
		modFrontBumper = _U('frontbumper'),
		modExhaust = _U('exhaust'),
		modRoof = _U('roof')
	},
	modSpoilers = {
		label = _U('spoilers'),
		parent = 'bodyparts',
		modType = 0,
		price = 4.65
	},
	modFrontBumper = {
		label = _U('frontbumper'),
		parent = 'bodyparts',
		modType = 1,
		price = 5.12
	},
	modRearBumper = {
		label = _U('rearbumper'),
		parent = 'bodyparts',
		modType = 2,
		price = 5.12
	},
	modSideSkirt = {
		label = _U('sideskirt'),
		parent = 'bodyparts',
		modType = 3,
		price = 4.65
	},
	modExhaust = {
		label = _U('exhaust'),
		parent = 'bodyparts',
		modType = 4,
		price = 5.12
	},
	modFrame = {
		label = _U('cage'),
		parent = 'bodyparts',
		modType = 5,
		price = 5.12
	},
	modGrille = {
		label = _U('grille'),
		parent = 'bodyparts',
		modType = 6,
		price = 3.72
	},
	modHood = {
		label = _U('hood'),
		parent = 'bodyparts',
		modType = 7,
		price = 4.88
	},
	modFender = {
		label = _U('leftfender'),
		parent = 'bodyparts',
		modType = 8,
		price = 5.12
	},
	modRightFender = {
		label = _U('rightfender'),
		parent = 'bodyparts',
		modType = 9,
		price = 5.12
	},
	modRoof = {
		label = _U('roof'),
		parent = 'bodyparts',
		modType = 10,
		price = 5.58
	},
	windowTint = {
		label = _U('windowtint'),
		parent = 'cosmetics',
		modType = 'windowTint',
		price = 1.12
	},
	modHorns = {
		label = _U('horns'),
		parent = 'cosmetics',
		modType = 14,
		price = 1.12
	},
	neonColor = {
		label = _U('neons'),
		parent = 'cosmetics',
		modType = 'neonColor',
		price = 1.12
	},
	tyreSmokeColor = {
		label = _U('tiresmoke'),
		parent = 'wheels',
		modType = 'tyreSmokeColor',
		price = 1.12
	}

}

Config.Mechanic = {}
Config.Mechanic.DrawDistance               = 100.0
Config.Mechanic.MaxInService               = -1
Config.Mechanic.EnablePlayerManagement     = true
Config.Mechanic.EnableSocietyOwnedVehicles = false


Config.Mechanic.Zones = {

	MechanicTaquilla = {
		Pos   = { x = -312.57, y = -130.26, z = 38.05 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicTaquilla2 = {
		Pos   = { x = 962.61, y = -2995.1, z = -40.6 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicTaquilla3 = {
		Pos   = { x = 1188.25, y = 2641.97, z = 37.42 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicTaquilla4 = {
		Pos   = { x = 100.89, y = 6617.34, z = 31.45 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicTaquilla5 = {
		Pos   = { x = -1160.82, y = -2032.62, z = 12.20 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicTaquilla6 = {
		Pos   = { x = -199.05, y = -1315.69, z = 30.10 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 0, g = 0, b = 0 },
		Type  = 27
	},

--	MechanicVault = {
--		Pos   = { x = 0, y = -130.66, z = 39.01 },
--		Size  = { x = 0.4, y = 0.4, z = 0.3 },
		--Color = { r = 0, g = 128, b = 255 },
--		Color = { r = 204, g = 204, b = 0 },
--		Type  = 27
--	},

	MechanicCloakroom = {
		Pos   = { x = -310.87, y = -136.35, z = 38.05 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicCloakroom2 = {
		Pos   = { x = 959.54, y = -3005.27, z = -40.6 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicCloakroom3 = {
		Pos   = { x = 1188.17, y = 2639.99, z = 37.42 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicCloakroom4 = {
		Pos   = { x = 102.24, y = 6615.74, z = 31.45 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicCloakroom5 = {
		Pos   = { x = -1167.41, y = -2029.84, z = 12.20 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicCloakroom6 = {
		Pos   = { x = -196.93, y = -1319.93, z = 30.15 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	MechanicActions = {
		Pos   = { x = -305.99, y = -119., z = 38.05 },
		Size  = { x = 1.2, y = 1.2, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 255, g = 245, b = 44 },
		Type  = 27
	},

	Garage = {
		Pos   = { x = 0, y = -1315.7, z = 31.09 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		--Color = { r = 0, g = 128, b = 255 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 27
	},

	Craft = {
		Pos   = { x = 0, y = -1320.03, z = 31.09 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
	--	Color = { r = 0, g = 128, b = 255 },
		
		Type  = 27
	},

	VehicleSpawnPoint = {
		Pos   = { x = 0, y = 0, z = 31.40 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = { x = 0, y = 0, z = 30.50 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	VehicleDelivery = {
		Pos   = { x = 0, y = 0, z = 31.40 },
		Size  = { x = 20.0, y = 20.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
}


Config.Mechanic.Uniforms = {
	recrue = {
		male = {
			['tshirt_1'] = 92,  ['tshirt_2'] = 0,
			['torso_1'] = 160,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 34,
			['pants_1'] = 131,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 247,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 211,
			['pants_1'] = 101,   ['pants_2'] = 2,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	novice = {
		male = {
			['tshirt_1'] = 92,  ['tshirt_2'] = 0,
			['torso_1'] = 160,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 34,
			['pants_1'] = 131,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 247,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 211,
			['pants_1'] = 101,   ['pants_2'] = 2,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	experimente = {
		male = {
			['tshirt_1'] = 92,  ['tshirt_2'] = 0,
			['torso_1'] = 160,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 34,
			['pants_1'] = 131,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 247,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 211,
			['pants_1'] = 101,   ['pants_2'] = 2,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	chief = {
		male = {
			['tshirt_1'] = 92,  ['tshirt_2'] = 0,
			['torso_1'] = 160,   ['torso_2'] = 11,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 34,
			['pants_1'] = 131,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 247,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 211,
			['pants_1'] = 101,   ['pants_2'] = 2,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},

	boss = {
		male = {
			['tshirt_1'] = 92,  ['tshirt_2'] = 0,
			['torso_1'] = 160,   ['torso_2'] = 12,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 34,
			['pants_1'] = 131,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 247,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 211,
			['pants_1'] = 101,   ['pants_2'] = 2,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	}
}

Config.Sit = {}

Config.Sit.Healing = 3 -- // If this is 0, then its disabled.. Default: 3.. That means, if a person lies in a bed, then he will get 1 health every 3 seconds.

-- [[ https://docs.fivem.net/game-references/controls/ ]]

Config.Sit.Text = {
	SitOnChair = '~INPUT_PICKUP~ para sentarse en la silla',
	SitOnBed = '~INPUT_PICKUP~ para sentarte en la camilla',
	LieOnBed = '~INPUT_PICKUP~ para acostarte',
	SwitchBetween = '~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ cambiar entre',
	Standup = '¡~INPUT_VEH_DUCK~ para levantarte!',
}

Config.Sit.objects = {
	ButtonToSitOnChair = 38, -- // --  E -- // https://docs.fivem.net/game-references/controls/
	ButtonToLayOnBed = 38, -- // -- E -- // https://docs.fivem.net/game-references/controls/
	ButtonToStandUp = 73, -- // -- X -- // https://docs.fivem.net/game-references/controls/
	SitAnimation = {anim='PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'},
	BedBackAnimation = {dict='anim@gangops@morgue@table@', anim='ko_front'},
	BedStomachAnimation = {dict='amb@lo_res_idles@', anim='lying_face_down_lo_res_base'},    --{anim='WORLD_HUMAN_SUNBATHE'},
	BedSitAnimation = {anim='WORLD_HUMAN_PICNIC'},
	bedlocations = {
		{object=GetHashKey("v_med_bed2"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		{object=GetHashKey("v_med_bed1"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		{object=GetHashKey("v_med_emptybed"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=90.0, bed=true},
		{object=-1182962909, verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=90.0, bed=true}

	},
	locations = {
	{object=GetHashKey("v_serv_ct_chair02"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.0, direction=168.0, bed=false},
	{object=GetHashKey("prop_off_chair_04"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("prop_off_chair_03"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("prop_off_chair_05"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("v_club_officechair"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("v_ilev_leath_chr"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("v_corp_offchair"), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
	{object=GetHashKey("Prop_Off_Chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_01a"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_01b"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_01c"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_04"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_05"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_06"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_09"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_10"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_bench_11"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_fib_3b_bench"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_ld_bench01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_wait_bench_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("hei_prop_heist_off_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("hei_prop_hei_skid_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_01a"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_01b"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_04a"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_04b"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_05"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_06"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_08"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_09"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chair_10"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_chateau_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_clown_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_cs_office_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_direct_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_direct_chair_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_gc_chair02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_04"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_04b"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_04_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_off_chair_05"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_old_deck_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_old_wood_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_rock_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_skid_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_skid_chair_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_skid_chair_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_sol_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_wheelchair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_wheelchair_01_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_armchair_01_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_clb_officechair_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_dinechair_01_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_ilev_p_easychair_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_soloffchair_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_yacht_chair_01_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_club_officechair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_corp_bk_chair3"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_corp_cd_chair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_corp_offchair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_chair02_ped"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_p_easychair"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ret_gc_chair03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_ld_farm_chair01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_04_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_05_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_06_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_leath_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_01_chr_a"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=0.0, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_01_chr_b"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_02_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_03b_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_table_03_chr"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_torture_ch_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_fh_dineeamesa"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_fh_kitchenstool"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_tort_stool"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_fh_kitchenstool"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_fh_kitchenstool"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("hei_prop_yah_seat_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("hei_prop_yah_seat_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("hei_prop_yah_seat_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_waiting_seat_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_yacht_seat_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_yacht_seat_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_yacht_seat_03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_hobo_seat_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_rub_couch01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("miss_rub_couch_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_ld_farm_couch01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_ld_farm_couch02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_rub_couch03"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_rub_couch04"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_lev_sofa_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_res_sofa_l_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_v_med_p_sofa_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("p_yacht_sofa_01_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_m_sofa"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_res_tre_sofa_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_tre_sofa_mess_a_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_tre_sofa_mess_b_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_tre_sofa_mess_c_s"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_roller_car_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("prop_roller_car_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_ph_bench"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("ex_prop_offchair_exec_04"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("ex_prop_offchair_exec_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("vw_prop_vw_offchair_02"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("vw_prop_casino_chair_01a"), verticalOffsetX=0.0, verticalOffsetY=0.2, verticalOffsetZ=-0.75, direction=360.0, bed=false},
	{object=GetHashKey("vw_prop_casino_track_chair_01"), verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	{object=GetHashKey("ba_prop_battle_club_chair_02"), verticalOffsetX = 0.1, verticalOffsetY = 0.0, verticalOffsetZ = 0.0, direction=180.0, bed=false},
	{object=GetHashKey("v_res_m_l_chair1"), verticalOffsetX = 0.0, verticalOffsetY = 0.0, verticalOffsetZ = -0.5, direction=180.0, bed=false},
	{object=GetHashKey("v_ilev_m_dinechair"), verticalOffsetX = -0.5, verticalOffsetY = 0.0, verticalOffsetZ = 0.0, direction=180.0, bed=false},
	{object=GetHashKey("v_ret_chair"), verticalOffsetX = -0.5, verticalOffsetY = 0.0, verticalOffsetZ = 0.0, direction=180.0, bed=false},
	{object=GetHashKey("v_ret_gc_chair02"), verticalOffsetX = 0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0, bed=false},
	{object=GetHashKey("v_med_wickerchair1"), verticalOffsetX = 0, verticalOffsetY = 0.0, verticalOffsetZ = 0.0, direction=0.0, bed=false},
	{object=GetHashKey("v_med_whickchair2"), verticalOffsetX = 0, verticalOffsetY = 0.0, verticalOffsetZ = 0.0, direction=0.0, bed=false},
	{object=-853526657, verticalOffsetX = 0, verticalOffsetY = 0.0, verticalOffsetZ = 0.2, direction=180.0, bed=false},
 }
}

Config.AIDoctor = {}
Config.AIDoctor.Locale = 'en'
Config.AIDoctor.Doktor = 10 -- Needs to be less then this amount online for it to work
Config.AIDoctor.Price = 1
Config.AIDoctor.MoneyFormat = '$'
Config.AIDoctor.MythicProgbar = false -- Set to true if you have mythic_progbar, otherwise set to false
Config.AIDoctor.MythicNotify = false -- if you have Mythic Notify then set this to true, otherwise false for standard ESX notifications.

doktorPed = {name = "Unidad médica", icon = "CHAR_CALL911", model = "s_m_m_paramedic_01", colour = 111}


Config.Surf = {}
Config.Surf.DrawDistance = 150.0

Config.Surf.Zones = {
    LocationVehicleEntering = {
        Pos = {x = -1514.87, y = -1393.22, z = 0.72}, -- Position location de Véhicule
        Size = { x = 1.5, y = 1.5, z= 0.5},
        Color = {r = 209, g = 255, b = 0},
        Type = 1,
    },
	LocationVehicleEntering2 = {
        Pos = {x = -1609.76, y = -1183.21, z = 0.72}, -- Position location de Véhicule
        Size = { x = 1.5, y = 1.5, z= 0.5},
        Color = {r = 209, g = 255, b = 0},
        Type = 1,
    },
	LocationVehicleEntering3 = {
        Pos = {x = -1290.24, y = -1800.0, z = 0.72}, -- Position location de Véhicule
        Size = { x = 1.5, y = 1.5, z= 0.5},
        Color = {r = 209, g = 255, b = 0},
        Type = 1,
    },
}


print("[^1FlagScripts^0] Main config loaded succesfully")