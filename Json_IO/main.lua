json = require('json')

function love.load()
	--load json files from assets
	jsonFile = love.filesystem.read("sample.json", all)
	jsonDecoded = json.decode(jsonFile)
	--decoded json becomes a lua table
	print(jsonDecoded["firstName"])
	print(jsonDecoded["address"]["city"])
end

function writeJsonFile(input)
--use normal lua table to store data
theJsonData ={
	testString = "Some text", 
	otherSaveData = 123,
	inp = ""
}
--dynamicly assigna data to the table as you go along
theJsonData["inp"] = input
--encode the table to json
outJson = json.encode(theJsonData)
--Write to file
--saved file ends up here in %appdata%\LOVE\
f = love.filesystem.newFile("outputJSON.json")
f:open("w")
f:write(outJson, all)
f:close()
end


-- Press key to write the output JSON file file
function love.keyreleased(key)

writeJsonFile("Crazy shit!")

end
