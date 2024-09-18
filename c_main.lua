--- Exempel if you click on a button and a notify coming up. With coords

local coords = {
    vector4(-804.37, -1113.42, 10.63, 252.03),  
}

function DisplayHelpText(string)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(string)
    EndTextCommandDisplayHelp(1, false, false, 0)
end

CreateThread(function()
    while true do
        Wait(0)

        local Ped = PlayerPedId()
        local playerCoords = GetEntityCoords(Ped)

        for _, coord in ipairs(coords) do
            if Vdist(playerCoords, coord.x, coord.y, coord.z, coord.w) < 5.0 then
                DisplayHelpText('~INPUT_CONTEXT~ for test this')

                SetFloatingHelpTextStyle(0, 2, 2, 0, 3, 0)
                SetFloatingHelpTextWorldPosition(0, coord.x, coord.y, coord.z, coord.w + 1.0)

                if IsControlJustPressed(1, 51) then
                    TriggerEvent('QBCore:Notify', 'Tested')
                end
            end
        end
    end
end)
