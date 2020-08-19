hooksecurefunc("UnitFramePortrait_Update",function(self)
	if self.portrait then
       --if self.unit == "player" or self.unit == "pet" or self.unit == "partypet1" or self.unit == "partypet2" or self.unit == "partypet3" or self.unit == "partypet4" then return end
  		if UnitIsPlayer(self.unit) then                         
			local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
			if t then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
				self.portrait:SetTexCoord(unpack(t))
			end
		else
			self.portrait:SetTexCoord(0,1,0,1)
		end
	end
end)