-- MENU STATE 
--Press any key to switch between states
--Back and forth

state=require("stateswitcher")

function load()
end

function love.keyreleased(key)
state.switch("states/state1/state1")
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor( 150, 50, 50 )
    love.graphics.print("Menu State", 250, 300)
end