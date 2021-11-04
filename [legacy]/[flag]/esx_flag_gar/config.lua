Config = {
	DrawDistance = 15,
	Price = 100,
	BlipInfos = {
		Sprite = 290,
		Color = 38
	},
	BlipPound = {
		Sprite = 0,
		Color = 0
	},
	MenuPoint = {
		Color = {r = 0, g = 0, b = 255},
		Size = {x = 2.0, y = 2.0, z = 0.1},
		Marker = 1
	},
	VehiclePoint = {
		Color = {r = 255, g = 0, b = 0},
		Size = {x = 6.0, y = 6.0, z = 0.1},
		Marker = 1
	},
	TowIA = {
		spawnRadius = 100,
		drivingStyle = 786603, --786603, -- Change the driving behaviour of the truck: https://vespura.com/drivingstyle/
		towTruckModels = {
			["flatbeds"] = {
				model = "flatbed3", -- Change the model here (https://wiki.gtanet.work/index.php?title=Vehicle_Models)
				["offset"] = {["x"] = -0.5, ["y"] = -5.0, ["z"] = 1.0}
			}, -- Edit the offset of where the vehicle gets attached
			["boxtrucks"] = {
				model = "mule3",
				["offset"] = {["x"] = 0.5, ["y"] = 2.0, ["z"] = 1.0}
			}
		},
		-- Edit / Add Drivers and their information here!
		towTruckDrivers = {
			[1] = {
				name = "Driver Bob",
				icon = "CHAR_MP_ARMY_CONTACT",
				ped = "S_M_M_TRUCKER_01",
				colour = 88,
				[1] = {
					"I wont charge you a arm and a leg! ~n~ I only want your tows.",
					"Howdy partner! I'll get it towed!",
					"You called the right guy, ~n~ because I got puns from head to tow.",
					"Tow'nt worry about it, ~n~ I'll get it towed!",
					"Do you even lift bro? ~n~ Because I do!",
					"You want too hook up ~n~ some time?",
					"Sorry I took so long!",
					"We have some of the best ~n~ hookers in town!",
					"There ya go!",
					"Bob's here to the rescue!",
					"That will look good in the impound!",
					"No worries, I've got this!",
					"Can't wait to see my wife and kids...",
					"I love my job!",
					"I'll be taking that...",
					"Good Morning! What do we have here?",
					"You're coming with me!"
				}
			},
			[2] = {
				name = "Driver Joe",
				icon = "CHAR_JOE",
				ped = "MP_M_WAREMECH_01",
				colour = 27,
				[1] = {
					"Fuck you.",
					"I hate my job.",
					"You could've at least sent me a good looking one...",
					"I'll take it from here.",
					"What do we have here...",
					"I've got it.",
					"It will be at the compound.",
					"Oh, was I late?",
					"No need to thank me.",
					"You're lucky I'm doing this for free...",
					"So how's your day going?",
					"I wanna go home...",
					"I'm tired of this shit.",
					"Guess who!",
					"I'll be taking that.",
					"When will my shift end..."
				}
			}

			-- You can use this template to make your own driver.

			--  * Find the icons here:      https://wiki.gtanet.work/index.php?title=Notification_Pictures
			--  * Find the ped models here: https://wiki.gtanet.work/index.php?title=Peds
			--  * Find the colours here:    https://wiki.gtanet.work/index.php?title=Vehicle_Colors
			--  * Driver ID needs to be a number (in sequential order from the previous one. In this example it would be 3).
			--[[
			
			--Edit the NAME, ICON, PED MODEL and TRUCK COLOUR here:
			[driver_ID] = {name = "driver_name", icon = "driver_icon", ped = "ped_model", color = 'driver_colour',

							--You can add or edit any existing vehicle pickup lines here:
							[1] = {"Sample text 1","Sample text 2",}}, -- lines of dialogue. use ~n~ to separate long ones.

			  
			]]
		}
	}
}
Config.RequiredMecs = 0
 Config.Garages = {
	--Los Santos
	["San Andreas Avenue"] = {
		["key"] = "San Andreas Avenue",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(215.64, -810.32, 30.72)
			},
			["vehicle"] = {
				["position"] = vector3(231.39, -792.97, 30.6),
				["heading"] = 156.39
			},
			["towtruck"] = {
				["position"] = vector3(243.08, -831.14, 29.83),
				["heading"] = 62.57
			}
		},
		["camera"] = {
			["x"] = 238.22,
			["y"] = -789.45,
			["z"] = 32.87,
			["rotationX"] = -31.401574149728,
			["rotationY"] = 0.0,
			["rotationZ"] = -243.40157422423
		}
	},
	["Mountzonah Hospital"] = {
		["key"] = "Mountzonah Hospital",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-421.68, -349.61, 24.23)
			},
			["vehicle"] = {
				["position"] = vector3(-420.34, -360.23, 24.23),
				["heading"] = 19.11
			},
			["towtruck"] = {
				["position"] = vector3(-428.0, -363.95, 24.23),
				["heading"] = 13.44
			}
		},
		["camera"] = {
			["x"] = -426.37,
			["y"] = -365.53,
			["z"] = 24.38,
			["rotationX"] = 1.401574149728,
			["rotationY"] = 0.0,
			["rotationZ"] = 673.40157422423
		}
	},
	["Milton Road"] = {
		["key"] = "Milton Road",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-564.96, 321.59, 84.4)
			},
			["vehicle"] = {
				["position"] = vector3(-583.92, 330.64, 84.92),
				["heading"] = 263.38
			},
			["towtruck"] = {
				["position"] = vector3(-535.87, 339.27, 82.97),
				["heading"] = 167.63
			}
		},
		["camera"] = {
			["x"] = -577.77,
			["y"] = 336.99,
			["z"] = 87.4,
			["rotationX"] = -21.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 125.73228356242
		}
	},
	["North Rockford Drive"] = {
		["key"] = "North Rockford Drive",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-1362.38, -472.02, 31.6)
			},
			["vehicle"] = {
				["position"] = vector3(-1387.24, -476.32, 31.59),
				["heading"] = 101.64
			},
			["towtruck"] = {
				["position"] = vector3(-1417.98, -489.83, 33.24),
				["heading"] = 57.1
			}
		},
		["camera"] = {
			["x"] = -1393.64,
			["y"] = -486.78,
			["z"] = 33.17,
			["rotationX"] = -9.496062710881,
			["rotationY"] = 0.0,
			["rotationZ"] = -38.110235854983
		}
	},
