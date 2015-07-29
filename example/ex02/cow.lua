-- AgentClass.outVariables( 'x', 'y' )

function Agent:init()

   io.write( ">> Agent init\n" )
   self.x = 5 + math.random( 100 );
   self.y = 5 + math.random( 100 );
   self.dir_x = 1;
   self.dir_y = 1;
   self.dx = 1;
   self.dy = 1;
   self.food = 50;

end

function Agent:update( delta )

   -- Comprueba la capa de desnivel y se mueve si es posible
   self:checkHill( delta );
   -- Comprueba la capa de hierba y come en funcion de la cantidad de hierba y de lo que ha comido. Caga en funcion de lo que ha comido.
   self:eatAndPoop( delta );

end

function Agent:checkHill( delta )

   tempX = self.x + self.dir_x*self.dx*delta;
   tempY = self.y + self.dir_y*self.dy*delta;
   local rstArea = raster.area;
   local area = rstArea:get( 0, tempX, tempY);
   io.write( "checkHill: (" .. tempX .. ',' .. tempY .. ') -> ' .. area .. '\n');

   if area > 0 then
      self.x = tempX;
      self.y = tempY;
   end

end

function Agent:eatAndPoop( delta )

   local rstGrass = raster.grass;
   local grass = rstGrass:get( 0, self.x, self.y);

   if (grass > 50 and self.food < 80) then
      grass = grass - 50;
      rstGrass:set( 0, self.x, self.y, grass );
      self.food = self.food +10;
   end

   self.food = self.food - 1; 
   io.write( "Grass: ".. grass .. " food: " .. self.food .. '\n' );

   if (self.food > 50) then
      local rstManure = raster.manure;
      local manure = rstManure:get( 0, self.x, self.y);
      rstManure:set( 0, self.x, self.y, manure + 8 );
      io.write( "Poop!" .. '\n');
   end

end
