local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface(GetCurrentResourceName(),src)




-- SHAWTY
RegisterCommand("evento", function(source, args)
    GlobalState.vermelho1 = 1                 -- 0 -- vermelho primário
    GlobalState.branco1 = 10                  -- 60 -- branco primário
    GlobalState.vermelho2 = 15                 -- 90 -- vermelha secundária
    GlobalState.branco2 = 20                  -- 150 -- branco secundário
    GlobalState.vermelho3 = 25                -- 210 -- vermelha terciário
    local userId = vRP.getUserId(source)
    if vRP.hasPermission(userId, "admin.permissao") then
        
        GlobalState.random_vec_x = math.random(-1200.00, 1200.00)
        GlobalState.random_vec_y = math.random(-1700.00, 100.00)
        
        

        local ped = GetPlayerPed(source)
        if not(ped>0) then return end
        local coords = vec3(GlobalState.random_vec_x, GlobalState.random_vec_y, 0)
        local radius = tonumber(args[1]) or 600.0
        TriggerClientEvent("client:startEvent", -1, coords, radius)
        
        
        
        --TriggerClientEvent("Notify",source,"sucesso","EVENTO COMEÇOUUU, VAMBORA")
		
        
        local source = source
        local user_id = vRP.getUserId(source)
        
       
        
    
        
        
        
        -- GOD ALL
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id ~= nil then
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
				print("God no id",id)
                vRP.clearInv(id)
                
            end
        end
        
        
        -- PUXAR TODO MUNDO E DAR ITENS
        local x,y,z = vRPclient.getPosition(user_id)
        
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            local source = source
            local user_id = vRP.getUserId(source)
            local rsource_2 = vRP.getUserId(rsource)
            
            
            if rsource ~= user_id then
                vRPclient.giveWeapons(rsource,{["GADGET_PARACHUTE"] = { ammo = 250 }})
                vRP.giveInventoryItem(rsource_2,"bandagem",5)                
                vRP.giveInventoryItem(rsource_2,"energetico",15)
                vRPclient.teleport(rsource,x,y,z)                
                

                --TriggerClientEvent("Notify",rsource,"sucesso","EVENTO COMEÇOUUU, VAMBORA")

            else
                vRPclient.giveWeapons(user_id,{["GADGET_PARACHUTE"] = { ammo = 250 }})
                vRP.giveInventoryItem(user_id,"bandagem",5)          
                vRP.giveInventoryItem(user_id,"energetico",15)
            end
        end
        
        
        
        
        


        

        GlobalState.contador = 0
        GlobalState.var = true
        while GlobalState.contador < 10000000000 do   
            Wait(0)
            if GlobalState.var == true then 
                print(GlobalState.contador)
                GlobalState.contador = GlobalState.contador + 1
                Wait(1000)
                if GlobalState.contador == 1 then
                    mensagem = "EVENTO COMEÇOU"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,128,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(8000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                

                elseif GlobalState.contador == (GlobalState.vermelho2-30) then                
                    mensagem = "SAFE FECHA EM 30 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(8000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-15) then                
                    mensagem = "SAFE FECHA EM 15 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(8000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-5) then                
                    mensagem = "SAFE FECHA EM 5 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-4) then                
                    mensagem = "SAFE FECHA EM 4 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-3) then                
                    mensagem = "SAFE FECHA EM 3 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-2) then                
                    mensagem = "SAFE FECHA EM 2 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho2-1) then                
                    mensagem = "SAFE FECHA EM 1 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                




                elseif GlobalState.contador == GlobalState.branco1 then
                    mensagem = "PRÓXIMA SAFE NO MAPA"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,215,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(7000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                elseif GlobalState.contador == GlobalState.branco2 then
                    mensagem = "PRÓXIMA SAFE NO MAPA"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,215,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(7000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)






                elseif GlobalState.contador == (GlobalState.vermelho3-30) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 30 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(8000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                elseif GlobalState.contador == (GlobalState.vermelho3-15) and GlobalState.contador > GlobalState.branco2  then                
                    mensagem = "SAFE FECHA EM 15 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(8000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho3-5) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 5 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho3-4) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 4 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho3-3) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 3 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho3-2) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 2 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                
                elseif GlobalState.contador == (GlobalState.vermelho3-1) and GlobalState.contador > GlobalState.branco2 then                
                    mensagem = "SAFE FECHA EM 1 SEGUNDOS"
                    vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,69,0,0.8); font-size: 0px; font-family: impact; color: #fff; padding: 50px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 30px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    SetTimeout(1000,function()
                        vRPclient.removeDiv(-1,"anuncio")
                    end)
                end

                
            else
               break 
            end
        end

        
    end

end)

RegisterCommand("pararevento", function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
    TriggerClientEvent("client:stopEvent", -1)
    GlobalState.var = false
    vRPclient.removeDiv(-1,"anuncio")
    local users = vRP.getUsers()
    variavel2 = true
   
    for k,v in pairs(users) do
        --print('cheguei 1')
        local id = vRP.getUserSource(parseInt(k))
        if id then
            --print('cheguei 2', id)
            vRP.clearInv(id)
            
        end
    end
    

    
end)




-----------------------------
-- TESTE DE RETIRADA DE ITENS
-----------------------------

--print('cheguei 1')
--[[variavel2 = true
while variavel2 == true do
    Wait(0)
    print('cheguei 2')
    local rusers = vRP.getUsers()
    for k,v in pairs(rusers) do
        print('cheguei 3')
        local rsource = vRP.getUserSource(k)
        local source = source
        local rsource_2 = vRP.getUserId(rsource)
        print('teste',rsource_2)

        if rsource ~= user_id then
            print('cheguei 4')
            local qtd_bandagem = vRP.getInventoryItemAmount(rsource_2,"bandagem")
            local qtd_energetico = vRP.getInventoryItemAmount(rsource_2, "energetico")
            
            while qtd_bandagem > 0 do
                Wait(0)
                print('cheguei 5')
                vRP.tryGetInventoryItem(rsource_2,"bandagem", 1)
                break
            end
            
            while qtd_energetico > 0 do
                Wait(0)   
                print('cheguei 6')
                vRP.tryGetInventoryItem(rsource_2,"energetico", 1)
                break
            end
            if qtd_bandagem == 0 and qtd_energetico == 0 then
                
                break
            end

        elseif user_id == user_id then
            print('cheguei 7')
            local qtd_bandagem_s = vRP.getInventoryItemAmount(source,"bandagem")
            local qtd_energetico_s = vRP.getInventoryItemAmount(source, "energetico")
            
            while qtd_bandagem_s > 0 do
                Wait(0)
                --print('cheguei 8')
                vRP.tryGetInventoryItem(source,"bandagem", 1)
                break
            end
            
            while qtd_energetico_s > 0 do
                Wait(0)   
                print('cheguei 9')
                vRP.tryGetInventoryItem(source,"energetico", 1)
                break
            end
            if qtd_bandagem_s == 0 and qtd_energetico_s == 0 then
                variavel2 = false
                break
            end
        
        
        elseif qtd_bandagem == 0 and qtd_bandagem_s == 0 and qtd_energetico == 0 and qtd_energetico_s == 0 then
            print('cheguei 10')
            variavel2 = false
            break          
        
        else
            print('cheguei 11')
            variavel2 = false
            break
        end

    end
end]]--