--	["Autopia Parkway"] = {
--		["key"] = "Autopia Parkway",
--		["positions"] = {
--			["menu"] = {
--				["position"] = vector3(-70.6, -2004.57, 18.02)
--			},
--			["vehicle"] = {
--				["position"] = vector3(-83.52, -2016.7, 18.03),
--				["heading"] = 79.62
--			},
--			["towtruck"] = {
--				["position"] = vector3(-81.85, -2014.92, 18.02),
--				["heading"] = 93.51
--			}
--		},
--		["camera"] = {
--			["x"] = -74.1,
--			["y"] = -2005.58,
--			["z"] = 25.65,
--			["rotationX"] = -21.637795701623,
--			["rotationY"] = 0.0,
--			["rotationZ"] = 125.73228356242
--		}
--	},
	["Davies Avenue"] = {
		["key"] = "Davies Avenue",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(2.17, -1725.97, 29.3)
			},
			["vehicle"] = {
				["position"] = vector3(-16.6, -1741.33, 29.3),
				["heading"] = 55.34
			},
			["towtruck"] = {
				["position"] = vector3(-26.35, -1729.44, 29.3),
				["heading"] = 199.27
			}
		},
		["camera"] = {
			["x"] = -27.32,
			["y"] = -1741.98,
			["z"] = 32.29,
			["rotationX"] = -21.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = -80.22
		}
	},
	["Fudge Lane"] = {
		["key"] = "Fudge Lane",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1149.28, -1652.56, 36.48)
			},
			["vehicle"] = {
				["position"] = vector3(1153.6, -1653.8, 36.54),
				["heading"] = 206.68
			},
			["towtruck"] = {
				["position"] = vector3(1156.13, -1659.04, 36.59),
				["heading"] = 202.65
			}
		},
		["camera"] = {
			["x"] = 1159.91,
			["y"] = -1658.7,
			["z"] = 38.49,
			["rotationX"] = -21.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 50.22
		}
	},
	["West Mirror Drive"] = {
		["key"] = "West Mirror Drive",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1035.05, -766.33, 58.0)
			},
			["vehicle"] = {
				["position"] = vector3(1020.84, -767.7, 57.94),
				["heading"] = 338.7
			},
			["towtruck"] = {
				["position"] = vector3(1043.25,-760.2, 57.7),
				["heading"] = 254.73
			}

		},
		["camera"] = {
			["x"] = 1033.9,
			["y"] = -764.47,
			["z"] = 63.63,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 100.73228356242
		}
	},
	--Sandy Shores
	["Zancudo Avenue"] = {
		["key"] = "Zancudo Avenue",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1989.18, 3780.64, 32.25)
			},
			["vehicle"] = {
				["position"] = vector3(1983.22, 3774.61, 32.18),
				["heading"] = 206.33
			},
			["towtruck"] = {
				["position"] = vector3(1987.8, 3748.88, 32.24),
				["heading"] = 167.24
			}
		},
		["camera"] = {
			["x"] = 1991.18,
			["y"] = 3774.97,
			["z"] = 34.09,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 100.73228356242
		}
	},
	["Ruta 68"] = {
		["key"] = "Ruta 68",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1053.55, 2656.49, 39.65)
			},
			["vehicle"] = {
				["position"] = vector3(1059.41, 2666.38, 39.56),
				["heading"] = 356.89
			},
			["towtruck"] = {
				["position"] = vector3(1052.82, 2679.33, 39.17),
				["heading"] = 263.94
			}
		},
		["camera"] = {
			["x"] = 1068.47,
			["y"] = 2671.39,
			["z"] = 41.24,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 100.73228356242
		}
	},
	["Ruta 68 Motel"] = {
		["key"] = "Ruta 68 Motel",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(321.55, 2619.92, 44.49)
			},
			["vehicle"] = {
				["position"] = vector3(345.37, 2638.49, 44.49),
				["heading"] = 202.06
			},
			["towtruck"] = {
				["position"] = vector3(354.92, 2639.91, 44.49),
				["heading"] = 117.35
			}
		},
		["camera"] = {
			["x"] = 361.33,
			["y"] = 2637.14,
			["z"] = 47.49,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 100.73228356242
		}
	},
	-- Grapessed
	["Grapessed Main Street"] = {
		["key"] = "Grapessed Main Street",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1701.83, 4791.64, 42.01)
			},
			["vehicle"] = {
				["position"] = vector3(1699.65, 4803.28, 41.81),
				["heading"] = 93.68
			},
			["towtruck"] = {
				["position"] = vector3(1683.51, 4774.44, 41.87),
				["heading"] = 0.09
			}
		},
		["camera"] = {
			["x"] = 1704.36,
			["y"] = 4795.23,
			["z"] = 45.99,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 50.73228356242
		}
	},
	-- Paleto Bay
	["Autopista de Great Ocean"] = {
		["key"] = "Autopista de Great Ocean",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-199.68, 6234.14, 31.5)
			},
			["vehicle"] = {
				["position"] = vector3(-192.14, 6225.38, 31.49),
				["heading"] = 136.67
			},
			["towtruck"] = {
				["position"] = vector3(-178.22, 6216.99, 31.3),
				["heading"] = 134.11
			}
		},
		["camera"] = {
			["x"] = -182.25,
			["y"] = 6221.14,
			["z"] = 32.88,
			["rotationX"] = -22.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 65.73228356242
		}
	},
	-- Aeropuerto Panorama Drive
	["Aeropuerto Panorama Drive"] = {
		["key"] = "Aeropuerto Panorama Drive",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1758.15, 3297.11, 41.15)
			},
			["vehicle"] = {
				["position"] = vector3(1769.61, 3239.82, 42.20),
				["heading"] = 97.69
			},
			["towtruck"] = {
				["position"] = vector3(1769.61, 3239.82, 42.11),
				["heading"] = 97.69
			}
		},
		["camera"] = {
			["x"] = 1758.32,
			["y"] = 3259.29,
			["z"] = 43.39,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 200.0
		}
	},
	-- Clinton Avenue Garaje Galaxy
	["Clinton Avenue"] = {
		["key"] = "Clinton Avenue",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(360.4, 294.26, 103.53)
			},
			["vehicle"] = {
				["position"] = vector3(378.08, 287.74, 103.16),
				["heading"] = 67.17
			},
			["towtruck"] = {
				["position"] = vector3(377.03, 301.64, 103.3),
				["heading"] = 256.42
			}
		},
		["camera"] = {
			["x"] = 374.18,
			["y"] = 292.74,
			["z"] = 104.27,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 207.69
		}
	},
	-- Aguja Street - GYM
	["Aguja Street"] = {
		["key"] = "Aguja Street",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-1186.45, -1507.52, 4.40)
			},
			["vehicle"] = {
				["position"] = vector3(-1193.94, -1490.71, 4.38),
				["heading"] = 215.85
			},
			["towtruck"] = {
				["position"] = vector3(-1190.33, -1496.25, 4.2),
				["heading"] = 215.85
			}
		},
		["camera"] = {
			["x"] = -1194.26,
			["y"] = -1498.14,
			["z"] = 5.38,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 354.44
		}
	},
