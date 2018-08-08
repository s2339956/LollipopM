-- for iphone X, black Knight

--[[

 -----------A
  ---------B
-------------C

]]--
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
        touch(131.85, 2096.11, 0.03);
    end

end
  
-- 向下跳
function jumpDown()
    log("向下跳");
    touchDown(1, 83.84, 346.28);
    wait(0.03);
    touchDown(2, 157.91, 2243.24);
    touchMove(1, 85.84, 346.28);
    wait(0.03);
    touchMove(2, 157.91, 2243.24);
    wait(0.02); 
    touchUp(2, 157.91, 2243.24);
    wait(0.02);
    touchUp(1, 83.84, 346.28);
end

-- 主要流程
function process()
    wait(0.03);
    touch(208.67, 469.43, 0.07); --往右
    wait(0.03);
    attack(6)
    wait(0.03);
    log("完成清除C層");
  
    touch(230.75, 223.17, 0.07); --往左
    wait(0.03);
    touch(373.83, 345.31, 0.03); --往上
    attack(5)
    wait(0.03);
    log("完成清除A層");
  
    touch(208.67, 469.43, 0.08); --往右
    wait(0.03);
    jumpDown()
    attack(4)
    wait(0.03);
    log("完成清除B層");
    
    touch(208.67, 469.43, 0.15); --往右
    wait(0.01);
    log("B層前往A-最右邊");
    
    touch(230.75, 223.17, 0.08); --往左
    wait(0.02);
    attack(6)
    wait(0.03);
    log("2完成清除C層");
  
    touch(208.67, 469.43, 0.08); --往右
    wait(0.03);
    touch(373.83, 345.31, 0.03); --往上
    wait(0.03);
    attack(5)
    wait(0.03);
    log("2完成清除A層");

    touch(230.75, 223.17, 0.08); --往左
    wait(0.03);
    jumpDown()
    attack(5)
    wait(0.03);
    log("2完成清除B層");
  
    touch(230.75, 223.17, 0.15); --往左
    
end 

--移動至C層
function moveToDestination()
    log("開始移動")
    touch(208.67, 469.43, 0.08); --往右
    wait(0.04);
    touch(230.75, 223.17, 0.15); --往左
    log("移動完成")
end

adaptResolution(1125, 2436);
adaptOrientation(ORIENTATION_TYPE.PORTRAIT)

moveToDestination()

while (true) do
    process()
end



































