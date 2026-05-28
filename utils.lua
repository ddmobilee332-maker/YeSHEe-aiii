-- Ruenyai HUB v2.0 - Utility Framework
local Theme = require("theme")
local c = Theme.Colors

local Utils = {}

-- ฟังก์ชันหลอดโหลด CyberProgressBar โหดๆ
function Utils.CyberProgressBar(text, seconds)
    local width = 25
    io.write(c.Red .. "[ SYSTEM ] " .. text .. "\n" .. c.Gray .. "[")
    for i = 1, width do
        -- สำหรับ Mobile/Termux/PC หน่วงเวลาอนิเมชั่น
        os.execute("sleep " .. tostring(seconds / width)) 
        io.write(c.Red .. "█")
        io.flush()
    end
    print(c.Gray .. "] " .. c.Green .. " SUCCESS" .. c.Reset .. "\n")
end

-- ระบบเขียน Log สไตล์ Hacker
function Utils.Log(statusType, message)
    if statusType == "error" then
        print(c.Red .. "[!] ERROR: " .. message .. c.Reset)
    elseif statusType == "info" then
        print(c.Gray .. "[*] INFO: " .. message .. c.Reset)
    elseif statusType == "success" then
        print(c.Green .. "[+] SUCCESS: " .. message .. c.Reset)
    end
end

return Utils
