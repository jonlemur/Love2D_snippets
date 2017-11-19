local centerX = 0
local centerY = 0
local DEFAULT_WINDOW_WIDTH = 960
local DEFAULT_WINDOW_HEIGHT = 540
local DEFAULT_ZOOM  = 2

function love.load()
love.graphics.setDefaultFilter( "nearest", "nearest", 1 ) -- set for pixel perfect rendering
zoom = DEFAULT_ZOOM -- how zoomed in is the picture
love.window.setMode( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT, {resizable=true, vsync=false, minwidth=400, minheight=300})
centerX = love.graphics.getWidth( ) / 2 / zoom
centerY = love.graphics.getHeight( ) / 2 / zoom

moon = love.graphics.newImage("moon.png") --example image 
moonCenterX = moon:getWidth() / 2
moonCenterY = moon:getHeight() / 2
end

function love.resize(w, h)
zoom = w/DEFAULT_WINDOW_WIDTH * DEFAULT_ZOOM
centerX = love.graphics.getWidth( ) / 2 / zoom
centerY = love.graphics.getHeight( ) / 2 / zoom
end

function love.draw()
	love.graphics.scale(zoom)
	love.graphics.setBackgroundColor( 150, 50, 50 )
	love.graphics.draw(moon, centerX, centerY, 0, 1, 1, moonCenterX,moonCenterY)	
end