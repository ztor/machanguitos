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

   -- 214 días a simular http://www.calendario-365.es/calcular/01-04-2014_01-11-2014.html
   -- abril 30 dias
   -- mayo 31 dias
   -- junio 30 dias
   -- julio 31 dias
   -- agosto 31 dias
   -- septiembre 30 dias
   -- octubre 31 dias

   if self.day > 0 and self.day <= 30 then
       self:load( "4-abril.png" )
   end
   if self.day > 30 and self.day <= 61 then
       self:load( "5-mayo.png" )
   end
    if self.day > 61 and self.day <= 91 then
       self:load( "6-junio.png" )
    end
   if self.day > 91 and self.day <= 122 then
       self:load( "7-julio.png" )
   end
   if self.day > 122 and self.day <= 153 then
       self:load( "8-agosto.png" )
   end
   if self.day > 153 and self.day <= 173 then
       self:load( "9-septiembre.png" )
   end
   if self.day > 173 and self.day <= 214 then
       self:load( "10-octubre.png" )
   end



end
