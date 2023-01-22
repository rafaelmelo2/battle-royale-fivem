local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vServer = Tunnel.getInterface(GetCurrentResourceName())

-- SHAWTY
local eventActived, eventCoords, eventRadius

altura_pulo = 500                         -- 500 -- altura do pulo 

local safe_aleatoria = math.random(40, 70)      -- 25,50 -- gerador aleatório da primeira safe
local safe_aleatoria2 = math.random(15, 40)     -- 10,25 -- gerador aleatírio da segunda safe


--eventRadius = 0
--radius = 0




local function isPlayerInside()
    
    if not eventCoords or not eventActived then return end
    local ped = PlayerPedId()
    local coords = vec3(GlobalState.random_vec_x, GlobalState.random_vec_y, 0)
    local coords_player = GetEntityCoords(ped)
    local distance = #(vec2(eventCoords.x, eventCoords.y) - vec2(coords_player.x, coords_player.y)) 
    return ((eventRadius / 2) > distance)
end

local function isPlayerInside2()
    
    if not eventCoords or not eventActived then return end
    local ped = PlayerPedId()
    local coords = vec3(GlobalState.random_vec_x, GlobalState.random_vec_y, 0)

    local coords_player = GetEntityCoords(ped)
    local distance = #(vec2(eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria) - vec2(coords_player.x, coords_player.y)) 
    
    return ((eventRadius-200) / 2 > distance)
end

local function isPlayerInside3()
    
    if not eventCoords or not eventActived then return end
    local ped = PlayerPedId()
    local coords = vec3(GlobalState.random_vec_x, GlobalState.random_vec_y, 0)
    local coords_player = GetEntityCoords(ped)
    local distance = #(vec2(eventCoords.x+safe_aleatoria2, eventCoords.y+safe_aleatoria2) - vec2(coords_player.x, coords_player.y)) 
    return ((eventRadius-1100 / 2) > distance)
end






