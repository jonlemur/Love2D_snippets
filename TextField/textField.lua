textField = {}
textField.__index = textField

local utf8 = require("utf8")

-- Constructor
function textField:new(text, x, y, width, height, maxLenght)
	local tF = {}
	setmetatable(tF, textField)
	tF.x=x
	tF.y=y
	tF.width = width
	tF.height = height
	tF.text= text
	tF.maxLenght = maxLenght
	tF.font = love.graphics.newFont("font/thin_pixel-7.ttf", 25)
	tF.font:setFilter( "nearest", "nearest", 1 )
	tF.selected = false
	return tF
end

--Use this for resize events, to position textfield dynamically
function textField:reposition(x,y)
	self.x = x
	self.y = y
end

function textField:typing(t)
	if self.selected then
		if string.len(self.text)<self.maxLenght then
			self.text = self.text .. t
		end
	end
end

function textField:deleting()
        local byteoffset = utf8.offset(self.text, -1)

        if byteoffset and self.selected then
            self.text = string.sub(self.text, 1, byteoffset - 1)
        end
end


function textField:clicked(mouseX, mouseY, zoom)
	--width and height of the textfield
	local rBound = self.width
	local lBound = self.height
	rBound = rBound + self.x
	lBound = lBound + self.y

	local btnX = self.x
	btnX = btnX * zoom
	local btnY = self.y
	btnY = btnY * zoom

	rBound = rBound * zoom
	lBound = lBound * zoom

	if mouseX> btnX and mouseX<rBound then
		if mouseY> btnY and mouseY<lBound then
			self.selected = true
		else
			self.selected = false
		end
	else
		self.selected = false
	end

end


function textField:draw()
	love.graphics.setFont( self.font )
	
	if self.selected then
		love.graphics.setColor(70, 70, 70)
	else
		love.graphics.setColor(30, 30, 30)
	end

	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height )
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.print(self.text, self.x+7,self.y-5)
end

