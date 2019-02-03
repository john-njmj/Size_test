gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "ARIALN.TTF"
local text = "Hello World"
local t_delta 
local my_time = sys.now()
local my_size = 100


util.json_watch("config.json", function(config)
    -- called each time the configuration is changed. 'config'
    -- contains new current configuration values set by the user.

    text = config.text -- assign configuration 'text' value to 'text' variable
end)

function node.render()
    gl.clear(0,0,0,1)
    t_delta = sys.now() - my_time
    my_time = sys.now()
    --my_size = my_size +(t_delta * 25)
    font:write(0, 0, "Size Test", 32, 1,1,1,1) 
    font:write(0, 100, "Sys.now : "..my_time.."  "..t_delta.."  "..my_size , 45, 1,1,1,1)
    write_w = font:write(0, 300, "X" , my_size, 1,1,1,1)
    font:write(0, 150, "Write width : "..write_w.."  "..my_size , 45, 1,1,1,1)
    calc_w = font:width(0, 300, "X" , my_size)
    font:write(0, 200, "calc width : "..calc_w.."  "..my_size , 45, 1,1,1,1)
    my_text = "text" .. \t .."text"
    font:write(0, 500, my_text, 32, 1,1,1,1)
end
