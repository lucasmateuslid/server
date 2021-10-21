--[[


                  ███████╗███████╗        
                  ██╔════╝██╔════╝        
                  █████╗  ███████╗        
                  ██╔══╝  ╚════██║        
                  ██║     ███████║
                  ╚═╝     ╚══════╝
              Copyright - 2020 | 2021       
                                       

--]]


--[[
    ><><><><><><><><><><><><><><><><><><><><
    ><               Codigo               ><
    ><><><><><><><><><><><><><><><><><><><><
--]]

addEvent("hasClickLogin", true)
addEventHandler("hasClickLogin", getRootElement(), 
	function(username, password)
		if username == "" then
			exports.Scripts_Dxmessages:outputDx(source, "Preencha seu nome de usuario!", "info")
			return
		end

		if password == "" then
			exports.Scripts_Dxmessages:outputDx(source, "Preencha sua senha!", "info")
			return
		end

		local account = getAccount(username, password)
		if account == false then 
			exports.Scripts_Dxmessages:outputDx(source, "Esse nome de usuario ou senha não existe", "error")
			return
		end

		logIn(source, account, password)
		exports["infobox"]:addBox(source, "success", "Você fez o login com sucesso!")
		triggerClientEvent(source, "removeLogin", root)
	end
)

addEvent("hasClickRegister", true)
addEventHandler("hasClickRegister", getRootElement(),
	function(username, password, pass2)
		if username == "" then
			exports.Scripts_Dxmessages:outputDx(source, "Preencha seu nome de usuario!", "info")
			return
		end

		if password == "" then
			exports.Scripts_Dxmessages:outputDx(source, "Preencha sua senha!", "info")
			return
		end
		if pass2 == "" then
			exports.Scripts_Dxmessages:outputDx(source, "Corfirme sua senha!", "info")
			return
		end
		if pass2 == password then
		else
			exports.Scripts_Dxmessages:outputDx(source, "As senhas não são iguais!", "error")
			return
		end
		local account = getAccount(username, password)
		if account then
			exports.Scripts_Dxmessages:outputDx(source, "Já existe uma conta com o mesmo nome!", "error")
			return
		end
		if (#getAccountsBySerial(getPlayerSerial(source)) > 3) then
			exports.Scripts_Dxmessages:outputDx(source, "Você só pode criar apenas 3 contas!", "error")
			return
		end
		local accountAdded = addAccount(tostring(username), tostring(password)) 
		if not accountAdded then
			exports.Scripts_Dxmessages:outputDx(source, "Tente novamente com Novo Usuário e Senha!", "info")
			return
		end
		logIn(source, accountAdded, password)
		exports.Scripts_Dxmessages:outputDx(source, "Registrado com Sucesso", "Usuario: " .. username .. " | Senha: " .. password .. "", "success")
		triggerClientEvent(source, "removeLogin", root)
	end
)