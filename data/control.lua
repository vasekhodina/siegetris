--GAME CONTROL FILE
--update, draw and input handle
--main game unit and logic

--*****************REQUIRE***************
require "data/graphics"
require "data/mechanics"
--***************************************


--*****TEST VALUES*****
boardSize = {10,20} --x,y size
board = {}

--*********************


control = {}
control.load = function()
	boardSize = {10,20} --x,y size
	mechanics.createBoard()
end

control.update = function(dt)
	mechanics.fallTile(dt)
end

control.draw = function()
	graphics.drawBoard()
end

control.input = function(key)
	if key == "space" then mechanics.newBlock("L")
	elseif key == "left" then mechanics.moveTileLeft()
	elseif key == "right" then mechanics.moveTileRight()
	end
end