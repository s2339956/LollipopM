

function wait(seconds)
    usleep(seconds * 10000000);
end

function touch(x, y, sec)
    touchDown(0, x, y);
    wait(sec);
    touchUp(0, x, y);
    wait(sec);
end

function checkAppState()
    if appState("com.nexon.maplem.global") == "ACTIVATED" then 
        return true;
    else 
        return false;
    end
end

-- 打開迷你地城
function opneMiniDungeon()
    touch(TopMenu.QuickUnit.x, TopMenu.QuickUnit.y, 0.03);
    wait(0.2);
    touch(QuickUnitMenu.MiniDungeon.x, QuickUnitMenu.MiniDungeon.y, 0.03);
    wait(0.2);
    log("打開迷你地城");
    -- 判斷是否繼續
    if getColor(MiniDungeon.ConfirmToContinue.x, MiniDungeon.ConfirmToContinue.y) == MiniDungeon.ConfirmToContinue.color then
        touch(MiniDungeon.ContinuanceBtn.x, MiniDungeon.ContinuanceBtn.y, 0.03);
        log("點擊繼續");
        wait(0.2);
    elseif getColor(MiniDungeon.ConfirmToNew.x, MiniDungeon.ConfirmToNew.y) == MiniDungeon.ConfirmToNew.color then
         -- 新的開始
        log("新的開始");
        if getColor(MiniDungeon.SelectThirtyMinutes.x, MiniDungeon.SelectThirtyMinutes.y) == MiniDungeon.SelectThirtyMinutes.color then
            touch(MiniDungeon.SelectThirtyMinutes.x, MiniDungeon.SelectThirtyMinutes.y, 0.04);
            wait(0.04);
            touch(MiniDungeon.StartButton.x, MiniDungeon.StartButton.y, 0.04);
            wait(0.04);
            touch(MiniDungeon.ConfirmStartButton.x, MiniDungeon.ConfirmStartButton.y, 0.04);
            log("點擊進入");
            wait(0.7);
        end
    else
        log("都沒找到");
    end
end

-- 搜索迷你帝城完成按鈕, 點擊
function searchCompletionButton() 
    if getColor(MiniDungeon.EndBtnA.x, MiniDungeon.EndBtnA.y) == MiniDungeon.EndBtnA.color and 
        getColor(MiniDungeon.EndBtnB.x, MiniDungeon.EndBtnB.y) == MiniDungeon.EndBtnB.color and 
        getColor(MiniDungeon.EndBtnC.x, MiniDungeon.EndBtnC.y) == MiniDungeon.EndBtnC.color and 
        getColor(MiniDungeon.EndBtnD.x, MiniDungeon.EndBtnD.y) == MiniDungeon.EndBtnD.color then
        touch(MiniDungeon.EndBtnC.x, MiniDungeon.EndBtnC.y, 0.04);
        log("迷你地城 - 點擊完成按鈕");
    else
        log("迷你地城 - 沒有找到完成按鈕");
    end
end

