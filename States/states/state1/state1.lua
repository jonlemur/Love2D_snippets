--STATE 1
state=require("stateswitcher")

function load()
end

function love.keyreleased(key)
state.switch("main")
end

function love.update(dt)

end


function love.draw()
	love.graphics.setBackgroundColor( 50, 150, 50 )
    love.graphics.print("State 01", 250, 300)
end