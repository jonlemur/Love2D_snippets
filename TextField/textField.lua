textField = {}
textField.__index = textField

local utf8 = require("utf8")

-- Constructor 
function textField:new(name, x, y)
	local tF = {}
	setmetatable(tF, textField)
	tF.name = name
	tF.x=x
	tF.y=y
	tF.bg = love.graphics.newImage("img/texField.png")
	tF.text= "Text"
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
	self.text = self.text .. t
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
	local rBound = 80
	local lBound = 20
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
			print(self.name .. " selected")	
		else
			self.selected = false
			print(self.name .. " deselected")
		end
	end
	
end


function textField:draw()
	love.graphics.draw(self.bg, self.x,self.y)
	love.graphics.print(self.text, self.x+5,self.y+5)
end