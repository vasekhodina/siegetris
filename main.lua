--Require sekce
require "data/control" --main game control file

--basic vars
wWidth = 480
wHeight = 854

function love.load()
	love.window.setMode(wWidth,wHeight,{vsync=true})  --default graphics settings / 16:9 asp.r.
	control.load()
end

function love.update(dt) 	--default love2d loop use control update loop
	control.update(dt)
end

function love.draw()  --default love2d loop use control draw loop
	control.draw()
end

function love.keypressed(key)  --default love2d input handler use control input hanler
	control.input(key)
end