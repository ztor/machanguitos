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
   
	if self.day > 100 and self.day < 200 then
	   self:load( "area.png" )
	else
	   self:load( "area.png" )
	end

end
