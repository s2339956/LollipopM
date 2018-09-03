--[[
作者: TinXie
聯繫: s2339956@gmail.com
使用地圖：Mini_Dungeon(迷你地城)
]]--

-- for iphone X, black Knight

--[[

 -----------A
  ---------B
-------------C

]]--


-- 以下可修改參數 
Buff_Time = 120 -- 輔助技能時間, 單位: 秒
Buff_Button_XY = {
    X = 711 ,
    Y = 424
} -- 輔助技能按鈕位子

Master_Skill_XY = {
    X = 815 ,
    Y = 466
} -- 主要攻擊技能按鈕位子

Form_Feed_Button_XY = {
    X = 922 ,
    Y = 367
} -- 技能換頁

Path_Left_XY = {
    X = 59 ,
    Y = 432
} -- 左
Path_Right_XY = {
    X = 177 ,
    Y = 432
} -- 右
Path_Up_XY = {
    X = 120 ,
    Y = 368
} -- 上
Path_Down_XY = {
    X = 118 ,
    Y = 493
} -- 下

-- 以上可以修改
DEFAULT_WIDTH = 960;
Settings:setCompareDimension(true, DEFAULT_WIDTH);
Settings:setScriptDimension(true, DEFAULT_WIDTH);
--

-- 以下新手請勿修改 
startTime = os.time() 
endTime = startTime + Buff_Time;

function discharge()
    if os.time() >= endTime then
        buffButton_B();
        startTime = os.time();
        endTime = startTime + 120;
    else
    
    end

end

function touch(x, y, sec)
    touchDown(Location(x,y), sec);
    wait(0.5);
    touchUp(Location(x,y), sec);
    wait(0.5);
end

-- 攻擊
function attack(index)
    log("開始攻擊");
    for i=1, index do 
        touch(Master_Skill_XY.X, Master_Skill_XY.Y, 0.7);
    end

end

-- BUFF 施放
function buffButton_B()
    --log("buffButton_B");
    touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.2);
    touch(Buff_Button_XY.X, Buff_Button_XY.Y, 0.2);
    touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.2);
end
  
-- 向下跳
function jumpDown()
    touch(Path_Down_XY.X, Path_Down_XY.Y, 0.3);
    wait(0.3);
    touch(Path_Down_XY.X, Path_Down_XY.Y, 0.3);
    wait(0.3);
end

-- 主要流程
function process()
    wait(0.2);
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.7); --往右
    wait(0.2);
    attack(6)
    wait(0.2);
    -- log("完成清除C層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.7); --往左
    wait(0.2);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    attack(5)
    wait(0.2);
    -- log("完成清除A層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.6); --往右
    wait(0.01);
    jumpDown()
    attack(4)
    wait(0.2);
    -- log("完成清除B層");
    
    touch(Path_Right_XY.X, Path_Right_XY.Y, 1.2); --往右
    wait(0.1);
    -- log("B層前往A-最右邊");

    
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.8); --往左
    wait(0.2);
    attack(6)
    wait(0.2);
    -- log("2完成清除C層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.8); --往右
    wait(0.3);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    wait(0.2);
    attack(5)
    wait(0.2);
    -- log("2完成清除A層");

    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.6); --往左
    wait(0.1);
    jumpDown()
    attack(5)
    wait(0.2);
    -- log("2完成清除B層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 1.2); --往左
  
    
end 

--移動至C層
function moveToDestination()
    -- log("開始移動")
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.8); --往右
    wait(0.4);
    touch(Path_Left_XY.X, Path_Left_XY.Y, 1.5); --往左
    -- log("移動完成")
end

moveToDestination()
buffButton_B()

while (true) do
    discharge()
    process()
end



































