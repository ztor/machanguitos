-- AgentClass.outVariables( 'x', 'y' )

function Agent:init()
   io.write( ">> Agent init\n" )
   self.x = math.random( 20 )
   self.y = math.random( 20 )

   self.grassEated = 100;

   self.grassToManure = (60 + math.random( 5 ))*(10/(60*24)); -- 60 kg cada dia de estiercol

   io.write( 'init ' .. self.grassToManure .. '\n')
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
   local randX = math.random();
   local randY = math.random();
   if (randX >= 0.5) then
      self.dirX = 1;
   else
      self.dirX = -1;
   end
   if (randY >= 0.5) then
      self.dirY = 1;
   else
      self.dirY = -1;
   end

   self.dx = self.dirX*((0.2 - math.random( 40 ) / 100.0)*delta);
   self.dy = self.dirY*((0.2 - math.random( 40 ) / 100.0)*delta);


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
   rstManure:increment( 0, self.x, self.y, 200 );
   --print('x: ' .. self.x .. ' y: ' .. self.y .. ' manure: ' .. inc )
end
