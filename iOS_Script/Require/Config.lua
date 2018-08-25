
appActivate("com.nexon.maplem.global");

-- 以下可修改參數
Buff_Time = 120; -- 輔助技能時間
Buff_Button_XY = {
    X = 1836 ,
    Y = 890
} -- 輔助技能按鈕位子

Master_Skill_XY = {
    X = 2055 ,
    Y = 974
} -- 主要攻擊技能按鈕位子

Form_Feed_Button_XY = {
    X = 2268 ,
    Y = 767
} -- 技能換頁

Jump_Button_XY = {
    X = 2253  ,
    Y = 960
}

Path_Left_XY = {
    X = 192 ,
    Y = 902
} -- 左
Path_Right_XY = {
    X = 474 ,
    Y = 902
} -- 右
Path_Up_XY = {
    X = 333 ,
    Y = 761 
} -- 上
Path_Down_XY = {
    X = 321 ,
    Y = 1044
} -- 下
-- 以上可以修改

-- Classes

Pixel = {}
function Pixel.new(x, y, color)
    local o = {}
    o.x = x
    o.y = y
    o.color = color
    return o
end

Pixels = {}
function Pixels.new(table, region)
    local o = {}
    o.table = table
    o.region = region
    return o
end

-- 上方清單快捷鍵
TopMenu = {
    -- 快數單元
    QuickUnit = Pixel.new(1700, 60, rgbToInt(255, 255, 255))
}

-- TODO: 補上其他位子
QuickUnitMenu = {
    -- 每日地城
    DailyDungeon = Pixel.new(470, 570,  rgbToInt(032, 141, 167)),
    -- 菁英地城
    EliteDungeon = Pixel.new(800, 570,  rgbToInt(107, 010, 048)),
    -- 迷你地城
    MiniDungeon = Pixel.new(1150, 570,  rgbToInt( 31, 083, 006)),
    -- 武陵道場
    WulingDojo = Pixel.new(1840, 570,   rgbToInt(225, 035, 000)),
    -- 金字塔
    Pyramid = Pixel.new(2122, 570,      rgbToInt(246, 197, 023))
}

-- 迷你地成
MiniDungeon = {
    -- 迷你地成時間結束, 完成按鈕四個點
    EndBtnA = Pixel.new(1185, 991,  16754570), 
    EndBtnB = Pixel.new(1185, 1019, 16743248),
    EndBtnC = Pixel.new(1250, 991,  16752768),
    EndBtnD = Pixel.new(1250, 1019, 16744278),

    -- 剩餘時間, 繼續
    ConfirmToContinue = Pixel.new(927, 615, rgbToInt(255, 141, 108)), --確認是否繼續 
    ContinuanceBtn = Pixel.new(1515, 797, 16744019), --繼續按鈕
    -- 新的開始
    ConfirmToNew = Pixel.new(291, 64, rgbToInt(198, 203, 208)), --確認新開始
    SelectThirtyMinutes = Pixel.new(1557, 600, rgbToInt(210, 213, 216)), --選擇三十分鐘
    SelectOneHours = Pixel.new(1772, 600, rgbToInt(110, 110, 128)), --選擇一小時
    SelectTwoHours = Pixel.new(1978, 600, rgbToInt(167, 173, 178)), --選擇兩小時
    StartButton = Pixel.new(1940, 995, rgbToInt(255, 123, 80)), --開始
    ConfirmStartButton = Pixel.new(1440, 968, rgbToInt(255, 250, 247)) --開始
}

