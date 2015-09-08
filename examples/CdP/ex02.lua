function initialize()
   io.write( "CdP Example\n" )
   io.write( " Machen " .. config.VERSION_MAJOR .. "." .. config.VERSION_MINOR .. "\n" )

   config.setLogLevel( "info" )

   data.createLayer( "daily",
                     {
                        x0 = 0.0,
                        x1 = 20.0,
                        y0 = 0.0,
                        y1 = 20.0,
                        w = 200,
                        h = 200,
                        default = 0,
                     } )

   data.setLayerUpdate( "daily", "dayupdate" )

   config.setvars( {
                      starttime = 0.0,
                      endtime = 24*100,
                      iters = 12*100,
                      randomseed = 1,
                   } )

   data.createLayer( "grass",
                     {
                        x0 = 0.0,
                        x1 = 20.0,
                        y0 = 0.0,
                        y1 = 20.0,
                        w = 200,
                        h = 200,
                        default = 250,
                     } )

   data.setLayerUpdate( "grass", "grassupdate" )

   data.createLayer( "manure",
                     {
                        x0 = 0.0,
                        x1 = 20.0,
                        y0 = 0.0,
                        y1 = 20.0,
                        w = 200,
                        h = 200,
                        default = 0,
                        layers = 3,
                     } )

   data.setLayerUpdate( "manure", "manureupdate" )

   data.loadLayer( "area", "area.png",
                   {
                        x0 = 0.0,
                        x1 = 20.0,
                        y0 = 0.0,
                        y1 = 20.0,
                   } )
   
   data.setLayerUpdate( "area", "areaupdate" )

   config.addAgent( "cow", 1000 )
   --config.addAgent( "sheep", 100 )

   config.setvars( {
                      --dbhost = "localhost",
                      --dbport = 27017,
                      starttime = 0.0,
                      endtime = 24*100,
                      iters = 12*100,
                      randomseed = 1,
                   } )
end

function startIteration( num )
   io.write( "Start iteration " .. num .. "\n" )
end

function endIteration( num )
   io.write( "End iteration " .. num .. "\n" )

   if num % 10 == 0 then
    raster.manure:save( "export/output"..num..".png" )
   end

end

function endSimulation()
   io.write( "End Simulation\n" )
end