-- Occupation Avenue - Motel
	["Occupation Avenue"] = {
		["key"] = "Occupation Avenue",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(278.73, -346.31, 44.92)
			},
			["vehicle"] = {
				["position"] = vector3(290.89, -338.24, 44.96),
				["heading"] = 165.39
			},
			["towtruck"] = {
				["position"] = vector3(272.85, -359.35, 44.83),
				["heading"] = 69.74
			}
		},
		["camera"] = {
			["x"] =  297.7,
			["y"] = -333.55,
			["z"] = 46.92,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 120.69
		}
	},
	-- MountZonah
--[[	["MountZonah"] = {
		["key"] = "MountZonah",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-423.48, -342.78, 24.25)
			},
			["vehicle"] = {
				["position"] = vector3(-435.67, -350.35, 24.33),
				["heading"] = 20.71
			},
			["towtruck"] = {
				["position"] = vector3(-431.71, -349.61, 24.23),
				["heading"] = 28.06
			}
		},
		["camera"] = {
			["x"] =  -443.8,
			["y"] = -344.43,
			["z"] = 25.58,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 220.69
		}
	},]]
	-- GloryWay
	["Glory Way"] = {
		["key"] = "Glory Way",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(981.99, -209.39, 70.83)
			},
			["vehicle"] = {
				["position"] = vector3(990.13, -216.8, 70.22),
				["heading"] = 56.25
			},
			["towtruck"] = {
				["position"] = vector3(1001.91, -198.65, 70.65),
				["heading"] = 237.92
			}
		},
		["camera"] = {
			["x"] = 981.52,
			["y"] = -216.96,
			["z"] = 72.48,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 280.69
		}
	},
	-- Vespucci Boulevard
	["Vespucci Boulevard"] = {
		["key"] = "Vespucci Boulevard",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-448.83, -797.31, 30.54)
			},
			["vehicle"] = {
				["position"] = vector3(-466.29, -803.58, 30.54),
				["heading"] = 89.88
			},
			["towtruck"] = {
				["position"] = vector3(-461.17, -827.12, 30.41),
				["heading"] = 89.49
			}
		},
		["camera"] = {
			["x"] = -473.97,
			["y"] = -807.01,
			["z"] = 31.54,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 280.69
		}
	},
	-- Aeropuerto Panorama Drive
	["Aeropuerto New Empire Way"] = {
		["key"] = "Aeropuerto New Empire Way",
		["positions"] = {
			["menu"] = {
				["position"] = vector3(-940.86, -2955.67, 13.95)
			},
			["vehicle"] = {
				["position"] = vector3(-1002.13, -2979.97, 13.95),
				["heading"] = 71.44
			},
			["towtruck"] = {
				["position"] = vector3(-1002.13, -2979.97, 13.95),
				["heading"] = 71.44
			}
		},
		["camera"] = {
			["x"] = -987.4,
			["y"] = -2961.98,
			["z"] = 13.95,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 149.0
		}
	},
}