---@param radius float | int
RegisterNetEvent("client:startEvent", function(coords, radius) 
    
    
    
    eventCoords = coords
    eventActived = true
    eventRadius = radius + 0.0
    print("Evento COMEÇOUU")
    vRP.teleport(eventCoords.x, eventCoords.y, altura_pulo)
    --print(coords)
    CreateThread(function()
        while eventActived do
            Wait(0)
            DisableControlAction(0,311,true)
            DisableControlAction(0,46,true)
            --print("safes",safe_aleatoria,safe_aleatoria2)
            if GlobalState.contador >= GlobalState.vermelho1 and GlobalState.contador < GlobalState.vermelho2 then                
                if DoesBlipExist(blip_vermelho1) == false then
                    blip_vermelho1 = AddBlipForRadius(eventCoords.x, eventCoords.y,0, radius/2)
                    SetBlipColour(blip_vermelho1, 79)
                elseif DoesBlipExist(blip_branco1) == false and GlobalState.contador == GlobalState.branco1 then
                    blip_branco1 = AddBlipForRadius(eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria,0, ((radius-200)/2))
                    SetBlipColour(blip_branco1, 80)
                elseif eventActived == nil then
                    RemoveBlip(blip_vermelho1)
                    RemoveBlip(blip_vermelho2)
                    RemoveBlip(blip_vermelho3)
                    RemoveBlip(blip_branco1)
                    RemoveBlip(blip_branco2)
                end
      
            
            elseif GlobalState.contador == GlobalState.vermelho2 then
                if DoesBlipExist(blip_vermelho1) == 1 then
                    RemoveBlip(blip_vermelho1)
                elseif DoesBlipExist(blip_branco1) == 1 then
                    RemoveBlip(blip_branco1)
                elseif eventActived == nil then
                    RemoveBlip(blip_vermelho1)
                    RemoveBlip(blip_vermelho2)
                    RemoveBlip(blip_vermelho3)
                    RemoveBlip(blip_branco1)
                    RemoveBlip(blip_branco2)
                end 
            



            elseif GlobalState.contador >= GlobalState.vermelho2 and GlobalState.contador < GlobalState.vermelho3 then
                if DoesBlipExist(blip_vermelho2) == false then
                    blip_vermelho2 = AddBlipForRadius(eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria,0, ((radius-200)/2))
                    SetBlipColour(blip_vermelho2, 79)
                elseif DoesBlipExist(blip_branco2) == false and GlobalState.contador == GlobalState.branco2 then
                    blip_branco2 = AddBlipForRadius(eventCoords.x+safe_aleatoria2, eventCoords.y+safe_aleatoria2,0, ((radius-500)/2))
                    SetBlipColour(blip_branco2, 80) 
                elseif eventActived == nil then
                    RemoveBlip(blip_vermelho1)
                    RemoveBlip(blip_vermelho2)
                    RemoveBlip(blip_vermelho3)
                    RemoveBlip(blip_branco1)
                    RemoveBlip(blip_branco2)
                end  
            

            elseif GlobalState.contador == GlobalState.vermelho3 then
                if DoesBlipExist(blip_vermelho2) == 1 then
                    RemoveBlip(blip_vermelho2)
                elseif DoesBlipExist(blip_branco2) == 1 then
                    RemoveBlip(blip_branco2)         
                elseif eventActived == nil then
                    RemoveBlip(blip_vermelho1)
                    RemoveBlip(blip_vermelho2)
                    RemoveBlip(blip_vermelho3)
                    RemoveBlip(blip_branco1)
                    RemoveBlip(blip_branco2)
                end 
            

            elseif GlobalState.contador > GlobalState.vermelho3 then
                if DoesBlipExist(blip_vermelho3) == false then
                    blip_vermelho3 = AddBlipForRadius(eventCoords.x+safe_aleatoria2, eventCoords.y+safe_aleatoria2,0, ((radius-500)/2))
                    SetBlipColour(blip_vermelho3, 79)
                elseif eventActived == nil then
                    RemoveBlip(blip_vermelho1)
                    RemoveBlip(blip_vermelho2)
                    RemoveBlip(blip_vermelho3)
                    RemoveBlip(blip_branco1)
                    RemoveBlip(blip_branco2)
                end
             
            end 
           
        end
          
    end)

    
    CreateThread(function() 
        while eventActived do     
            
            Wait(0)
            if GlobalState.contador < GlobalState.branco1 then -- se relógio menor que GlobalState.branco1
            
                DrawMarker(1, eventCoords, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius, radius, 500.0, 255, 0, 0, 80) -- vermelho 0
                
                if isPlayerInside() then
                    --print("dentro")
                else
                    ApplyDamageToPed(PlayerPedId(), 1, false)
                    Wait(50)
                    --print("fora")     
                end
            elseif GlobalState.contador < GlobalState.vermelho2 then
                while GlobalState.contador <= GlobalState.vermelho2 do
                    Wait(0)
                    DrawMarker(1, eventCoords, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius, radius, 500.0, 255, 0, 0, 80) -- vermelha 0            
                    DrawMarker(1, eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-200, radius-200, 500.0, 255, 255, 255, 80) -- branca 1 -> vermelho 1  
                    if isPlayerInside() then
                        --print("dentro")
                    else
                        ApplyDamageToPed(PlayerPedId(), 1, false)
                        Wait(50)
                        --print("fora")     
                    end
                end
                
                DrawMarker(1, eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-200, radius-200, 500.0, 255, 0, 0, 80) -- vermelho 1 -> fechar
                if isPlayerInside2() then
                    --print("dentro")
                else
                    ApplyDamageToPed(PlayerPedId(), 1, false)
                    Wait(50)
                    --print("fora")     
                end
                
            else
                while GlobalState.contador > GlobalState.vermelho2 and eventActived do
                    Wait(0)
                    while GlobalState.contador > GlobalState.vermelho2 and GlobalState.contador <= GlobalState.branco2 do
                        Wait(0)
                        DrawMarker(1, eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-200, radius-200, 500.0, 255, 0, 0, 80) -- vermelho 2 
                        if isPlayerInside2() then
                            --print("dentro")
                        else
                            ApplyDamageToPed(PlayerPedId(), 1, false)
                            Wait(50)
                            --print("fora")     
                        end
                    end


                    while GlobalState.contador >= GlobalState.branco2 and GlobalState.contador <= GlobalState.vermelho3 do
                        Wait(0)
                        DrawMarker(1, eventCoords.x+safe_aleatoria, eventCoords.y+safe_aleatoria, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-200, radius-200, 500.0, 255, 0, 0, 80) -- vermelho 2 
                        DrawMarker(1, eventCoords.x+safe_aleatoria2,eventCoords.y+safe_aleatoria2, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-500, radius-500, 500.0, 255, 255, 255, 80) -- branco 2 -> vermelho 3
                        
                        
                        if isPlayerInside2() then
                            --print("dentro")
                        else
                            ApplyDamageToPed(PlayerPedId(), 1, false)
                            Wait(50)
                            --print("fora")     
                        end
                                   
                    end

                    while GlobalState.contador > GlobalState.vermelho3 do
                        Wait(0)
                        DrawMarker(1, eventCoords.x+safe_aleatoria2,eventCoords.y+safe_aleatoria2, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-500, radius-500, 500.0, 255, 0, 0, 80)
                        if isPlayerInside3() then
                            --print("dentro")
                        else
                            ApplyDamageToPed(PlayerPedId(), 1, false)
                            Wait(40)
                            --print("fora")     
                        end
                    end

                    DrawMarker(1, eventCoords.x+safe_aleatoria2,eventCoords.y+safe_aleatoria2, 0, vec3(0.0,0.0,0.0), vec3(0.0,0.0,0.0), eventRadius-500, radius-500, 500.0, 255, 0, 0, 80) -- vermelho 3
                    if isPlayerInside3() then
                        --print("dentro")
                    else
                        ApplyDamageToPed(PlayerPedId(), 1, false)
                        Wait(40)
                        --print("fora")     
                    end
                    
                end
                
                    
            end

        end
        
    end)
end)


RegisterNetEvent("client:stopEvent", function()
    print("Evento finalizado")
    eventCoords = nil
    eventActived = nil
    eventRadius = nil
    
    
end)
    

