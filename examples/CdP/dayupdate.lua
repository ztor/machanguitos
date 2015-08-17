function Raster:update( delta )
   if not self.day then
      self.day = 0
   end

   if self.hour then
      self.hour = self.hour + delta
   else
      self.hour = delta
   end

   while self.hour >= 24 do
      self.day = self.day + 1
      self.hour = self.hour - 24
   end


   self:setpixel( 0, 0, 0, self.hour )
   -- self:setpixel( 1, i, j, self.day )

   --io.write( "Day " .. self.day .. " hour " .. self.hour .. "\n" )
end
