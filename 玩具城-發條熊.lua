-- 可修改參數
Buff_Time = 120 -- 輔助技能時間
Buff_Button_XY = {
    X = 245 ,
    Y = 1836
} -- 輔助技能按鈕位子

Master_Skill_XY = {
    X = 31.85,
    Y = 2096.11
} -- 主要攻擊技能按鈕位子

adaptResolution(1125, 2436); -- 螢幕大小
adaptOrientation(ORIENTATION_TYPE.PORTRAIT);
-- 

-- 以下新手請勿修改
startTime = os.time();
endTime = startTime+Buff_Time;

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
		isOP();
		touch(Master_Skill_XY.X, Master_Skill_XY.Y, 0.03);
    end

end

function attackOP()
	touchDown(5, 357, 1947);
	touchDown(6, 208.67, 469.43);
	wait(0.45);
	touchDown(5, 357, 1947);
	touchMove(6, 230.75, 223.17);
	wait(0.4)
	touchUp(6, 230.75, 223.17);
	wait(0.05);
	touchUp(5, 357, 1947);
    wait(0.05);
	
end

-- BUFF 施放
function buffButton_B()
	log("buffButton_B");
	touch(353, 2273, 0.015);
   	touch(Buff_Button_XY.X, Buff_Button_XY.Y, 0.015);
	touch(353, 2273, 0.015);
end

function process()
    wait(0.02);
    touch(208.67, 469.43, 0.02); --往右
    wait(0.02);
    attack(12)
    wait(0.02);
    log("");
	touch(230.75, 223.17, 0.02); --往左
	wait(0.02);
    attack(12)
    wait(0.02);
    log("");

end

buffButton_B();
--
while (true) do
    discharge();
    process();
end




















