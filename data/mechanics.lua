
mechanics = {}
mechanics.fallCounter = 0
mechanics.tileType = {}
local t = mechanics.tileType
t["I"]= {{0,0},{0,1},{0,2},{0,3}}
t["O"]= {{0,0},{0,1},{1,0},{1,1}}
t["L"]= {{0,0},{0,1},{0,2},{1,2}}
t["J"]= {{1,0},{1,1},{1,2},{0,2}}
t["Z"]= {{1,0},{1,1},{0,1},{0,2}}
t["S"]= {{0,0},{0,1},{1,1},{1,2}}
t["T"]= {{0,0},{0,1},{1,1},{0,2}}

mechanics.createBoard = function()
	board = {}
	for i=1,boardSize[1] do
		board[i] = {}
		for j=1,boardSize[2] do
			board[i][j]=0
		end
	end
end

mechanics.newTile = function(offset,start)
	xoff = offset[1]
	yoff = offset[2]
	tile = {}
	tile.x = start+xoff
	tile.y = -3+yoff
	return tile
end

mechanics.newBlock = function(blockName)
	startPos = love.math.random(1,boardSize[1])
	block = {}
	local i=1
	for i=1,4 do
		block[i] = mechanics.newTile(t[blockName][i],startPos)
	end
end

mechanics.fallTile = function(dt)
	
	if block then
		if love.keyboard.isDown("down") then 					--TODO nastavit na libovolnou ovaldaci klavesu
			mechanics.fallCounter = mechanics.fallCounter+dt*5 	--5x rychlejsi pohyb
		else
			mechanics.fallCounter = mechanics.fallCounter+dt
		end

		if mechanics.fallCounter>1 then
			mechanics.checkStop()
			local i=1
			for i=1,4 do
				if block then
					block[i].y = block[i].y+1
					mechanics.fallCounter = 0
				end
			end
		end
	end
end

mechanics.moveTileLeft = function()
	local i=1
	local movable = false
	for i=1,4 do
		if block and block[i].x>1 then
			tile.x = tile.x-1
		end
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
