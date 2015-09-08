-- AgentClass.outVariables( 'x', 'y' )

function Agent:init()
   io.write( ">> Agent init\n" )
   self.x = 1 + math.random( 18 )
   self.y = 1 + math.random( 19 )
   --self.hungry = 50;

   -- Esta oveja come "grassEated" de media a cada paso
   self.grassEated = (7 + math.random( 15 ))/5;

   -- El 80 % de lo que se come se aprovecha, el 20% se gasta cuando la vaca se mueve y el 10% cuando esta durmiendo. El 40% pasa a ser abono.
   self.grassToManure = self.grassEated*0.4;

   io.write( 'init ' ..  self.grassToHungry .. ' ' .. self.grassToManure .. '\n')
end

function Agent:update(delta)

   local rstDaily = raster.daily;
   local hour = rstDaily:get(0, 0, 0);

   if (hour < 8 or hour > 20) then
      --self.hungry = self.hungry - (self.hungryPasive*delta);
   else
      self:checkHill(delta);
   end

end

function Agent:checkHill(delta)
   self.dx = (0.2 - math.random( 40 ) / 100.0)*delta;
   self.dy = (0.2 - math.random( 40 ) / 100.0)*delta;

   tempX = self.x + self.dx;
   tempY = self.y + self.dy;
   local rstArea = raster.area;
   local area = rstArea:get( 0, tempX, tempY);


   if area > 0 then
      self.x = tempX;
      self.y = tempY;
      self:eatAndPoop(delta);
   end
end

function Agent:eatAndPoop(delta)
   local rstGrass = raster.grass;
   local grass = rstGrass:get( 0, self.x, self.y);
   if (grass > 0) then
      rstGrass:increment( 0, self.x, self.y, self.grassEated*delta );
      --self.hungry = self.hungry + (self.grassToHungry*delta);
   end

   --self.hungry = self.hungry - (self.hungryActive*delta);
   local rstManure = raster.manure;
   local inc = self.grassToManure * delta;
   rstManure:increment( 0, self.x, self.y, inc );
   --print('x: ' .. self.x .. ' y: ' .. self.y .. ' manure: ' .. inc )
end
