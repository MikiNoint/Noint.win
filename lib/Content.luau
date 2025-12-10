local NointContent = {};

function NointContent:Init()
    if not isfolder("Noint") then
        makefolder("Noint");
    end;

    if not isfolder("Noint/Configs") then
        makefolder("Noint/Configs");
    end;

    if not isfolder("Noint/User") then
        makefolder("Noint/User");
    end;

    if not isfolder("Noint/Assets") then
        makefolder("Noint/Assets");
    end;

    if not isfolder("Noint/Logs") then
        makefolder("Noint/Logs");
    end;
end;

function NointContent:OpticalLiquid()
    NointContent:Init();

    local LuaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MikiNoint/Noint.win/refs/heads/main/lib/Userinterface.luau"))();

    LuaUI.Logo = "rbxassetid://138954762808484";

    LuaUI.CacheDirectory = "Noint/Assets";

    return LuaUI;
end;

function NointContent:Esp()
    local ESPLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MikiNoint/Noint.win/refs/heads/main/lib/Esp.luau"))();

    return ESPLib;
end;

return NointContent;
