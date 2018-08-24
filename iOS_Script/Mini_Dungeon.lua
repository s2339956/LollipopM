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
Buff_Time = 120; -- 輔助技能時間
Buff_Button_XY = {
    X = 245 ,
    Y = 1836
} -- 輔助技能按鈕位子

Master_Skill_XY = {
    X = 131.85 ,
    Y = 2096.11
} -- 主要攻擊技能按鈕位子

Form_Feed_Button_XY = {
    X = 353 ,
    Y = 2273
} -- 技能換頁

Jump_Button_XY = {
    X = 157 ,
    Y = 2243
}

Path_Left_XY = {
    X = 230 ,
    Y = 223
} -- 左
Path_Right_XY = {
    X = 208 ,
    Y = 469
} -- 右
Path_Up_XY = {
    X = 373 ,
    Y = 345
} -- 上
Path_Down_XY = {
    X = 83 ,
    Y = 346
} -- 下
-- 以上可以修改

adaptResolution(1125, 2436); -- 螢幕大小
adaptOrientation(ORIENTATION_TYPE.PORTRAIT);
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

function wait(seconds)
    usleep(seconds * 10000000);
end

function touch(x, y, sec)
    touchDown(0, x, y);
    wait(sec);
    touchUp(0, x, y);
    wait(sec);
end

-- 攻擊
function attack(index)
    log("開始攻擊");
    for i=1, index do 
        touch(Master_Skill_XY.X, Master_Skill_XY.Y, 0.03);
    end

end

-- 輔助技能
function buffButton_B()
    log("buffButton_B");
    touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.015);
    touch(Buff_Button_XY.X, Buff_Button_XY.Y, 0.015);
    touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.015);
end
  
-- 向下跳
function jumpDown()
    log("向下跳");
    touchDown(1, Jump_Button_XY.X, Jump_Button_XY.Y);
    wait(0.03);
    touchDown(1, Jump_Button_XY.X, Jump_Button_XY.Y);
end

-- 主要流程
function process()
    wait(0.02);
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.07); --往右
    wait(0.02);
    attack(6)
    wait(0.02);
    log("完成清除C層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.07); --往左
    wait(0.02);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    attack(5)
    wait(0.02);
    log("完成清除A層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.06); --往右
    wait(0.01);
    jumpDown()
    attack(4)
    wait(0.02);
    log("完成清除B層");
    
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.12); --往右
    wait(0.01);
    log("B層前往A-最右邊");

    
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.08); --往左
    wait(0.02);
    attack(6)
    wait(0.02);
    log("2完成清除C層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.08); --往右
    wait(0.03);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    wait(0.02);
    attack(5)
    wait(0.02);
    log("2完成清除A層");

    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.06); --往左
    wait(0.01);
    jumpDown()
    attack(5)
    wait(0.02);
    log("2完成清除B層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.12); --往左
  
    
end 

--移動至C層
function moveToDestination()
    log("開始移動")
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.08); --往右
    wait(0.04);
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.15); --往左
    log("移動完成")
end

function checkAppState()
    if appState("com.nexon.maplem.global") == "ACTIVATED" then 
        return true
    else 
        return false
    end
end

local isFirstLoad = true
while (true) do
    if appState("com.nexon.maplem.global") == "ACTIVATED" then 
        if isFirstLoad == true then
            moveToDestination()
            buffButton_B()
            isFirstLoad = false
        end
    discharge()
    process()
    else
        alert("不在遊戲中, 已停止腳本");
        keyDown(KEY_TYPE.VOLUME_DOWN_BUTTON);
        wait(0.06);
        keyUp(KEY_TYPE.VOLUME_DOWN_BUTTON);
    end 
end



































