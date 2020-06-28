---------------------------------------------------------------------------------------------------
-- func: getid
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

require("scripts/globals/commands")

cmdprops =
{
    permission = 3,
    parameters = ""
}

function onTrigger(caller, entity)
    local targ = entity:getCursorTarget()

    if (targ ~= nil) then
        tpz.commands.print(caller, entity, string.format("%s's ID is: %u ", targ:getName(),targ:getID()))
    else
        tpz.commands.print(caller, entity, "Must select a target using in game cursor first.")
    end
end
