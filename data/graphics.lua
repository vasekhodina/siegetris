graphics = {}
graphics.tileSize = 30 --pix

graphics.createTile = function()

end

graphics.drawBoard = function()
	local t = graphics.tileSize
	local xcor = (wWidth-boardSize[1]*t)/2	--korekce stredu okna v x
	local ycor = (wHeight-boardSize[2]*t)/2 --korekce stredu okna v y
	
	for i=1,boardSize[1] do
		for j=1,boardSize[2] do
			love.graphics.print(board[i][j],i*t-t+xcor+10,j*t-t+ycor+10) --test
			love.graphics.rectangle("line",i*t-t+xcor,j*t-t+ycor,t,t) --test
		end
	end
	
	if block then
		--if tile.y >= 1 then
			local i=1
			for i=1,4 do
				love.graphics.rectangle("fill",block[i].x*t+xcor-t,block[i].y*t+ycor-t,t,t)
			end
		--end
	end
end

graphics.loadPics = function()

end

