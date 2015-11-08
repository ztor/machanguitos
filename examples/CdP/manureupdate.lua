function Raster:update( delta )
	local p = 0;
	local n = 0;
	local ppercent = 0.0007; --0.07%
	local npercent = 0.005;--0.5%
	--local deltap = 0.5 * delta;
	--local deltan = 0.2 * delta;

	for j = 0, self.height - 1 do
    for i = 0, self.width - 1 do

        m = self:getpixel( 0, i, j );
        --pzero = self:getpixel( 1, i, j);
        --nzero = self:getpixel( 2, i, j);

    	if (m ~= 0) then
    		-- p y n init
            p = m*ppercent*1000; -- en g ~ 40g/dia
            n = m*npercent*1000; -- en g ~ 300 g/dia
    	end

--    	if (m ~= 0 and pzero ~= 0) then
--      	p = self:getpixel( 1, i, j ) -  deltap;
--      	n = self:getpixel( 2, i, j ) -  deltan;
--    	end
        --if p < 0 then
        --   p = 0
        --  end
        --if n < 0 then
        --   n = 0
        --end


        if p and n then
            self:setpixel( 1, i, j, p );
            self:setpixel( 2, i, j, n );
        end
    end
  end
end

