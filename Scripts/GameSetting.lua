function CoinMode()
    local t = {
        Name = "CoinMode";
        LayoutType = "ShowAllInRow";
        SelectType = "SelectOne";
        OneChoiceForAllPlayers = true;
        ExportOnChange = false;
        Choices = {"Home", "Convention"};
        LoadSelections = function(self, list, pn)
            if PREFSMAN:GetPreference("CoinMode") == "CoinMode_Free" then
                list[2] = true;
            else
                list[1] = true;
            end;
        end;
        SaveSelections = function(self, list, pn)
            if list[1] then
                PREFSMAN:SetPreference("CoinMode","Home");
            else
                PREFSMAN:SetPreference("CoinMode","Free");
            end;
            PREFSMAN:SavePreferences();
            --Used for testing purposes.
            --SCREENMAN:SystemMessage(PREFSMAN:GetPreference("CoinMode"))
        end;
    };
    setmetatable( t, t );
    return t;
end;