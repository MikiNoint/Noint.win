--[[
    	Noint.lol - Loader.luau
    License: MIT
    Author: Miki
]]

cloneref = cloneref or function(s) return s; end;
clonefunction = clonefunction or function(f) return f; end;

local ref_tostring = clonefunction(tostring);
local ref_concat = clonefunction(table.concat);
local LocalPlayer = cloneref(game:GetService('Players')).LocalPlayer;
local ref_format = clonefunction(string.format);
local ref_insert = clonefunction(table.insert);
local ref_date = clonefunction(os.date);
local ref_tick = clonefunction(tick);

identifyexecutor = identifyexecutor or getexecutorname or function()
    return "Seli\0ware" , 1;
end;

-- Create Noint Log API --
NOINT_DEBUG_FILE = NOINT_DEBUG_FILE or "Noint-"..ref_tostring(math.round(ref_tick()))..'.log';

local getformatTime = function()
	local log_time = ref_date('*t',ref_tick());
	
	return ref_format('%d-%d-%d:%d(mins),%d(secs)',log_time.year,log_time.month,log_time.day , log_time.min,log_time.sec);
end;

local log = {
	__messages = {
		"\tNoint Log - Loader: "..getformatTime()
	}
};

function log:add(message: string)
	if NOINT_DEBUG_MODE then
		ref_insert(log.__messages , "["..getformatTime().."]: "..ref_tostring(message));
	end;
end;

function log:parse()
	local data = ref_concat(log.__messages , '\n');
	
	if writefile and NOINT_DEBUG_MODE then
		writefile(NOINT_DEBUG_FILE , data);
    else
        table.clear(log.__messages);
	end;
end;

log:add("Trying to Fix Environments");

-- Fix Enviromment ---

getgenv = getgenv or getfenv;
cloneref = cloneref or function(i) return i end;
getconstant = getconstant or debug.getconstant;
getconstants = getconstants or debug.getconstants
getupvalue = getupvalue or debug.getupvalue;
getupvalues = getupvalues or debug.getupvalues;
setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set);
request = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request);
sethiddenproperty = sethiddenproperty or set_hidden_property or set_hidden_prop;
gethiddenproperty = gethiddenproperty or get_hidden_property or get_hidden_prop;
gethui = gethui or get_hidden_gui;

getcustomasset = getcustomasset or getsynasset or function(f) return "" end;

pcall(function()
	local clear = Drawing.clear or cleardawcache or clear_draw_cache;
	
	clear();
	
	getgenv().Noint_ClearDrawing = clear;
	
	Drawing.clear = clear;
end);

local quickFix = {
	['Bunni'] = {
		function() -- Fix bunni isrbxactive
			hookfunction(isrbxactive,function() return true; end)
		end,
	},
};

pcall(function()
	local execName = identifyexecutor();
	local fixes = quickFix[execName];

	if fixes then
		for i,v in next , fixes do
			pcall(v);
		end;
	end;
end);

log:add("Fixed Environments");

log:add("Loading Database");

local main_env = getgenv();
local hiddengui = gethui();
local LuarmorAPI = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local Endpoint = game:HttpGet("https://noint.lol/content.json");
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local tween_new = clonefunction(TweenInfo.new);
local newinstance = clonefunction(Instance.new);

local SoftwareDatabase = select(2,pcall(function()
	return HttpService:JSONDecode(Endpoint);
end));

local LicenseKeyFile = "NointLicense.txt";
local IsExternal = debug.info(writefile , 's') ~= '[C]'

if typeof(SoftwareDatabase) ~= 'table' then
	log:add("Failed to fetch database");
	task.wait(1);
	return log:parse();
end;

local GameDatabase = SoftwareDatabase[game.GameId] or SoftwareDatabase[tostring(game.GameId)];

local CheckKey = function(data: string)
	if not data or not string.byte(data) then
		return false , 'KEY_INVALID';
	end;
	
	local status = LuarmorAPI.check_key(data);
	
	if status.code == "KEY_VALID" then
		
		writefile(LicenseKeyFile , data);
		
		script_key = data;
		main_env.script_key = data;
		
		return true , status.code;
	end;
	
	return false , status.code;
