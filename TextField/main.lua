require ("textField")

local centerX = 0
local centerY = 0
local DEFAULT_WINDOW_WIDTH = 960
local DEFAULT_WINDOW_HEIGHT = 540
local DEFAULT_ZOOM  = 2

function love.load()
	love.graphics.setDefaultFilter( "nearest", "nearest", 1 ) -- set for pixel perfect rendering
	love.keyboard.setKeyRepeat(true) -- so keys may be held
	zoom = DEFAULT_ZOOM -- how zoomed in is the picture
	love.window.setMode( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT, {resizable=true, vsync=false, minwidth=400, minheight=300})
	centerX = love.graphics.getWidth( ) / 2 / zoom
	centerY = love.graphics.getHeight( ) / 2 / zoom

	sheet = love.graphics.newImage("img/sheet01.png") --example image
	sCenterX = sheet:getWidth() / 2
	sCenterY = sheet:getHeight() / 2

	textField1 = textField:new("Text1",centerX-170,centerY-90, 80, 20, 11)
	textField2 = textField:new("text2",centerX-170,centerY-60, 120, 20, 30)

end


function love.mousepressed(x, y, button, istouch)
	textField1:clicked(x,y, zoom)
	textField2:clicked(x,y, zoom)
end

function love.keypressed(key)
    if key == "backspace" then
        textField1:deleting()
		textField2:deleting()
    end
end

function love.textinput(t)
	textField1:typing(t)
    textField2:typing(t)
end

function love.resize(w, h)
	zoom = w/DEFAULT_WINDOW_WIDTH * DEFAULT_ZOOM
	centerX = love.graphics.getWidth( ) / 2 / zoom
	centerY = love.graphics.getHeight( ) / 2 / zoom

	textField1:reposition(centerX-170,centerY-90)
	textField2:reposition(centerX-170,centerY-60)
end

function love.draw()
	love.graphics.scale(zoom)
	love.graphics.setBackgroundColor( 50, 50, 50 )
	love.graphics.draw(sheet, centerX, centerY, 0, 1, 1, sCenterX,sCenterY)
	textField1:draw()
	textField2:draw()
end
