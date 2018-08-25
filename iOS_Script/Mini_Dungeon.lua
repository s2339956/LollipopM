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

require "Require.Config"
require "Require.Tools"

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
    touchDown(6, Path_Down_XY.X, Path_Down_XY.Y);
    wait(0.009);
    touchUp(6, Path_Down_XY.X, Path_Down_XY.Y);
    wait(0.009);

    touchDown(6, Path_Down_XY.X, Path_Down_XY.Y);
    wait(0.009);
    touchUp(6, Path_Down_XY.X, Path_Down_XY.Y);
    wait(0.009);
end

-- 主要流程
function process()
    wait(0.02);
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.07); --往右
    wait(0.02);
    attack(6);
    wait(0.02);
    log("完成清除C層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.07); --往左
    wait(0.02);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    attack(5);
    wait(0.02);
    log("完成清除A層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.06); --往右
    wait(0.01);
    jumpDown();
    wait(0.09);
    attack(4);
    wait(0.02);
    log("完成清除B層");
    
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.12); --往右
    wait(0.01);
    log("B層前往A-最右邊");

    
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.08); --往左
    wait(0.02);
    attack(6);
    wait(0.02);
    log("2完成清除C層");
  
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.08); --往右
    wait(0.03);
    touch(Path_Up_XY.X, Path_Up_XY.Y, 0.03); --往上
    wait(0.02);
    attack(5);
    wait(0.02);
    log("2完成清除A層");

    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.06); --往左
    wait(0.01);
    jumpDown()
    wait(0.09);
    attack(4)
    wait(0.02);
    log("2完成清除B層");
  
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.12); --往左
  
    
end 

--移動至C層
function moveToDestination()
    log("開始移動");
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.08); --往右
    wait(0.04);
    touch(Path_Left_XY.X, Path_Left_XY.Y, 0.15); --往左
    log("移動完成");
end

local isFirstLoad = true;
while (true) do
    if appState("com.nexon.maplem.global") == "ACTIVATED" then 
        if isFirstLoad == true then
            -- 開始
            opneMiniDungeon();
            moveToDestination();
            buffButton_B();
            isFirstLoad = false;
        end
    searchCompletionButton();    
    discharge();
    process();

    else
        alert("不在遊戲中, 已停止腳本");
        keyDown(KEY_TYPE.VOLUME_DOWN_BUTTON);
        wait(0.06);
        keyUp(KEY_TYPE.VOLUME_DOWN_BUTTON);
    end 
end






































