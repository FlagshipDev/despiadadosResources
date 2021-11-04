Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10

Config.MarkerInfo = {Type = 27, r = 130, g = 93, b = 177, x = 1.0, y = 1.0, z = 1.0}
Config.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 0.7}

Config.UseBlips = true -- true = Use License Shop Blips
Config.RequireDMV = false -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.
Config.AdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop
Config.AdvancedWeaponShop = false -- Set to true if using esx_advancedweaponshop
Config.DMVSchool = true -- Set to true if using esx_dmvschool
Config.SellDMV = false -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
Config.Drugs = false -- Set to true if using esx_drugs
Config.WeaponShop = true -- Set to true if using esx_weaponshop

Config.Prices = {
	Aircraft = 20000,
	Boating = 12000,
	Melee = 1,
	Handgun = 10,
	SMG = 100,
	Shotgun = 50,
	Assault = 250,
	LMG = 1000,
	Sniper = 1500,
	Commercial = 7500,
	Drivers = 1000,
	DriversP = 75,
	Motorcycle = 750,
	Weed = 10000,
	Weapon = 4000
}

Config.Zones = {
	LicenseShops = {
		Coords = {
			vector3(-786.4, -2068.13, 9.02)
		}
	}
}
