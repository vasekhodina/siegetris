
mechanics = {}
mechanics.fallCounter = 0
mechanics.tileType = {}
local t = mechanics.tileType
t["I"]= 0
t["O"]= 0
t["L"]= 0
t["J"]= 0
t["Z"]= 0
t["S"]= 0
t["T"]= 0

mechanics.createBoard = function()
	board = {}
	for i=1,boardSize[1] do
		board[i] = {}
		for j=1,boardSize[2] do
			board[i][j]=0
		end
	end
end

mechanics.newTile = function()
	tile = {}
	tile.x = love.math.random(1,boardSize[1])
	tile.y = -1
end

mechanics.fallTile = function(dt)
	
	if tile then
		if love.keyboard.isDown("down") then 					--TODO nastavit na libovolnou ovaldaci klavesu
			mechanics.fallCounter = mechanics.fallCounter+dt*5 	--5x rychlejsi pohyb
		else
			mechanics.fallCounter = mechanics.fallCounter+dt
		end

		if mechanics.fallCounter>1 then
			mechanics.checkStop()
			if tile then
				tile.y = tile.y+1
				mechanics.fallCounter = 0
			end
		end
	end
end

mechanics.moveTileLeft = function()
	if tile and tile.x>1 then
		tile.x = tile.x-1
	end
end

mechanics.moveTileRight = function()
	if tile and tile.x<boardSize[1] then
		tile.x = tile.x+1
	end
end

mechanics.checkStop = function()
	if tile and tile.y+1 > boardSize[2] then
		board[tile.x][tile.y] = 1
		tile = nil			
	end
		
	if tile and board[tile.x][tile.y+1]==1 then
		board[tile.x][tile.y] = 1
		tile = nil
	end
end
