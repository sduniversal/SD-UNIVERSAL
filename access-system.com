--[[
    SD UNIVERSAL KEY SYSTEM
    PROTECTED BY CRYPTO-VM
--]]

local _v={game,string,table,task,Color3,UDim,UDim2,Enum,Instance}
local _g=function(i) return _v[1]:GetService(i) end
local _s=function(c) local s="" for _,b in ipairs(c) do s=s.._v[2].char(b) end return s end
local _x=function(t,k) local d={} for i=1,#t do local b=t[i] local m=(i%#k)+1 d[i]=_v[2].char(b~=k[m]) end return _v[3].concat(d) end

local _k={164,88,212,43,111}
local _d={
    _t1 = {197,61,161,72,13,203,63,181,73,15}, -- TweenService
    _t2 = {227,61,162,90,44,220,39}, -- CoreGui
    _t3 = {231,22,185,94,22,231,19,166,90,2,226,31,185}, -- SDUniversalUI
    _t4 = {221,42,165,85,5,193,52,166,85,5,221,43,185}, -- SD UNIVERSAL
    _t5 = {238,33,185,85,41,250,36,171,66,22,193,42,161,64,43}, -- JOIN GROUP TO CONTINUE
    _t6 = {238,33,185,85,41,250,36,171,66,22,193,42,161,64,43,212,112,135,114,35,249,57,163,89,30}, -- JOIN GROUP (GET ACCESS)
    _t7 = {232,38,188,91,44,204,50,186,83,11,202,39,178,90,5,213,115,161,84,3,213,43,178,85,5,197,63,161,84,3,213,38,170,81,30,227,33,188,71,21,217,43}, -- https://sduniversal-getaccess-com.netlify.app/
    _t8 = {232,51,182,80,52,221,53,160,82,30,221,53,160,78,30,206,53,212,89,14,213,54,166,89,30,217,35,178,90,5,213,41,165,87,3,211,43,165,89,23}, -- Link copied to clipboard successfully!
    _t9 = {234,59,185,87,30,223,54,212,80,43,211,43,178,90,30,217,35,178,90,5,193,112,133,114,35,249,57,163,89,30,232,53,177,92,5,213,33,188,85,30,226,53,177,92,5,213,54,161,89,3,210,43}, -- Failed to copy. Executor doesn't support clipboard.
    _t10 = {247,22,185,94,22,231,19,166,90,2,226,31,185,193,31,182,82,5,223,54,161,90,30,230,59,178,82,30} -- SD Universal Initialized!
}

local TS = _g(_x(_d._t1, _k))
local CG = _g(_x(_d._t2, _k))

local Colors = {
    Mdllo = _v[5].fromRGB(0, 255, 255),
    Dun = _v[5].fromRGB(12, 12, 12),
    Meglrm = _v[5].fromRGB(25, 25, 25)
}

local T_Info = TweenInfo.new(0.15, _v[8].EasingStyle.Quad, _v[8].EasingDirection.Out)

local SG = _v[9].new("ScreenGui")
SG.Name = _x(_d._t3, _k)
SG.Parent = CG
SG.DisplayOrder = 999
SG.IgnoreGuiInset = true
SG.ZIndexBehavior = _v[8].ZIndexBehavior.Sibling

local function notify(t)
    local n = _v[9].new("TextLabel", SG)
    n.Size = _v[7].new(0, 250, 0, 40)
    n.Position = _v[7].new(0.5, -125, 0.08, 0)
    n.BackgroundColor3 = Colors.Meglrm
    n.Text = t
    n.TextColor3 = Colors.Mdllo
    n.Font = _v[8].Font.GothamBold
    n.TextSize = 14
    n.BackgroundTransparency = 0.1
    n.TextTransparency = 1

    local c = _v[9].new("UICorner", n)
    c.CornerRadius = _v[6].new(0.2, 0)
    
    local s = _v[9].new("UIStroke", n)
    s.Color = Colors.Mdllo

    TS:Create(n, T_Info, {TextTransparency = 0}):Play()

    _v[4].delay(2, function()
        TS:Create(n, T_Info, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        _v[4].wait(0.2)
        n:Destroy()
    end)
end

local function setupHover(b, nC, hC)
    b.AutoButtonColor = false
    b.BackgroundColor3 = nC
    local oS = b.Size

    b.MouseEnter:Connect(function()
        TS:Create(b, T_Info, {BackgroundColor3 = hC, Size = oS + _v[7].new(0, 4, 0, 2)}):Play()
    end)

    b.MouseLeave:Connect(function()
        TS:Create(b, T_Info, {BackgroundColor3 = nC, Size = oS}):Play()
    end)
end

local KF = _v[9].new("Frame", SG)
KF.BackgroundColor3 = Colors.Dun
KF.Position = _v[7].new(0.5, -150, 0.5, -135)
KF.Size = _v[7].new(0, 300, 0, 270)
KF.Active = true
KF.Draggable = true

local MC = _v[9].new("UICorner", KF)
MC.CornerRadius = _v[6].new(0.07, 0)

local KS = _v[9].new("UIStroke", KF)
KS.Color = Colors.Mdllo
KS.Thickness = 2.5

local Title = _v[9].new("TextLabel", KF)
Title.Text = _x(_d._t4, _k)
Title.Size = _v[7].new(1, 0, 0, 60)
Title.Position = _v[7].new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.TextColor3 = Colors.Mdllo
Title.Font = _v[8].Font.GothamBlack
Title.TextSize = 26

local WT = _v[9].new("TextLabel", KF)
WT.Size = _v[7].new(1, -20, 0, 40)
WT.Position = _v[7].new(0, 10, 0.35, 0)
WT.BackgroundTransparency = 1
WT.Text = _x(_d._t5, _k)
WT.TextColor3 = _v[5].fromRGB(240, 40, 40)
WT.Font = _v[8].Font.GothamBold
WT.TextSize = 13

local KB = _v[9].new("TextButton", KF)
KB.Text = _x(_d._t6, _k)
KB.Position = _v[7].new(0.08, 0, 0.62, 0)
KB.Size = _v[7].new(0.84, 0, 0, 50)
KB.BackgroundColor3 = Colors.Mdllo
KB.TextColor3 = Colors.Dun
KB.Font = _v[8].Font.GothamBold
KB.TextSize = 13

local BC = _v[9].new("UICorner", KB)
BC.CornerRadius = _v[6].new(0.2, 0)

setupHover(KB, Colors.Mdllo, _v[5].fromRGB(180, 255, 255))

KB.MouseButton1Click:Connect(function()
    local link = _x(_d._t7, _k)
    if setclipboard then
        setclipboard(link)
        notify(_x(_d._t8, _k))
    elseif toclipboard then
        toclipboard(link)
        notify(_x(_d._t8, _k))
    else
        notify(_x(_d._t9, _k))
    end
end)

notify(_x(_d._t10, _k))
