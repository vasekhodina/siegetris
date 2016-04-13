
mechanics = {}
mechanics.fallCounter = 0
mechanics.blockGeneration = false
mechanics.tileType = {}
mechanics.tileNames = {"I","O","L","J","S","Z","T"} --7 vals
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
	mechanics.blockGeneration = true
	while mechanics.blockGeneration do 
		startPos = love.math.random(1,boardSize[1])
		block = {}
		local i=1
		for i=1,4 do
			block[i] = mechanics.newTile(t[blockName][i],startPos)
		end
		
		for i=1,4 do
			if block[i].x>1 and block[i].x<boardSize[1] then
				mechanics.blockGeneration = false
			else
				mechanics.blockGeneration = true
			end
		end
	end
end

mechanics.fallTile = function(dt)
	if block then
		if love.keyboard.isDown("down") then 					--TODO nastavit na libovolnou ovladaci klavesu
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

mechanics.moveBlockLeft = function()
	local i=1
	local movable = 1
	for i=1,4 do
		if block and block[i].x>1 and board[block[i].x-1][block[i].y]==0 then
			movable = movable*1
		else
			movable = movable*0
		end
	end
	
	if movable==1 then
		for i=1,4 do
			block[i].x = block[i].x-1
		end
	end
end

mechanics.moveBlockRight = function()
	local i=1
	local movable = 1
	for i=1,4 do
		if block and block[i].x<boardSize[1] and board[block[i].x+1][block[i].y]==0 then
			movable = movable*1
		else
			movable = movable*0
		end
	end
	
	if movable==1 then
		for i=1,4 do
			block[i].x = block[i].x+1
		end
	end
end

mechanics.checkStop = function()
	local i=1
	for i=1,4 do
		if block and block[i].y+1 > boardSize[2] then
			local n=1
			for n=1,4 do board[block[n].x][block[n].y] = 1 end
			mechanics.newBlock(mechanics.tileNames[love.math.random(1,7)])
		end
			
		if block and board[block[i].x][block[i].y+1]==1 then
			local n=1
			for n=1,4 do board[block[n].x][block[n].y] = 1 end
			mechanics.newBlock(mechanics.tileNames[love.math.random(1,7)])
		end
	end
end

mechanics.rotateBlock = function()
	local i=1
	for i=1,4 do
		if block then
			local valx = block[i].x
			local valy = block[i].y
			block[i].x = valy
			block[i].y = valx
		end
	end
end
