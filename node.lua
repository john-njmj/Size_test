gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local font = resource.load_font "ARIALN.TTF"
local text = "Hello World"
local t_delta1 
local t_delta2
local my_time1
local my_time2

my_time1 = os.time()
my_time2 = sys.now()

util.json_watch("config.json", function(config)
    -- called each time the configuration is changed. 'config'
    -- contains new current configuration values set by the user.

    text = config.text -- assign configuration 'text' value to 'text' variable
end)

function node.render()
    gl.clear(0,0,0,1)
    t_delta1 = os.time() - my_time1
    t_delta2 = sys.now() - my_time2
    my_time1 = os.time()
    my_time2 = sys.now()

    font:write(0, 0, "Size Test", 32, 1,1,1,1) 
    my_time1 = os.time()
    my_time2 = sys.now()
    font:write(250, 300, "Os.time : "..my_time1.."  "..t_delta1 , 32, 1,1,1,1) 
    font:write(250, 400, "Sys.now : "..my_time2.."  "..t_delta2 , 32, 1,1,1,1) 
end
