square_dimension = 32
window_height_in_squares = 20
window_width_in_squares = 12
fall_speed = 50

function love.conf(t)
    t.window.title="Siegetris"
    t.window.height=square_dimension * window_height_in_squares
    t.window.width=square_dimension * window_width_in_squares
end
