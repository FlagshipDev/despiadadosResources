Config = {}
Config.Locale = 'en'






Config.Conce = {}

Config.Conce.Main = {
	DrawDistance = 20,
	-- looks like this: 'LLL NNN' The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
	PlateLetters = 3,
	PlateNumbers = 3,
	PlateUseSpace = true
}

Config.Conce.Ambulance = {
	Shop = false, -- true = Use Ambulance Shop | false = Does Opposite
	Blips = false, -- true = Use Ambulance Blip | false = Does Opposite
	Blip = {Coords = vector3(371.66, -1611.45, 28.29), Sprite = 326, Color = 1, Display = 4, Scale = 1.0},
	License = true, -- Requires License to Buy Ambulance Vehicles.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Police = {
	Shop = false, -- true = Use Police Shop | false = Does Opposite
	Blips = false, -- true = Use Police Blip | false = Does Opposite
	Blip = {Coords = vector3(374.14, -1608.57, 28.29), Sprite = 326, Color = 3, Display = 4, Scale = 1.0},
	License = true, -- Requires License to Buy Police Vehicles.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Division = {
	Shop = false, -- true = Use Division Shop | false = Does Opposite
	Blips = false, -- true = Use Division Blip | false = Does Opposite
	Blip = {Coords = vector3(374.08, -1614.06, 28.29), Sprite = 326, Color = 3, Display = 4, Scale = 1.0},
	License = true, -- Requires License to Buy Division Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
	Heli1 = 'polmav'
}

Config.Conce.Mechanic = {
	Shop = false, -- true = Use Mechanic Shop | false = Does Opposite
	Blips = false, -- true = Use Mechanic Blip | false = Does Opposite
	Blip = {Coords = vector3(0.37, -1658.99, 28.48), Sprite = 326, Color = 17, Display = 4, Scale = 1.0},
	License = true, -- Requires License to Buy Mechanic Vehicles.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Aircraft = {
	Shop = true, -- true = Use Aircraft Shop | false = Does Opposite
	Blips = true, -- true = Use Aircraft Blip | false = Does Opposite
	Blip = {Coords = vector3(-940.0, -2963.1, 18.8), Sprite = 90, Color = 4, Display = 4, Scale = 0.7},
	License = true, -- Requires License to Buy Aircrafts.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Boat = {
	Shop = true, -- true = Use Boat Shop | false = Does Opposite
	Blips = true, -- true = Use Boat Blip | false = Does Opposite
	Blip = {Coords = vector3(-714.3, -1297.3, 4.1), Sprite = 410, Color = 3, Display = 4, Scale = 0.7},
	License = true, -- Requires License to Buy Boats.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Car = {
	Shop = true, -- true = Use Car Shop | false = Does Opposite
	Blips = true, -- true = Use Car Blip | false = Does Opposite
	Blip = {Coords = vector3(-33.7, -1102.0, 25.4), Sprite = 326, Color = 0, Display = 4, Scale = 0.7},
	License = true, -- Requires License to Buy Cars.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.Truck = {
	Shop = false, -- true = Use Truck Shop | false = Does Opposite
	Blips = false, -- true = Use Truck Blip | false = Does Opposite
	Blip = {Coords = vector3(-32.75, -1656.01, 28.49), Sprite = 67, Color = 2, Display = 4, Scale = 0.7},
	License = true, -- Requires License to Buy Trucks.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

-- You will need to setup your own callback for VIP Shop
Config.Conce.VIP = {
	Shop = true, -- true = Use VIP Shop | false = Does Opposite
	Blips = true, -- true = Use VIP Blip | false = Does Opposite
	Blip = {Coords = vector3(-796.11, -220.53, 36.8), Sprite = 326, Color = 5, Display = 4, Scale = 0.7},
	License = true, -- Requires License to Buy VIP Vehicles.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

Config.Conce.VIPBoat = {
	Shop = false, -- true = Use VIP Shop | false = Does Opposite
	Blips = false, -- true = Use VIP Blip | false = Does Opposite
	Blip = {Coords = vector3(-806.8, -1354.04, 4.22), Sprite = 326, Color = 5, Display = 4, Scale = 1.0},
	License = true, -- Requires License to Buy VIP Vehicles.
	ResellPerc = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
}

-- ShopEntering = Marker for Accessing Shop | ShopInside = Marker for Viewing Vehicles
-- ShopOutside = Marker for Purchasing Vehicles | ResellVehicle = Marker for Selling Vehicles

Config.Conce.Zones = {
	-- Ambulance Shop
	ShopEnteringAmbulance = {
		Pos    = vector3(371.66, -1611.45, 28.29),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 1
	},
	ShopInsideAmbulance = {
		Pos     = vector3(370.04, -1595.37, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 225.06,
		Type    = -1,
		ShopId  = 1
	},
	ShopOutsideAmbulance = {
		Pos     = vector3(391.74, -1619.0, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 318.34,
		Type    = -1,
		ShopId  = 1
	},
	ResellVehicleAmbulance = {
		Pos    = vector3(385.08, -1634.17, 28.29),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 1
	},
	-- Police Shop
	ShopEnteringPolice = {
		Pos    = vector3(374.14, -1608.57, 28.29),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 2
	},
	ShopInsidePolice = {
		Pos     = vector3(370.04, -1595.37, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 225.06,
		Type    = -1,
		ShopId  = 2
	},
	ShopOutsidePolice = {
		Pos     = vector3(391.74, -1619.0, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 318.34,
		Type    = -1,
		ShopId  = 2
	},
	ResellVehiclePolice = {
		Pos    = vector3(387.82, -1636.33, 28.29),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 2
	},
	-- Division Shop
	ShopEnteringDivision = {
		Pos    = vector3(374.08, -1614.06, 28.29),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 3
	},
	ShopInsideDivision = {
		Pos     = vector3(370.04, -1595.37, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 225.06,
		Type    = -1,
		ShopId  = 3
	},
	ShopOutsideDivision = {
		Pos     = vector3(391.74, -1619.0, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 318.34,
		Type    = -1,
		ShopId  = 3
	},
	ShopOutsideDivisionHeli = {
		Pos     = vector3(362.75, -1598.33, 35.95),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 311.87,
		Type    = -1,
		ShopId  = 3
	},
	ResellVehicleDivision = {
		Pos    = vector3(385.12, -1633.91, 28.29),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 3
	},
	ResellVehicleDivisionHeli = {
		Pos    = vector3(371.38, -1592.91, 35.95),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 3
	},
	-- Mechanic Shop
	ShopEnteringMechanic = {
		Pos    = vector3(0.37, -1658.99, 28.48),
		Marker = {r = 255, g = 165, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 4
	},
	ShopInsideMechanic = {
		Pos     = vector3(-17.27, -1658.88, 38.62),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 46.47,
		Type    = -1,
		ShopId  = 4
	},
	ShopOutsideMechanic = {
		Pos     = vector3(-48.61, -1690.86, 28.43),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 297.7,
		Type    = -1,
		ShopId  = 4
	},
	ResellVehicleMechanic = {
		Pos    = vector3(-17.96, -1680.72, 28.49),
		Marker = {r = 255, g = 165, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 4
	},
	-- Aircraft Shop
	ShopEnteringAircraft = {
		Pos    = vector3(-946.25, -2961.01, 13.0),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.0, y = 1.0, z = 1.0},
		Type   = 27,
		ShopId = 5
	},
	ShopInsideAircraft = {
		Pos     = vector3(-1874.7, -3137.5, 14.9), -- vector3(-1075.0, -2933.2, 14.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 333.95, -- 59.9
		Type    = -1,
		ShopId  = 5
	},
	ShopOutsideAircraft = {
		Pos     = vector3(-965.2, -2983.5, 14.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 59.9,
		Type    = -1,
		ShopId  = 5
	},
	ResellVehicleAircraft = {
		Pos    = vector3(-1003.2, -2920.7, 12.9),
		Marker = {r = 145, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 5
	},
	-- Boat Shop
	ShopEnteringBoat = {
		Pos    = vector3(-714.3, -1297.3, 4.1),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.0, y = 1.0, z = 1.0},
		Type   = 27,
		ShopId = 6
	},
	ShopInsideBoat = {
		Pos     = vector3(-816.15, -1421.98, -0.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 138.4,
		Type    = -1,
		ShopId  = 6
	},
	ShopOutsideBoat = {
		Pos     = vector3(-782.05, -1421.35, -0.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 141.35,
		Type    = -1,
		ShopId  = 6
	},
	ResellVehicleBoat = {
		Pos    = vector3(-769.14, -1378.04, -0.4),
		Marker = {r = 0, g = 17, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 6
	},
	-- Car Shop
	ShopEnteringCar = {
		Pos    = vector3(-33.7, -1102.0, 25.5),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.0, y = 1.0, z = 1.0},
		Type   = 27,
		ShopId = 7
	},
	ShopInsideCar = {
		Pos     = vector3(-47.5, -1097.2, 25.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = -20.0,
		Type    = -1,
		ShopId  = 7
	},
	ShopOutsideCar = {
		Pos     = vector3(-26.8, -1083.5, 26.6),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 70.68,
		Type    = -1,
		ShopId  = 7
	},
	ResellVehicleCar = {
		Pos    = vector3(-44.6, -1080.7, 25.6),
		Marker = {r = 0, g = 255, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 7
	},
	-- Truck Shop
	ShopEnteringTruck = {
		Pos    = vector3(-34.97, -1661.63, 28.50),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.0, y = 1.0, z = 1.0},
		Type   = 27,
		ShopId = 8
	},
	ShopInsideTruck = {
		Pos     = vector3(-48.08, -1684.45, 29.1),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 140.62,
		Type    = -1,
		ShopId  = 8
	},
	ShopOutsideTruck = {
		Pos     = vector3(-35.63, -1643.48, 29.11),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 321.05,
		Type    = -1,
		ShopId  = 8
	},
	ResellVehicleTruck = {
		Pos    = vector3(-25.63, -1678.08, 28.5),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 27,
		ShopId = 8
	},
	-- VIP Shop
	ShopEnteringVIP = {
		Pos    = vector3(-796.11, -220.53, 36.1),
		Marker = {r = 130, g = 93, b = 177},
		Size   = {x = 1.0, y = 1.0, z = 1.0},
		Type   = 27,
		ShopId = 9
	},
	ShopInsideVIP = {
		Pos     = vector3(-774.38, -232.81, 37.08),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 204.8,
		Type    = -1,
		ShopId  = 9
	},
	ShopOutsideVIP = {
		Pos     = vector3(-768.59, -233.22, 37.08),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 204.8,
		Type    = -1,
		ShopId  = 9
	},
	ResellVehicleVIP= {
		Pos    = vector3(0, 0, 36.28),
		Marker = {r = 255, g = 222, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 9
	},
	-- VIP Boat Shop
	ShopEnteringVIPBoat = {
		Pos    = vector3(-806.8, -1354.04, 4.22),
		Marker = {r = 255, g = 222, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 10
	},
	ShopInsideVIPBoat = {
		Pos     = vector3(-768.66, -1393.84, 19.62),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 136.83,
		Type    = -1,
		ShopId  = 10
	},
	ShopOutsideVIPBoat = {
		Pos     = vector3(-855.04, -1410.41, -0.47),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 201.31,
		Type    = -1,
		ShopId  = 10
	},
	ResellVehicleVIPBoat = {
		Pos    = vector3(649.82, -3103.56, -0.4),
		Marker = {r = 255, g = 222, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 10
	},
}

Config.Barber = {}

Config.Barber.Price = 25

Config.Barber.DrawDistance = 25.0
Config.Barber.MarkerSize   = vector3(1.0, 1.0, 1.0)
Config.Barber.MarkerColor  = {r = 130, g = 93, b = 177}
Config.Barber.MarkerType   = 27

Config.Barber.Shops = {
	--vector3(-814.3, -183.8, 36.6),
	vector3(136.8, -1708.4, 28.3),
	vector3(-1282.6, -1116.8, 6.0),
	vector3(1931.5, 3729.7, 31.8),
	vector3(1212.8, -472.9, 65.2),
	vector3(-32.9, -152.3, 56.1),
	vector3(-278.1, 6228.5, 30.7)
}

Config.Clothes = {}

Config.Clothes.Price = 50

Config.Clothes.DrawDistance                 = 100.0
Config.Clothes.MarkerType                   = 27
Config.Clothes.MarkerSize                   = { x = 1.0, y = 1.0, z = 1.0 }
Config.Clothes.MarkerColor                  = { r = 50, g = 50, b = 204 }

Config.Clothes.Zones = {}

Config.Clothes.Shops = {
  {x=72.254,    y=-1399.102, z=28.376},
  {x=-703.776,  y=-152.258,  z=36.415},
  {x=-167.863,  y=-298.969,  z=38.733},
  {x=428.694,   y=-800.106,  z=28.491},
  {x=-829.413,  y=-1073.710, z=10.328},
  {x=-1447.797, y=-242.461,  z=48.820},
  {x=11.632,    y=6514.224,  z=30.877},
  {x=123.646,   y=-219.440,  z=53.557},
  {x=1696.291,  y=4829.312,  z=41.063},
  {x=618.093,   y=2759.629,  z=41.088},
  {x=1190.550,  y=2713.441,  z=37.222},
  {x=-1193.429, y=-772.262,  z=16.324},
  {x=-3172.496, y=1048.133,  z=21.863},
  {x=-1108.441, y=2708.923,  z=18.107},
  {x=472.39, y=-992.7,  z=24.54},
 -- {x=-1105.81, y=-826.45,  z=13.24},
  {x=462.94, y=-996.49, z=29.75}
}

for i=1, #Config.Clothes.Shops, 1 do

	Config.Clothes.Zones['Shop_' .. i] = {
	 	Pos   = Config.Clothes.Shops[i],
	 	Size  = Config.Clothes.MarkerSize,
	 	Color = Config.Clothes.MarkerColor,
	 	Type  = Config.Clothes.MarkerType
  }

end

Config.Tattoo = {}
Config.Tattoo.DrawDistance = 25.0
Config.Tattoo.Size         = {x = 1.0, y = 1.0, z = 1.0}
Config.Tattoo.Color        = {r = 130, g = 93, b = 177}
Config.Tattoo.Type         = 27

Config.Tattoo.Zones = {
	vector3(1322.6, -1651.9, 51.3),
	vector3(-1153.6, -1425.6, 3.99),
	vector3(322.1, 180.4, 102.6),
	vector3(-3170.0, 1075.0, 19.9),
	vector3(1864.6, 3747.7, 32.1),
	vector3(-293.7,  6200.0,  30.6)
}

Config.Tattoo.TattooList = {

	["mpbusiness_overlays"] = {
		{nameHash = "MP_Buis_M_Neck_000", addedX = 0.3, addedY=0.2,addedZ=0.5,rotZ = 119.4, price = 100},
		{nameHash = "MP_Buis_M_Neck_001", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 100},
		{nameHash = "MP_Buis_M_Neck_002", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 100},
		{nameHash = "MP_Buis_M_Neck_003", addedX = -0.3, addedY=-0.2,addedZ=0.6,rotZ = -54.1, price = 100},
		{nameHash = "MP_Buis_M_LeftArm_000", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 100},
		{nameHash = "MP_Buis_M_LeftArm_001", addedX = -0.7, addedY=0.1,addedZ=0.0,rotZ = -68.4, price = 100},
		{nameHash = "MP_Buis_M_RightArm_000", addedX = 0.3, addedY=-0.7,addedZ=0.5,rotZ = 17.7, price = 100},
		{nameHash = "MP_Buis_M_RightArm_001", addedX = 0.3, addedY=0.3,addedZ=0.0,rotZ = 145.4, price = 100},
		{nameHash = "MP_Buis_M_Stomach_000", addedX = 0.7, addedY=0.4,addedZ=0.3,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_M_Chest_000", addedX = 0.7, addedY=0.4,addedZ=0.3,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_M_Chest_001", addedX = 0.7, addedY=0.4,addedZ=0.3,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_M_Back_000", addedX = -0.7, addedY=-0.3,addedZ=0.3,rotZ = -53.6, price = 100},
		{nameHash = "MP_Buis_F_Chest_000", addedX = 0.5, addedY=0.3,addedZ=0.5,rotZ = 124.9, price = 100},
		{nameHash = "MP_Buis_F_Chest_001", addedX = 0.7, addedY=0.4,addedZ=0.3,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_F_Chest_002", addedX = 0.7, addedY=0.4,addedZ=0.3,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_F_Stom_000", addedX = 0.7, addedY=0.4,addedZ=0.2,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_F_Stom_001", addedX = 0.7, addedY=0.4,addedZ=0.2,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_F_Stom_002", addedX = 0.7, addedY=0.4,addedZ=0.2,rotZ = 117.3, price = 100},
		{nameHash = "MP_Buis_F_Back_000", addedX = -0.4, addedY=-0.3,addedZ=0.2,rotZ = 299.8, price = 100},
		{nameHash = "MP_Buis_F_Back_001", addedX = -0.4, addedY=-0.3,addedZ=0.2,rotZ = 299.8, price = 100},
		{nameHash = "MP_Buis_F_Neck_000", addedX = 0.3, addedY=-0.4,addedZ=0.6,rotZ = 382.8, price = 100},
		{nameHash = "MP_Buis_F_Neck_001", addedX = -0.3, addedY=0.3,addedZ=0.7,rotZ = 214.2, price = 100},
		{nameHash = "MP_Buis_F_RArm_000", addedX = 0.5, addedY=0.0,addedZ=0.0,rotZ = 457.5, price = 100},
		{nameHash = "MP_Buis_F_LArm_000", addedX = 0.2, addedY=0.4,addedZ=0.0,rotZ = 472.0, price = 100},
		{nameHash = "MP_Buis_F_LLeg_000", addedX = -0.3, addedY=-0.1,addedZ=-0.7,rotZ = 332.0, price = 100},
		{nameHash = "MP_Buis_F_RLeg_000", addedX = -0.4, addedY=-0.1,addedZ=-0.7,rotZ = 278.0, price = 100}
	},

	["mphipster_overlays"] = {
		{nameHash = "FM_Hip_M_Tat_000", addedX = -0.7, addedY=-0.4,addedZ=0.5,rotZ = -55.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_001", addedX = -0.4, addedY=-0.7,addedZ=0.2,rotZ = -49.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_002", addedX = 0.4, addedY=0.5,addedZ=0.4,rotZ = 129.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_003", addedX = -0.8, addedY=0.1,addedZ=0.0,rotZ = -71.9, price = 150},
		{nameHash = "FM_Hip_M_Tat_004", addedX = 0.4, addedY=0.2,addedZ=0.0,rotZ = -182.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_005", addedX = -0.1, addedY=0.3,addedZ=0.6,rotZ = -182.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_006", addedX = 0.5, addedY=-0.3,addedZ=0.2,rotZ = 38.9, price = 150},
		{nameHash = "FM_Hip_M_Tat_007", addedX = -0.1, addedY=0.8,addedZ=-0.2,rotZ = 156.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_008", addedX = 0.4, addedY=-0.5,addedZ=0.5,rotZ = 51.8, price = 150},
		{nameHash = "FM_Hip_M_Tat_009", addedX = -0.7, addedY=-0.4,addedZ=-0.5,rotZ = -23.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_010", addedX = 0.5, addedY=-0.4,addedZ=-0.1,rotZ = 37.8, price = 150},
		{nameHash = "FM_Hip_M_Tat_011", addedX = -0.3, addedY=-0.2,addedZ=0.5,rotZ = 290.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_012", addedX = -0.3, addedY=-0.2,addedZ=0.5,rotZ = 290.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_013", addedX = 0.6, addedY=0.3,addedZ=0.5,rotZ = 121.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_014", addedX = 0.5, addedY=0.1,addedZ=0.1,rotZ = 121.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_015", addedX = 0.3, addedY=0.3,addedZ=0.4,rotZ = 114.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_016", addedX = 0.3, addedY=0.3,addedZ=0.0,rotZ = 114.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_017", addedX = -0.2, addedY= -0.5,addedZ= 0.1,rotZ = -27.8, price = 150},
		{nameHash = "FM_Hip_M_Tat_018", addedX = -0.4, addedY=-0.2,addedZ=0.1,rotZ = 247.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_019", addedX = -0.7, addedY=-0.5,addedZ=-0.7,rotZ = 296.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_020", addedX = -0.4, addedY=-0.4,addedZ=0.1,rotZ = 296.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_021", addedX = 0.3, addedY=-0.2,addedZ=0.5,rotZ = 74.3, price = 150},
		{nameHash = "FM_Hip_M_Tat_022", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "FM_Hip_M_Tat_023", addedX = 0.4, addedY=-0.5,addedZ=-0.1,rotZ = 24.9, price = 150},
		{nameHash = "FM_Hip_M_Tat_024", addedX = -0.3, addedY=-0.3,addedZ=0.5,rotZ = -53.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_025", addedX = -0.5, addedY=-0.4,addedZ=0.5,rotZ = -53.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_026", addedX = -0.7, addedY=0.9,addedZ=0.5,rotZ = -124.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_027", addedX = -0.3, addedY=-0.4,addedZ=0.2,rotZ = -343.4, price = 150},
		{nameHash = "FM_Hip_M_Tat_028", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "FM_Hip_M_Tat_029", addedX = 0.2, addedY=0.5,addedZ=0.0,rotZ = -200.1, price = 150},
		{nameHash = "FM_Hip_M_Tat_0250", addedX = -0.7, addedY=-0.5,addedZ=0.3,rotZ = -63.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_031", addedX = -0.7, addedY=-0.5,addedZ=0.3,rotZ = -63.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_032", addedX = -0.7, addedY=-0.5,addedZ=0.3,rotZ = -63.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_033", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_034", addedX = -0.1, addedY=0.7,addedZ=0.0,rotZ = 191.5, price = 150},
		{nameHash = "FM_Hip_M_Tat_035", addedX = 0.1, addedY=0.7,addedZ=0.0,rotZ = 145.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_036", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "FM_Hip_M_Tat_037", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "FM_Hip_M_Tat_038", addedX = 0.4, addedY=-0.8,addedZ=-0.6,rotZ = 400.1, price = 150},
		{nameHash = "FM_Hip_M_Tat_039", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "FM_Hip_M_Tat_040", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_041", addedX = -0.5, addedY=0.1,addedZ=0.2,rotZ = 258.8, price = 150},
		{nameHash = "FM_Hip_M_Tat_042", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "FM_Hip_M_Tat_043", addedX = -0.3, addedY=0.4,addedZ=0.4, rotZ = -135.4, price = 150},
		{nameHash = "FM_Hip_M_Tat_044", addedX = 0.2, addedY=-0.5,addedZ=0.4,rotZ = 13.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_045", addedX = 0.2, addedY=-0.8,addedZ=0.3,rotZ = 13.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_046", addedX = -0.5, addedY=-0.3,addedZ=0.5,rotZ = -61.2, price = 150},
		{nameHash = "FM_Hip_M_Tat_047", addedX = 0.4, addedY=0.2,addedZ=0.5,rotZ = 104.6, price = 150},
		{nameHash = "FM_Hip_M_Tat_048", addedX = -0.1, addedY=0.6,addedZ=-0.1,rotZ = 181.1, price = 150}
	},

	["mpbiker_overlays"] = {
		{nameHash = "MP_MP_Biker_Tat_000_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_001_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_002_M", addedX = 0.6, addedY=0.3,addedZ=-0.3,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_003_M", addedX = 0.6, addedY=0.2,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_004_M", addedX = 0.5, addedY=-0.2,addedZ=-0.1,rotZ = 37.8, price = 150},
		{nameHash = "MP_MP_Biker_Tat_005_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_006_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_007_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_MP_Biker_Tat_008_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_009_M", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 150},
		{nameHash = "MP_MP_Biker_Tat_010_M", addedX = 0.6, addedY=0.2,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_011_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_012_M", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_MP_Biker_Tat_013_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_014_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_MP_Biker_Tat_015_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_MP_Biker_Tat_016_M", addedX = -0.7, addedY=0.9,addedZ=0.5,rotZ = -124.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_017_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_018_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_019_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_020_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_021_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_022_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_MP_Biker_Tat_023_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_024_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_025_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_026_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_027_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_MP_Biker_Tat_028_M", addedX = 0.5, addedY=-0.4,addedZ=-0.5,rotZ = 37.8, price = 150},
		{nameHash = "MP_MP_Biker_Tat_029_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_0250_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_031_M", addedX = 0.6, addedY=0.2,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_032_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_033_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_MP_Biker_Tat_034_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_035_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_036_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_MP_Biker_Tat_037_M", addedX = -0.1, addedY=0.8,addedZ=-0.2,rotZ = 156.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_038_M", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 150},
		{nameHash = "MP_MP_Biker_Tat_039_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_040_M", addedX = 0.5, addedY=-0.4,addedZ=-0.5,rotZ = 37.8, price = 150},
		{nameHash = "MP_MP_Biker_Tat_041_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_042_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_Biker_Tat_043_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_Biker_Tat_044_M", addedX = -0.1, addedY=0.8,addedZ=-0.2,rotZ = 156.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_045_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_046_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_MP_Biker_Tat_047_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_Biker_Tat_048_M", addedX = 0.5, addedY=-0.4,addedZ=-0.6,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_Biker_Tat_049_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_Biker_Tat_050_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_051_M", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 150},
		{nameHash = "MP_MP_Biker_Tat_052_M", addedX = 0.6, addedY=0.2,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_053_M", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_MP_Biker_Tat_054_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_MP_Biker_Tat_055_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_056_M", addedX = -0.1, addedY=0.8,addedZ=-0.2,rotZ = 156.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_057_M", addedX = -0.1, addedY=0.8,addedZ=-0.5,rotZ = 156.7, price = 150},
		{nameHash = "MP_MP_Biker_Tat_058_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_059_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_MP_Biker_Tat_060_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150}
	},

	["mpairraces_overlays"] = {
		{nameHash = "MP_Airraces_Tattoo_000_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Airraces_Tattoo_001_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Airraces_Tattoo_002_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Airraces_Tattoo_003_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "MP_Airraces_Tattoo_004_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Airraces_Tattoo_005_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Airraces_Tattoo_006_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Airraces_Tattoo_007_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150}
	},

	["mpbeach_overlays"] = {
		{nameHash = "MP_Bea_M_Back_000", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Bea_M_Chest_000", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Bea_M_Chest_001", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Bea_M_Head_000", addedX = 0.3, addedY=0.2,addedZ=0.7,rotZ = 119.4, price = 150},
		{nameHash = "MP_Bea_M_Head_001", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Bea_M_Head_002", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Bea_M_Lleg_000", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_Bea_M_Rleg_000", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_Bea_M_RArm_000", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_Bea_M_Head_000", addedX = 0.3, addedY=0.2,addedZ=0.7,rotZ = 119.4, price = 150},
		{nameHash = "MP_Bea_M_LArm_000", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Bea_M_LArm_001", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Bea_M_Neck_000", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 150},
		{nameHash = "MP_Bea_M_Neck_001", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 150},
		{nameHash = "MP_Bea_M_RArm_001", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_Bea_M_Stom_000", addedX = 0.6, addedY=0.3,addedZ=0.2,rotZ = 116.6, price = 150},
		{nameHash = "MP_Bea_M_Stom_001", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150}
	},

	["mpchristmas2_overlays"] = {
		{nameHash = "MP_Xmas2_M_Tat_000", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_001", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_003", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_004", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_005", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_006", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_007", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_008", addedX = 0.3, addedY=0.3,addedZ=0.0,rotZ = 145.4, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_009", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_010", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_011", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_012", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_013", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_014", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_015", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_016", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_017", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_018", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_019", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_022", addedX = -0.4, addedY=-0.4,addedZ=0.1,rotZ = 296.0, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_023", addedX = -0.4, addedY=-0.4,addedZ=0.1,rotZ = 296.0, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_024", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_025", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_026", addedX = 0.4, addedY=-0.5,addedZ=-0.1,rotZ = 24.9, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_027", addedX = 0.4, addedY=-0.5,addedZ=-0.1,rotZ = 24.9, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_028", addedX = 0.6, addedY=0.3,addedZ=0.3,rotZ = 116.6, price = 150},
		{nameHash = "MP_Xmas2_M_Tat_029", addedX = 0.0, addedY=0.3,addedZ=0.6,rotZ = 164.8, price = 150}
	},

	["mpgunrunning_overlays"] = {
		{nameHash = "MP_Gunrunning_Tattoo_000_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_001_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_002_M", addedX = 0.4, addedY=-0.5,addedZ=-0.1,rotZ = 24.9, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_003_M", addedX = 0.3, addedY=-0.2,addedZ=0.7,rotZ = 56.9, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_004_M", addedX = -0.1, addedY=0.8,addedZ=-0.2,rotZ = 156.7, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_005_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_006_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_007_M", addedX = 0.6, addedY=0.3,addedZ=-0.3,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_008_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_009_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_010_M", addedX = 0.6, addedY=0.3,addedZ=0.3,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_011_M", addedX = -0.1, addedY=0.8,addedZ=-0.5,rotZ = 156.7, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_012_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_013_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_014_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_015_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_016_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_017_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_018_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_019_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_020_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_021_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_022_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_023_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_024_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_025_M", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_026_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_027_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_028_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_029_M", addedX = 0.6, addedY=0.3,addedZ=0.3,rotZ = 116.6, price = 150},
		{nameHash = "MP_Gunrunning_Tattoo_0250_M", addedX = 0.5, addedY=-0.4,addedZ=-0.5,rotZ = 37.8, price = 150}
	},

	["mpimportexport_overlays"] = {
		{nameHash = "MP_MP_ImportExport_Tat_000_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_001_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_002_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_003_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_004_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_005_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_006_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_007_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_008_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_009_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_010_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_MP_ImportExport_Tat_011_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150}
	},

	["mplowrider2_overlays"] = {
		{nameHash = "MP_LR_Tat_000_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_003_M", addedX = 0.3, addedY=0.3,addedZ=0.0,rotZ = 145.4, price = 150},
		{nameHash = "MP_LR_Tat_006_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_LR_Tat_008_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_011_M", addedX = 0.5, addedY=-0.3,addedZ=0.2,rotZ = 38.9, price = 150},
		{nameHash = "MP_LR_Tat_012_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_016_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_018_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150},
		{nameHash = "MP_LR_Tat_019_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_022_M", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_LR_Tat_028_M", addedX = 0.4, addedY=-0.8,addedZ=0.4,rotZ = 375.2, price = 150},
		{nameHash = "MP_LR_Tat_029_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_LR_Tat_0250_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_LR_Tat_031_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_032_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_035_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150}
	},

	["mplowrider_overlays"] = {
		{nameHash = "MP_LR_Tat_001_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_002_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_004_M", addedX = 0.5, addedY=-0.3,addedZ=0.2,rotZ = 38.9, price = 150},
		{nameHash = "MP_LR_Tat_005_M", addedX = 0.3, addedY=0.2,addedZ=0.0,rotZ = 115.5, price = 150},
		{nameHash = "MP_LR_Tat_007_M", addedX = -0.6, addedY=-0.1,addedZ=-0.7,rotZ = 2507.0, price = 150},
		{nameHash = "MP_LR_Tat_009_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_010_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_013_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_014_M", addedX = -1.1, addedY=0.2,addedZ=0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_015_M", addedX = 0.5, addedY=-0.4,addedZ=0.1,rotZ = 74.3, price = 150},
		{nameHash = "MP_LR_Tat_017_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_LR_Tat_020_M", addedX = -0.1, addedY=0.8,addedZ=-0.5,rotZ = 156.7, price = 150},
		{nameHash = "MP_LR_Tat_021_M", addedX = -1.1, addedY=0.2,addedZ=-0.2,rotZ = -431.1, price = 150},
		{nameHash = "MP_LR_Tat_023_M", addedX = -0.5, addedY=-0.5,addedZ=-0.7,rotZ = -25.0, price = 150},
		{nameHash = "MP_LR_Tat_026_M", addedX = 0.6, addedY=0.3,addedZ=0.4,rotZ = 116.6, price = 150},
		{nameHash = "MP_LR_Tat_027_M", addedX = -0.5, addedY=0.9,addedZ=0.4,rotZ = 551.7, price = 150},
		{nameHash = "MP_LR_Tat_033_M", addedX = 0.1, addedY=1.2,addedZ=0.1,rotZ = 511.9, price = 150}
	}
}

Config.Tattoo.TattooCategories = {
	{name = 'Parte 1', value = "mpbusiness_overlays"},
	{name = 'Parte 2', value = "mphipster_overlays"},
	{name = 'Parte 3', value = "mpbiker_overlays"},
	{name = 'Parte 4', value = "mpairraces_overlays"},
	{name = 'Parte 5', value = "mpbeach_overlays"},
	{name = 'Parte 6', value = "mpchristmas2_overlays"},
	{name = 'Parte 7', value = "mpgunrunning_overlays"},
	{name = 'Parte 8', value = "mpimportexport_overlays"},
	{name = 'Parte 9', value = "mplowrider2_overlays"},
	{name = 'Parte 10', value = "mplowrider_overlays"}
}


Config.Duty = {}
Config.Duty.DrawDistance               = 25.0
--language currently available EN and SV


Config.Duty.Zones = {

  PoliceDuty = {
    Name = "PoliceDuty",
	job = "police",
	offjob = "offpolice",
    Pos   = { x = 443.64, y = -982.03, z = 29.70 },
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
  },

  --AmbulanceDuty = {
  --  Name = "AmbulanceDuty",
  --  Pos   = { x = -431.48, y = -324.91, z = 33.91 },
  --  Size  = { x = 2.0, y = 2.0, z = 1.0 },
  --  Color = { r = 12, g = 255, b = 0 },  
  --  Type  = 27,
  --},

  MechanicDuty = {
    Name = "MechanicDuty", -- Los Santos Custom Normal
	job = "mechanic",
	offjob = "offmechanic",
    Pos   = { x = -347.1, y = -128.38, z = 38.02 },
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },

   MechanicDuty2 = {
    Name = "MechanicDuty2", -- Hayes AutoRepairs
	job = "mechanic2",
	offjob = "offmechanic2",
    Pos   = { x = 962.65, y = -979.34, z = 38.51},
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },

   MechanicDuty3 = {
    Name = "MechanicDuty3", -- AutoRepairs Sandy
	job = "mechanic3",
	offjob = "offmechanic3",
    Pos   = { x = 1168.68, y = 2645.07, z = 36.82},
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },

   MechanicDuty4 = {
    Name = "MechanicDuty4", --Bekers Garage & Parts
	job = "mechanic4",
	offjob = "offmechanic4",
    Pos   = { x = 101.4, y = 6612.2, z = 30.9},
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },

   MechanicDuty5 = {
    Name = "MechanicDuty5", -- Los Santos Custom Aeropuerta
	job = "mechanic5",
	offjob = "offmechanic5",
    Pos   = { x = -1143.76, y = -2001.87, z = 12.2 },
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },


   MechanicDuty6 = {
    Name = "MechanicDuty6", --Bennys
	job = "mechanic6",
	offjob = "offmechanic6",
    Pos   = { x = -185.52, y = -1312.13, z = 30.4},
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 12, g = 255, b = 0 },  
    Type  = 27,
   },
}

Config.EnableESXIdentity = true
Config.MaxSalary = 3500



Config.Spawn = {

	vehicleSpawnRate = 2, -- Seconds to wait in zone until vehicle spawns                       SUBIR A 300 sg

	Zones = {

		-- CASINO
		{
			Center = vector3(894.69726196289,-45.83462158203,78.500051498413), -- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!

				{x = 872.88362426758, y = -33.89401367188, z = 78.268915786743, h = 60.34053955078},
				{x = 876.03269775391, y = -27.69816894531, z = 78.227578735352, h = 60.235700378418},
				{x = 847.16, y = -34.13, z = 78.227578735352, h = 59.28},
				{x = 869.65, y = -11.72, z = 78.227578735352, h = 245.32},
				{x = 920.19, y = -39.07, z = 78.227578735352, h = 60.47},
				{x = 923.06, y = -88.79, z = 78.227578735352, h = 239.56}

			}
		},
		-- GARAJE ROJO
		{
			Center = vector3(-297.35,-763.81,33.97), -- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!

				{x = -290.16, y = -747.13, z = 33.96, h = 167.79},
				{x = -274.59, y = -768.44, z = 33.96, h = 72.68}

			}
		},
		-- GARAJE DE COLORES
		{
			Center = vector3(-1211.6,-659.72,40.36), -- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!

				{x = -1200.55, y = -665.27, z = 40.36, h = 135.6},
				{x = -1198.15, y = -693.05, z = 40.36, h = 40.43}

			}
		},
		-- GARAJE VINEWOOD
		{
			Center = vector3(-500.75,183.06,73.15), -- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!

				{x = -516.34, y = 163.21, z = 70.93, h = 275.34},
				{x = -486.61, y = 175.35, z = 70.93, h = 86.03},
				{x = -468.21, y = 195.18, z = 75.24, h = 175.08},
				{x = -495.48, y = 197.89, z = 70.92, h = 178.93}

			}
		},
		-- GARAJE VINEWOOD OESTE
		{
			Center = vector3(-511.9,51.52,56.70), -- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!

				{x = -502.71, y = 68.18, z = 56.5, h = 266.12},
				{x = -493.71, y = 57.42, z = 56.5, h = 90.89},
				{x = -495.85, y = 43.88, z = 52.58, h = 90.46}

			}
		},
		-- GARAJE BADU ZONA RICA
		{
			Center = vector3(454.24,250.75,109.4),-- Center of the zone
			Size = 100.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!
		
				{x = 431.29, y = 268.22, z = 103.21, h = 250.36},
				{x = 442.2, y = 244.9, z = 103.21, h = 73.76},
				{x = 470.61, y = 242.54, z = 103.21, h = 68.76}
		
			}
		}


	},

	Vehicles = {
		{
			Model   = "thrax", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "tempesta", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "comet5", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "xa21", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "sultanrs", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "visione", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "issi7", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "t20", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "zentorno", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "rebla", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "gauntlet4", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "flashgt", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "elegy", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "jester", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "seven70", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "sc1", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "adder", -- Model name of the car used to spawn vehicle
		}

	},

	ZoneSandy = {

		-- CASINO
		{
			Center = vector3(1633.95, 3601.43, 63.3), -- Center of the zone
			Size = 350.0,        -- Size of the zone
			SpawnPoints = {     -- Spawn points must be inside the zone!
				{x = 1766.76726196289, y = 3308.57462158203, z = 41.170051498413, h = 243.9853955078},
				{x = 1778.22269775391, y = 3309.61816894531, z = 41.267578735352, h = 316.235700378418},
				{x = 1672.93, y = 3605.02, z = 35.47, h = 211.57},
				{x = 1497.56, y = 3760.15, z = 33.92, h = 216.59},
				{x = 1491.66, y = 3757.28, z = 33.9, h = 217.19}
			}
		}
	},

	VehiclesSandy = {
		{
			Model   = "kamacho", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "sanchez", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "bf400", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "caracara2", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "brawler", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "verus", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "omnis", -- Model name of the car used to spawn vehicle
		},
		{
			Model   = "vagrant", -- Model name of the car used to spawn vehicle
		}
	},


}