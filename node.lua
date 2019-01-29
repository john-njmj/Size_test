gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "ARIALN.TTF"
local text = "Hello World"

util.json_watch("config.json", function(config)
    -- called each time the configuration is changed. 'config'
    -- contains new current configuration values set by the user.

    text = config.text -- assign configuration 'text' value to 'text' variable
end)

function node.render()
    gl.clear(0,0,0,1)
    font:write(0, 0, "Size Test", 64, 1,1,1,1) 
    my_time = os.time()
    font:write(250, 300, "Time : "..my_time, 64, 1,1,1,1) 
end
