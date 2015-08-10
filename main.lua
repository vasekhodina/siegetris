square = nil
block = {}
block.position = {x=0,y=0}
block.squares = {}
block.squares[1] = {x=0,y=0}

function block.draw_block()
	for num,sq_pos in ipairs(block.squares) do
		love.graphics.draw(square,block.position.x + sq_pos.x,block.position.y + sq_pos.y)	
	end
end

function love.load()
	square = love.graphics.newImage("pngs/tetris_block.png")
end

function love.keypressed(key)
	if key == "left" then
		block.position.x = block.position.x - square_dimension
	end
	if key == "right" then
		block.position.x = block.position.x + square_dimension
	end
end

function love.update(dt)
	if (block.position.y >= (window_height_in_squares - 1) * square_dimension) then
		block.position.y = block.position.y
	else
		block.position.y = block.position.y + fall_speed * dt
	end
end

function love.draw(dt)
	block.draw_block()
end
