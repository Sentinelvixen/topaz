---------------------------------------------------------------------------------------------------
-- func: setmusic <typeID> <songID>
-- desc: Temporarily changes music played by users client
---------------------------------------------------------------------------------------------------

require("scripts/globals/commands")

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

function onTrigger(caller, entity, typeId, songId)
    local usage = "!setmusic <type ID> <song ID>"
    local usage_extended = "type IDs: 0 = BGM (Day), 1 = BGM (Night), 2 = Solo-Battle, 3 = Party-Battle, 4 = Chocobo"

    -- validate typeId
    if (typeId == nil or typeId < 0 or typeId > 4) then
        tpz.commands.error(caller, entity, "Invalid type ID.", usage)
        tpz.commands.print(caller, entity, usage_extended)
        return
    end

    -- validate songId
    if (songId == nil or songId < 0) then
        tpz.commands.error(caller, entity, "Invalid song ID.", usage)
        tpz.commands.print(caller, entity, usage_extended)
        return
    end

    -- change music
    entity:ChangeMusic(typeId, songId)

end
