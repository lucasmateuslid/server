local x,y = guiGetScreenSize()
local iFPS 				= 0
local iFrames 			= 0
local iStartTick 		= getTickCount()
local time = getRealTime()
local hours = time.hour
local minutes = time.minute
local seconds = time.second
if (hours >= 0 and hours < 10) then
	hours = "0"..time.hour
end
if (minutes >= 0 and minutes < 10) then
	minutes = "0"..time.minute        end
if (seconds >= 0 and seconds < 10) then
	seconds = "0"..time.second
end
local meses = {"01", "02", "03", "04", "05", "06",  "07", "08", "09", "10", "11", "12"}
local dias = {"Sunday ", "Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Fri ", "Sabado"}
local dia = ("%02d"):format(time.monthday)
local ano = ("%02d"):format(time.year + 1900)
local diaa = dias[time.weekday + 1]
local mes = meses[time.month + 1]	
local players = getElementsByType( "player" )

    
function GetFPS()
	return iFPS
end
    
addEventHandler( "onClientRender", root,function()
		iFrames = iFrames + 1
	if getTickCount() - iStartTick >= 1000 then
		iFPS 		= iFrames
		iFrames 	= 0
		iStartTick 	= getTickCount()
	end
	dxDrawText("Players : " .. tostring( #players ) .. "/150 | FPS: "..GetFPS().." | SERVIDOR DE TREINAMENTO | ",0.60*x,0.982*y,0.935*x,0.15*y,tocolor(255,255,255,255),1.0,"default","right","top",false,false,true)
end)