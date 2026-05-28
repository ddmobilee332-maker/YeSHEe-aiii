-- Ruenyai HUB v2.0 - Command Module [oopp2]
local Theme = require("theme")
local Session = require("session")
local Utils = require("utils")
local c = Theme.Colors

local Module = {}

function Module.Execute()
    print(c.DarkRed .. "┌──( SYSTEM: MAP SCANNER & INJECTOR V2 )" .. c.Reset)
    io.write(c.DarkRed .. "├──" .. c.Gray .. " วางลิงก์แมพ Roblox ที่ต้องการแฮกเกอร์ส่งรหัส: " .. c.Reset)
    local map_link = io.read()
    print(c.DarkRed .. "└──" .. c.Reset)
    
    -- Regex แฮกสแกนตัดหาเลข Place ID สุดล้ำ
    local extracted_id = map_link:match("games/(%d+)") or map_link:match("(%d+)")
    if not extracted_id then
        Utils.Log("error", "รูปแบบลิงก์ไม่ถูกต้อง! ไม่สามารถเจาะหา ID แมพได้")
        return
    end
    
    print("\n" .. c.DarkRed .. " ╔═════════════════ MAP DATABASE ANALYSIS ═════════════════╗")
    print(c.Red .. "   • TARGET PLACE ID  : " .. c.Reset .. extracted_id)
    print(c.Red .. "   • MAP NAME DETECTED: " .. c.Reset .. "Blox Fruits / Grand Piece (Simulated)")
    print(c.Red .. "   • SERVER SECURITY  : " .. c.Yellow .. "BYPASSED BY RUENYAI" .. c.Reset)
    print(c.DarkRed .. " ╚═════════════════════════════════════════════════════════╝\n")
    
    if not Session.IsOnline then
        Utils.Log("error", "คุณต้องเปิดใช้งานคำสั่ง oopp เพื่อออนรหัสก่อนส่งเข้าแมพ")
        return
    end
    
    io.write(c.Yellow .. "[?] ยืนยันคำสั่ง: ต้องการให้รหัส [" .. Session.Username .. "] เทเลพอร์ตเข้าแมพนี้หรือไม่? (y/n): " .. c.Reset)
    local confirm = io.read():lower()
    
    if confirm == "y" then
        Session.MapID = extracted_id
        Session.CurrentMap = "Blox Fruits (ID: " .. extracted_id .. ")"
        print("")
        Utils.CyberProgressBar("INJECTING TELEPORT PACKETS INTO GAME CLIENT", 3.0)
        Utils.Log("success", "นำรหัส [" .. Session.Username .. "] บินเข้าเซิร์ฟเวอร์แมพเป้าหมายสำเร็จ!")
    else
        Utils.Log("info", "ยกเลิกกระบวนการเข้าแมพ")
    end
end

return Module
