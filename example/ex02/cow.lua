-- AgentClass.outVariables( 'x', 'y' )

function Agent:init()
   io.write( ">> Agent init\n" )
   self.x = 5 + math.random( 100 );
   self.y = 5 + math.random( 100 );
   self.dx = 1;
   self.dy = 1;
   self.hungry = 50;
end

function Agent:update( delta )

   --self:checkHill();

   self:eatAndPoop();

end

function Agent:checkHill()

   tempX = self.x + self.dx;
   tempY = self.y + self.dy;
   local rstArea = raster.area;
   local area = rstArea:get( 0, tempX, tempY);
   io.write( "checkHill: (" .. tempX .. ',' .. tempY .. ') -> ' .. area .. '\n');
   if area > 0 then
      self.x = tempX;
      self.y = tempY;
   end

end

function Agent:eatAndPoop()

   local rstGrass = raster.grass;
   local grass = rstGrass:get( 0, self.x, self.y);

   if (grass > 50 and self.hungry < 80) then
      grass = grass - 50;

      rstGrass:set( 0, self.x, self.y, grass );
      self.hungry = self.hungry +10;
   end

   self.hungry = self.hungry - 1;
   
   io.write( "Grass: ".. grass .. " Hungry: " .. self.hungry .. '\n' );

   if (self.hungry < 50) then
      local rstManure = raster.manure;
      local manure = rstManure:get( 0, self.x, self.y);
      rstManure:set( 0, self.x, self.y, manure + 8 );

      io.write( "Poop!" .. '\n');
   end

end
