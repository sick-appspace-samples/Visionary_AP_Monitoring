--[[----------------------------------------------------------------------------

  Application Name: Visionary_AP_ Monitoring
  
  Summary:
  Show interface and main board temperature.
  
  Description:
  Use the Monitor to get the temperature.
  
  How to run:
  Start by running the app (F5) or debugging (F7+F10).
  Set a breakpoint on the first row inside the main function to debug step-by-step.
  See the results in the Console.
  
  
------------------------------------------------------------------------------]]

--Start of Global Scope---------------------------------------------------------

--luacheck: globals gTimer

-- Variables, constants, serves etc. should be declared here.

-- Add a timer to measure voltage once every five seconds
gTimer = Timer.create()
Timer.setPeriodic(gTimer, true)
Timer.setExpirationTime(gTimer, 5000)
Timer.start(gTimer)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function getTemperatures()
  -- Read and print the temperature of a few measurement points.
  -- See the documentation for a complete list of available sensors or use TemperatureSensors.
  local interfaceTemperature = Monitor.Temperature.create("INTERFACE")
  print("Interface temperature: " .. Monitor.Temperature.get(interfaceTemperature) .. " C")
  local mainBoardTemperature = Monitor.Temperature.create("CENTER")
  print("Main board temperature: " .. Monitor.Temperature.get(mainBoardTemperature) .. " C")
end

local function monitorHardware()
  -- there can be added further montoring functions here
  getTemperatures()
end

Timer.register(gTimer, "OnExpired", monitorHardware)

--End of Function and Event Scope------------------------------------------------