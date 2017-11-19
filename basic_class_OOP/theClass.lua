myClass = {}
myClass.__index = myClass

function myClass:new(name)
	local c = {}
	setmetatable(c, myClass)
	c.name = name
	return c
end

function myClass:printName()
	print(self.name)
end