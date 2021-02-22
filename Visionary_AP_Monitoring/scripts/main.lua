--[[----------------------------------------------------------------------------
 
  Monitoring temperature of Visionary-T AP device.
   
------------------------------------------------------------------------------]]

--luacheck: globals gTimer

-- Configuring and starting a timer to measure once every five seconds
gTimer = Timer.create()
Timer.setPeriodic(gTimer, true)
Timer.setExpirationTime(gTimer, 5000)
Timer.start(gTimer)

local function printTemperatures()
  -- Read and print the temperature of a few measurement points.
  -- See the documentation for a complete list of available sensors.
  local illuBoardTemperature = Monitor.Temperature.create('ILLUMINATION')
  print('Illumination board temperature: ' .. Monitor.Temperature.get(illuBoardTemperature) .. ' C')
  local mainBoardTemperature = Monitor.Temperature.create('CENTER')
  print('Main board temperature: ' ..  Monitor.Temperature.get(mainBoardTemperature) .. ' C')
end

local function monitorHardware()
  printTemperatures()
end
-- Registration of the 'monitorHardware' function to the timer "OnExpired" event
Timer.register(gTimer, 'OnExpired', monitorHardware)