end;

local ErrorEnum = {
	KEY_VALID = "Connecting to Server",
	KEY_HWID_LOCKED = "Hardware Id Mismatch",
	KEY_INCORRECT = "Incorrect License Key",
	KEY_EXPIRED = "License Key Is Expired",
	KEY_BANNED = "User Is Banned",
	KEY_INVALID = "Invalid License Key",
};

local LoadUI = function()
	local NointLoader = newinstance("ScreenGui",hiddengui)
	local MainFrame = newinstance("Frame")
	local LicenseFrame = newinstance("Frame")
	local UICorner = newinstance("UICorner")
	local Title = newinstance("TextLabel")
	local UIGradient = newinstance("UIGradient")
	local InputFrame = newinstance("Frame")
	local InputTitle = newinstance("TextLabel")
	local UIGradient_2 = newinstance("UIGradient")
	local BoxFrame = newinstance("Frame")
	local UICorner_2 = newinstance("UICorner")
	local UIStroke = newinstance("UIStroke")
	local TextBox = newinstance("TextBox")
	local RedeemFrame = newinstance("Frame")
	local UICorner_3 = newinstance("UICorner")
	local RedeemLabel = newinstance("TextLabel")
	local UIGradient_3 = newinstance("UIGradient")
	local UIGradient_4 = newinstance("UIGradient")
	local RedeemButton = newinstance("TextButton")
	local CreateFrame = newinstance("Frame")
	local UICorner_4 = newinstance("UICorner")
	local CreateLabel = newinstance("TextLabel")
	local UIGradient_5 = newinstance("UIGradient")
	local UIGradient_6 = newinstance("UIGradient")
	local CreateButton = newinstance("TextButton")
	local KeyTitle = newinstance("TextLabel")
	local UIGradient_7 = newinstance("UIGradient")
	local SubTitle = newinstance("TextLabel")
	local UIGradient_8 = newinstance("UIGradient")
	local Line = newinstance("Frame")
	local NoteTitle = newinstance("TextLabel")
	local UIGradient_9 = newinstance("UIGradient")
	local Notification = newinstance("Frame")
	local UICorner_5 = newinstance("UICorner")
	local NotifyTitle = newinstance("TextLabel")
	local UIGradient_10 = newinstance("UIGradient")
	local UIStroke_2 = newinstance("UIStroke")
	local BIND = newinstance('BindableEvent',NointLoader);
	
	NointLoader.Name = tostring(math.random());
	NointLoader.IgnoreGuiInset = true;
	NointLoader.ResetOnSpawn = false;
	NointLoader.ZIndexBehavior = Enum.ZIndexBehavior.Global;

	MainFrame.Name = tostring(math.random());
	MainFrame.Parent = NointLoader
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	MainFrame.BackgroundTransparency = 1.000
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 350, 0, 250)

	LicenseFrame.Name = "\1\2\3\4"
	LicenseFrame.Parent = MainFrame
	LicenseFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	LicenseFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	LicenseFrame.BackgroundTransparency = 0.025
	LicenseFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LicenseFrame.BorderSizePixel = 0
	LicenseFrame.ClipsDescendants = true
	LicenseFrame.Position = UDim2.new(0.5, 0, -0.5, 0)
	LicenseFrame.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = LicenseFrame

	Title.Name = "\1\1\1\1"
	Title.Parent = LicenseFrame
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0, 10)
	Title.Size = UDim2.new(0, 200, 0, 25)
	Title.ZIndex = 2
	Title.Font = Enum.Font.GothamBold
	Title.Text = "NOINT.LOL"
	Title.TextColor3 = Color3.fromRGB(255, 146, 148)
	Title.TextSize = 25.000

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient.Rotation = 90
	UIGradient.Parent = Title

	InputFrame.Name = "\1\1\1\1"
	InputFrame.Parent = LicenseFrame
	InputFrame.AnchorPoint = Vector2.new(0.5, 0)
	InputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	InputFrame.BackgroundTransparency = 1.000
	InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InputFrame.BorderSizePixel = 0
	InputFrame.Position = UDim2.new(0.5, 0, 0, 65)
	InputFrame.Size = UDim2.new(0, 320, 0, 165)
	InputFrame.ZIndex = 5

	InputTitle.Name = "\1\1\1\1\5"
	InputTitle.Parent = InputFrame
	InputTitle.AnchorPoint = Vector2.new(0.5, 0)
	InputTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	InputTitle.BackgroundTransparency = 1.000
	InputTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InputTitle.BorderSizePixel = 0
	InputTitle.Position = UDim2.new(0.5, 0, 0, 1)
	InputTitle.Size = UDim2.new(1, -5, 0, 15)
	InputTitle.ZIndex = 5
	InputTitle.Font = Enum.Font.GothamBold
	InputTitle.Text = "License Key"
	InputTitle.TextColor3 = Color3.fromRGB(255, 146, 148)
	InputTitle.TextSize = 13.000
	InputTitle.TextTransparency = 0.250
	InputTitle.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_2.Rotation = 90
	UIGradient_2.Parent = InputTitle

	BoxFrame.Name = "\1\1\1\1"
	BoxFrame.Parent = InputFrame
	BoxFrame.AnchorPoint = Vector2.new(0.5, 0)
	BoxFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	BoxFrame.BackgroundTransparency = 0.500
	BoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BoxFrame.BorderSizePixel = 0
	BoxFrame.Position = UDim2.new(0.5, 0, 0, 20)
	BoxFrame.Size = UDim2.new(1, -5, 0, 35)
	BoxFrame.ZIndex = 5

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = BoxFrame

	UIStroke.Transparency = 0.950
	UIStroke.Color = Color3.fromRGB(255, 146, 148)
	UIStroke.Parent = BoxFrame

	TextBox.Parent = BoxFrame
	TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1.000
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextBox.Size = UDim2.new(1, -10, 1, -10)
	TextBox.ZIndex = 8
	TextBox.ClearTextOnFocus = false
	TextBox.Font = Enum.Font.GothamMedium
	TextBox.PlaceholderColor3 = Color3.fromRGB(122, 94, 95)
	TextBox.PlaceholderText = "Enter your License Key"
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(143, 82, 84)
	TextBox.TextSize = 13.000
	TextBox.TextXAlignment = Enum.TextXAlignment.Left

	RedeemFrame.Name = "\3\5\2\2"
	RedeemFrame.Parent = InputFrame
	RedeemFrame.AnchorPoint = Vector2.new(0.5, 0)
	RedeemFrame.BackgroundColor3 = Color3.fromRGB(236, 130, 131)
	RedeemFrame.BackgroundTransparency = 0.500
	RedeemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RedeemFrame.BorderSizePixel = 0
	RedeemFrame.Position = UDim2.new(0.5, 0, 0, 60)
	RedeemFrame.Size = UDim2.new(1, -5, 0, 35)
	RedeemFrame.ZIndex = 8

	UICorner_3.CornerRadius = UDim.new(0, 3)
	UICorner_3.Parent = RedeemFrame

	RedeemLabel.Name = "\1\1\1\0\1"
	RedeemLabel.Parent = RedeemFrame
	RedeemLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	RedeemLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RedeemLabel.BackgroundTransparency = 1.000
	RedeemLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RedeemLabel.BorderSizePixel = 0
	RedeemLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	RedeemLabel.Size = UDim2.new(1, 0, 1, 0)
	RedeemLabel.ZIndex = 8
	RedeemLabel.Font = Enum.Font.GothamBold
	RedeemLabel.Text = "Log-in"
	RedeemLabel.TextColor3 = Color3.fromRGB(216, 162, 164)
	RedeemLabel.TextSize = 14.000

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_3.Rotation = 90
	UIGradient_3.Parent = RedeemLabel

	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_4.Rotation = 90
	UIGradient_4.Parent = RedeemFrame

	RedeemButton.Name = "\1\1\1\1"
	RedeemButton.Parent = RedeemFrame
	RedeemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RedeemButton.BackgroundTransparency = 1.000
	RedeemButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RedeemButton.BorderSizePixel = 0
	RedeemButton.Size = UDim2.new(1, 0, 1, 0)
	RedeemButton.ZIndex = 15
	RedeemButton.Font = Enum.Font.SourceSans
	RedeemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	RedeemButton.TextSize = 14.000
	RedeemButton.TextTransparency = 1.000

	CreateFrame.Name = "\1\1\1"
	CreateFrame.Parent = InputFrame
	CreateFrame.AnchorPoint = Vector2.new(0.5, 0)
	CreateFrame.BackgroundColor3 = Color3.fromRGB(236, 130, 131)
	CreateFrame.BackgroundTransparency = 0.500
	CreateFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CreateFrame.BorderSizePixel = 0
	CreateFrame.Position = UDim2.new(0.5, 0, 0, 120)
	CreateFrame.Size = UDim2.new(1, -5, 0, 35)
	CreateFrame.ZIndex = 8

	UICorner_4.CornerRadius = UDim.new(0, 3)
	UICorner_4.Parent = CreateFrame

	CreateLabel.Name = "\1\1\1"
	CreateLabel.Parent = CreateFrame
	CreateLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	CreateLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CreateLabel.BackgroundTransparency = 1.000
	CreateLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CreateLabel.BorderSizePixel = 0
	CreateLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	CreateLabel.Size = UDim2.new(1, 0, 1, 0)
	CreateLabel.ZIndex = 8
	CreateLabel.Font = Enum.Font.GothamBold
	CreateLabel.Text = "Get Key"
	CreateLabel.TextColor3 = Color3.fromRGB(216, 162, 164)
	CreateLabel.TextSize = 14.000

	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_5.Rotation = 90
	UIGradient_5.Parent = CreateLabel

	UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_6.Rotation = 90
	UIGradient_6.Parent = CreateFrame

	CreateButton.Name = "\1\1\1\1\1\1"
	CreateButton.Parent = CreateFrame
	CreateButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CreateButton.BackgroundTransparency = 1.000
	CreateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CreateButton.BorderSizePixel = 0
	CreateButton.Size = UDim2.new(1, 0, 1, 0)
	CreateButton.ZIndex = 15
	CreateButton.Font = Enum.Font.SourceSans
	CreateButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	CreateButton.TextSize = 14.000
	CreateButton.TextTransparency = 1.000

	KeyTitle.Name = "\1\1\1\1\1"
	KeyTitle.Parent = InputFrame
	KeyTitle.AnchorPoint = Vector2.new(0.5, 0)
	KeyTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyTitle.BackgroundTransparency = 1.000
	KeyTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeyTitle.BorderSizePixel = 0
	KeyTitle.Position = UDim2.new(0.5, 0, 0, 100)
	KeyTitle.Size = UDim2.new(1, -5, 0, 15)
	KeyTitle.ZIndex = 5
	KeyTitle.Font = Enum.Font.GothamBold
	KeyTitle.Text = "Don't have an license key? Get one"
	KeyTitle.TextColor3 = Color3.fromRGB(255, 146, 148)
	KeyTitle.TextSize = 13.000
	KeyTitle.TextTransparency = 0.500
	KeyTitle.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_7.Rotation = 90
	UIGradient_7.Parent = KeyTitle

	SubTitle.Name = "\1\1\1\1\1"
	SubTitle.Parent = LicenseFrame
	SubTitle.AnchorPoint = Vector2.new(0.5, 0)
	SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubTitle.BackgroundTransparency = 1.000
	SubTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SubTitle.BorderSizePixel = 0
	SubTitle.Position = UDim2.new(0.5, 0, 0, 35)
	SubTitle.Size = UDim2.new(0, 200, 0, 15)
	SubTitle.ZIndex = 2
	SubTitle.Font = Enum.Font.GothamBold
	SubTitle.Text = "Login to continue"
	SubTitle.TextColor3 = Color3.fromRGB(255, 146, 148)
	SubTitle.TextSize = 13.000
	SubTitle.TextTransparency = 0.650

	UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_8.Rotation = 90
	UIGradient_8.Parent = SubTitle

	Line.Name = "\1\1\2\37"
	Line.Parent = LicenseFrame
	Line.AnchorPoint = Vector2.new(0.5, 0)
	Line.BackgroundColor3 = Color3.fromRGB(255, 146, 148)
	Line.BackgroundTransparency = 0.500
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0.5, 0, 0, 55)
	Line.Size = UDim2.new(1, -25, 0, 1)
	Line.ZIndex = 2

	NoteTitle.Name = "\1\1\1\1\2"
	NoteTitle.Parent = LicenseFrame
	NoteTitle.AnchorPoint = Vector2.new(0.5, 1)
	NoteTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NoteTitle.BackgroundTransparency = 1.000
	NoteTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NoteTitle.BorderSizePixel = 0
	NoteTitle.Position = UDim2.new(0.5, 0, 1, -5)
	NoteTitle.Size = UDim2.new(1, -20, 0, 20)
	NoteTitle.ZIndex = 2
	NoteTitle.Font = Enum.Font.GothamBold
	NoteTitle.Text = "To avoid any game-bans please redeem key on discord, Anti-Cheat might detect you while you're entering key."
	NoteTitle.TextColor3 = Color3.fromRGB(255, 146, 148)
	NoteTitle.TextTransparency = 0.500
	NoteTitle.TextWrapped = true
	NoteTitle.TextXAlignment = Enum.TextXAlignment.Left
	NoteTitle.TextYAlignment = Enum.TextYAlignment.Top

	UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_9.Rotation = 90
	UIGradient_9.Parent = NoteTitle

	Notification.Name = "\1\1\1\2"
	Notification.Parent = MainFrame
	Notification.AnchorPoint = Vector2.new(0.5, 0.5)
	Notification.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0.5, 0, 1.5, 0)
	Notification.Size = UDim2.new(0, 250, 0, 35)
	Notification.ZIndex = 20

	UICorner_5.CornerRadius = UDim.new(0, 2)
	UICorner_5.Parent = Notification

	NotifyTitle.Name = "\1\1\1\1\5"
	NotifyTitle.Parent = Notification
	NotifyTitle.AnchorPoint = Vector2.new(0.5, 0.5)
	NotifyTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotifyTitle.BackgroundTransparency = 1.000
	NotifyTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotifyTitle.BorderSizePixel = 0
	NotifyTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
	NotifyTitle.Size = UDim2.new(0, 200, 0, 25)
	NotifyTitle.ZIndex = 26
	NotifyTitle.Font = Enum.Font.GothamBold
	NotifyTitle.Text = ""
	NotifyTitle.TextColor3 = Color3.fromRGB(255, 146, 148)
	NotifyTitle.TextSize = 14.000

	UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 144, 144))}
	UIGradient_10.Rotation = 90
	UIGradient_10.Parent = NotifyTitle

	UIStroke_2.Thickness = 2.000
	UIStroke_2.Transparency = 0.750
	UIStroke_2.Parent = Notification
	
    local l1 = tween_new(1.5,Enum.EasingStyle.Quint);
    local l2 = tween_new(1,Enum.EasingStyle.Quint);
    local l3 = tween_new(0.5,Enum.EasingStyle.Quint);
    local l4 = tween_new(0.25,Enum.EasingStyle.Quint);

	local LoadU = TweenService:Create(LicenseFrame,l1,{
		Position = UDim2.fromScale(0.5,0.5)
	});
	
	local CloseU = TweenService:Create(LicenseFrame,l2,{
		Position = UDim2.fromScale(0.5,1.5)
	});
	
	local ShowNotify = function(text)
		NotifyTitle.Text = text;
		
		TweenService:Create(Notification,l3,{
			Position = UDim2.fromScale(0.5,0.5)
		}):Play();
		
		task.delay(2.25,function()
			TweenService:Create(Notification,l3,{
				Position = UDim2.fromScale(0.5,1.5)
			}):Play();
		end)
	end;
	
	local HoverEffect = function(frame: Frame,label: TextLabel)
		frame.MouseLeave:Connect(function()
			TweenService:Create(frame,l4,{
				BackgroundTransparency = 0.5
			}):Play();
			
			TweenService:Create(label,l4,{
				TextColor3 = Color3.fromRGB(216, 162, 164)
			}):Play();
		end);
		
		frame.MouseEnter:Connect(function()
			TweenService:Create(frame,l4,{
				BackgroundTransparency = 0.2
			}):Play();
			
			TweenService:Create(label,l4,{
				TextColor3 = Color3.fromRGB(38, 17, 17)
			}):Play();
		end);
	end;
	
	LoadU:Play();
	
	HoverEffect(CreateFrame,CreateLabel);
	HoverEffect(RedeemFrame,RedeemLabel);
	
    log:add("Loaded Key UI");

	CreateButton.MouseButton1Click:Connect(function()
		ShowNotify("Copied to clipboard!");
		setclipboard("https://noint.lol/#plans");
	end);
	
	local RateLimit = false;
	
	RedeemButton.MouseButton1Click:Connect(function()
		if RateLimit then
			return false;
		end;
		
		RateLimit = true;
		
        log:add("Check key: "..tostring(TextBox.Text));

		local success,message = CheckKey(TextBox.Text);

        log:add("Check key message: "..tostring(message));

		ShowNotify(ErrorEnum[message] or "Unknow Error");
		
		if success then
			task.wait(2);
			
			BIND:Fire(TextBox.Text);
			
			return;
		end;
		
		RateLimit = false;
	end)
	
	BIND.Event:Wait();
	
	CloseU:Play();

    log:add("Closed Key UI");
	
	CloseU.Completed:Connect(function()
		NointLoader.Name = tostring(math.random());
		NointLoader:Destroy();
	end);

    task.wait(1);
