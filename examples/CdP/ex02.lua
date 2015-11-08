function initialize()
io.write("CdP Example\n")
io.write(" Machen " ..config.VERSION_MAJOR .. "." ..config.VERSION_MINOR .. "\n")

config.setLogLevel("info")

data.createLayer("daily",
{
	x0 = 0.0,
	x1 = 20.0,
	y0 = 0.0,
	y1 = 20.0,
	w = 700,
	h = 700,
	default = 0,
})

data.setLayerUpdate("daily", "dayupdate")

config.setvars({
	starttime = 0.0,
	endtime = 24 * 214,
	iters = 144 * 214,
	randomseed = 1,
})

data.createLayer("grass",
    {
        x0 = 0.0,
        x1 = 20.0,
        y0 = 0.0,
        y1 = 20.0,
        w = 700,
        h = 700,
        default = 250,
    })

data.setLayerUpdate("grass", "grassupdate")

data.createLayer("manure",
{
	x0 = 0.0,
	x1 = 20.0,
	y0 = 0.0,
	y1 = 20.0,
	w = 700,
	h = 700,
	default = 0,
	layers = 3,
})

data.setLayerUpdate("manure", "manureupdate")

data.loadLayer("area", "4-abril.png",
{
	x0 = 0.0,
	x1 = 20.0,
	y0 = 0.0,
	y1 = 20.0,
})

data.setLayerUpdate("area", "areaupdate")

config.addAgent("cow", 6300)
--config.addAgent("sheep", 10200)

end

function startIteration(num)
io.write("Start iteration " ..num .. "\n")
end

function endIteration(num)
io.write("End iteration " ..num .. "\n")

if num % 30 == 0 then
--http://gifmaker.me/
raster.manure:save("export/output"..num..".png")
end

end

function endSimulation()
io.write("End Simulation\n")
end