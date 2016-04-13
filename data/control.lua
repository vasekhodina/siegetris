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
console = ""

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
	if key == "space" then mechanics.newBlock(mechanics.tileNames[love.math.random(1,7)])
	elseif key == "left" then mechanics.moveBlockLeft()
	elseif key == "right" then mechanics.moveBlockRight()
	elseif key == "up" then mechanics.rotateBlock()
	end
end