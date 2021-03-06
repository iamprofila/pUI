-- REWORKING THE MINIMAP
	local CF=CreateFrame("Frame")
	CF:RegisterEvent("PLAYER_ENTERING_WORLD")
	CF:SetScript("OnEvent", function(self, event)
		if not (IsAddOnLoaded("SexyMap")) then
			for i,v in pairs({
				MinimapBorder,
				MiniMapMailBorder,
				QueueStatusMinimapButtonBorder,
				select(1, TimeManagerClockButton:GetRegions()), 
				select(1, GameTimeFrame:GetRegions()),
              		}) do
                 		v:SetVertexColor(.3, .3, .3)
			end    
			MinimapBorderTop:Hide()
			MinimapZoomIn:Hide()
			MinimapZoomOut:Hide()
			MiniMapWorldMapButton:Hide()
			GameTimeFrame:Hide()
			GameTimeFrame:UnregisterAllEvents()
			GameTimeFrame.Show = kill
			--MiniMapTracking:Hide()
			--MiniMapTracking:UnregisterAllEvents()
			MinimapZoneText:SetPoint("TOPLEFT","MinimapZoneTextButton","TOPLEFT", 5, 5) -- to center the minimap zone text
			Minimap:EnableMouseWheel(true)
			Minimap:SetScript("OnMouseWheel", function(self, z)
				local c = Minimap:GetZoom()
				if(z > 0 and c < 5) then
					Minimap:SetZoom(c + 1)
				elseif(z < 0 and c > 0) then
					Minimap:SetZoom(c - 1)
				end
			end)
			Minimap:SetScript("OnMouseUp", function(self, btn)
				if btn == "RightButton" then
					_G.GameTimeFrame:Click()
				elseif btn == "MiddleButton" then
					_G.ToggleDropDownMenu(1, nil, _G.MiniMapTrackingDropDown, self)
				else
					_G.Minimap_OnClick(self)
				end
			end)
		end
	end)