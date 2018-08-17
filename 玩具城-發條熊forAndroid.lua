--[[
作者: TinXie
聯繫: s2339956@gmail.com
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
-- 以上可以修改

Settings:setCompareDimension(true, 960);
Settings:setScriptDimension(true, 960);
-- 

-- 以下新手請勿修改
startTime = os.time();
endTime = startTime + Buff_Time;

-- 左右旋轉工具
opTime = os.time();
starOp = opTime + 300;

function discharge()
    if os.time() >= endTime then
		buffButton_B();
		startTime = os.time();
		endTime = startTime + 120;
	end
end

function isOP()
	if os.time() >= starOp then
		attackOP();
		opTime = os.time();
		starOp = opTime + 300;
	end
end

function touch(x, y, sec)

    touchDown(Location(x,y), sec);
    wait(0.2);
 	touchUp(Location(x,y), sec);
   	wait(0.2);
end

-- 攻擊
function attack(index)
    -- log("開始攻擊");
    for i=1, index do 
		isOP();
		touch(Master_Skill_XY.X, Master_Skill_XY.Y, 0.6);
    end

end

function attackOP()
	-- touchDown(5, 357, 1947);
	-- touchDown(6, 208.67, 469.43);
	-- wait(4.5);
	-- touchDown(5, 357, 1947);
	-- touchMove(6, 230.75, 223.17);
	-- wait(0)
	-- touchUp(6, 230.75, 223.17);
	-- wait(0.05);
	-- touchUp(5, 357, 1947);
 --    wait(0.05);
	
end

-- BUFF 施放
function buffButton_B()
	--log("buffButton_B");
	touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.2);
   	touch(Buff_Button_XY.X, Buff_Button_XY.Y, 0.2);
	touch(Form_Feed_Button_XY.X, Form_Feed_Button_XY.Y, 0.2);
end

function process()
    wait(0.3);
    touch(Path_Right_XY.X, Path_Right_XY.Y, 0.4); --往右
    wait(0.3);
    attack(12);
    wait(0.3);
    --log("");
	touch(Path_Left_XY.X, Path_Left_XY.Y, 0.4); --往左
	wait(0.3);
    attack(12);
    wait(0.3);
    --log("");

end

buffButton_B();
--
while (true) do
    discharge();
    process();
end













