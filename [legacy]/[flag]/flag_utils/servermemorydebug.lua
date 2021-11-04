local resourceName = GetCurrentResourceName()
local lastMemoryUsage = 0
function memory_round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
function PrintMemory()
	local memoryUsage = collectgarbage("count")
	if lastMemoryUsage == 0 then
		memoryVariation = 0
	else
		memoryVariation = (memoryUsage * 100 / lastMemoryUsage) - 100
	end
	print(resourceName .. ": " .. memory_round(memoryUsage,2) .. " Kb, Previous: " .. memory_round(lastMemoryUsage,2) .. " Kb, Diff: " .. memory_round(memoryVariation,1) .. "%")
	lastMemoryUsage = memoryUsage
	SetTimeout(GetConvarInt("sv_memorydebugtime", 1000 * 60 * 5), PrintMemory)
end
if(GetConvarInt("sv_memorydebug",0) == 1) then
	PrintMemory()
end
function DoMemoryGarbageCollection() 
	print("doing garbage collection: " .. resourceName)
	collectgarbage()
	SetTimeout(GetConvarInt("sv_memorygctime", 1000 * 60 * 15), DoMemoryGarbageCollection)
end
if(GetConvarInt("sv_memorygc",0) == 1) then
	DoMemoryGarbageCollection()
end