end;

main_env.NointLog = log;

if GameDatabase then
	local exec_name = identifyexecutor();
	
	log:add("Checking Executor ["..exec_name..']');
	
	if not GameDatabase.ExternalSupport and IsExternal then
		log:add("Unsupported Executor");
		
		log:parse();
		
		if not NOINT_NO_BYPASS then
			LocalPlayer:Kick("Error: Code 001\nUnsupported Executor");
		end;
		
		return false;
	end;
	
	log:add("Executor supported");
	
	log:add("Script Name: "..tostring(GameDatabase.Name));
	log:add("Script Hash: "..tostring(GameDatabase.Hash));
	log:add("Universe Id: "..tostring(GameDatabase.UniverseId));
	
	if NOINT_INSTANT_LOAD or GameDatabase.InstantLoad then

		log:add("Instant Load is enabled");

		local LoaderAPI = string.format("https://api.luarmor.net/files/v3/loaders/%s.lua",GameDatabase.Hash);

		local Function = loadstring(game:HttpGet(LoaderAPI));
		
		return pcall(Function);
	end;

	LuarmorAPI.script_id = GameDatabase.Hash;
	
	local LoaderAPI = string.format("https://api.luarmor.net/files/v3/loaders/%s.lua",GameDatabase.Hash);
	local LicenseKey = script_key or main_env.script_key or (isfile(LicenseKeyFile) and readfile(LicenseKeyFile));
	
	log:add("Checking Key");
	
	local IsValidKey = CheckKey(LicenseKey);
	
	if not LicenseKey or not IsValidKey then
		log:add("Incorrect Key");
		
		LoadUI();
	else
		log:add("Correct key");
	end;
	
	log:add("Loading Script from Luarmor: "..tostring(LoaderAPI));
	
	local Function = loadstring(game:HttpGet(LoaderAPI));
	
    task.delay(10, function()
        log:parse();
    end);

	local Success , API = pcall(Function);
	
	if not Success then
		log:add("Failed to load error: "..tostring(API));
		
		if not NOINT_NO_BYPASS then
			LocalPlayer:Kick("Error: Code 002\nError while launching the script");
		end;
		
		return log:parse();
	else
		log:add("Script Loaded.");
		
		return log:parse();
	end;
else
	log:add("Unsupported Game");
	
	log:parse();
	
	if not NOINT_NO_BYPASS then
		return false , LocalPlayer:Kick("Error: Code 006\nNoint.lol has error!");
	end;
	
	return false;
end;
