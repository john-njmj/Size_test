gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "ARIALN.TTF"
local text = "##"
local t_delta 
local my_time = sys.now()
local my_size = 50


util.json_watch("config.json", function(config)
    -- called each time the configuration is changed. 'config'
    -- contains new current configuration values set by the user.

    text = config.text -- assign configuration 'text' value to 'text' variable
    my_size = config.size
    text_width = font:width(text,my_size)    
end)

function node.render()
    gl.clear(0,0,0,1)
--    t_delta = sys.now() - my_time
--    my_time = sys.now()
--    --my_size = my_size +(t_delta * 25)
--    font:write(0, 0, "Size Test", 32, 1,1,1,1) 
--    font:write(0, 100, "Sys.now : "..my_time.."  "..t_delta.."  "..my_size , 45, 1,1,1,1)
--    write_w = font:write(0, 300, "X" , my_size, 1,1,1,1)
--    font:write(0, 150, "Write width : "..write_w.."  "..my_size , 45, 1,1,1,1)
--    calc_w = font:width(0, 300, "X" , my_size)
--    font:write(0, 200, "calc width : "..calc_w.."  "..my_size , 45, 1,1,1,1)
--    my_text = string.format("%s\t%s" ,"text" ,"text")
--    font:write(0, 500, my_text, 32, 1,1,1,1)
    V_POS = 0
    repeat 
        H_POS = 0
        repeat 
            font:write(V_POS,H_POS,text,my_size,1,1,1,1)
            H_POS = H_POS + text_width + 5 
        until H_POS > NATIVE_WIDTH
        V_POS = V_POS + my_size +5
   until V_POS > NATIVE_HEIGHT
end
