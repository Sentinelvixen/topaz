---------------------------------------------------------------------------------------------------
-- func: setweather
-- desc: Sets the current weather for the current zone.
---------------------------------------------------------------------------------------------------

require("scripts/globals/weather")
require("scripts/globals/commands")

cmdprops =
{
    permission = 4,
    parameters = "s"
}

function onTrigger(caller, entity, weather)
    local usage = "!setweather <weather ID>"

    local weatherList =
    {
        ["none"]            = 0,
        ["sunshine"]        = 1,
        ["clouds"]          = 2,
        ["fog"]             = 3,
        ["hot spell"]       = 4,
        ["heat wave"]       = 5,
        ["rain"]            = 6,
        ["squall"]          = 7,
        ["dust storm"]      = 8,
        ["sand storm"]      = 9,
        ["wind"]            = 10,
        ["gales"]           = 11,
        ["snow"]            = 12,
        ["blizzards"]       = 13,
        ["thunder"]         = 14,
        ["thunderstorms"]   = 15,
        ["auroras"]         = 16,
        ["stellar glare"]   = 17,
        ["gloom"]           = 18,
        ["darkness"]        = 19
    }

    -- validate weather
    if (weather == nil) then
        tpz.commands.error(caller, entity, "You must supply a weather ID.", usage)
        return
    end
    weather = tonumber(weather) or tpz.weather[string.upper(weather)] or weatherList[string.lower(weather)]
    if (weather == nil or weather < 0 or weather > 19) then
        tpz.commands.error(caller, entity, "Invalid weather ID.", usage)
        return
    end

    -- invert weather table
    local weatherByNum={}
    for k,v in pairs(weatherList) do
        weatherByNum[v]=k
    end

    -- set weather
    entity:setWeather(weather)
    tpz.commands.print(caller, entity, string.format("Set weather to %s.", weatherByNum[weather]))
end
