

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
        return true
    else 
        return false
    end
end