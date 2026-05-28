-- Ruenyai HUB v2.0 - Main Terminal Core Executor
local Theme = require("theme")
local Session = require("session")
local Utils = require("utils")
local CoreOOPP = require("core_oopp")
local CoreOOPP2 = require("core_oopp2")
local c = Theme.Colors

-- ฟังก์ชันทำงานของ oopp3 (รวมไว้ไฟล์หลักเพื่อความกระชับในการรันคำสั่งอิสระ)
local function Action_OOPP3()
    print(c.DarkRed .. "┌──( SYSTEM: AUTOMATION TASK INJECTOR )" .. c.Reset)
    
    if not Session.IsOnline or not Session.MapID then
        Utils.Log("error", "สิทธิ์ถูกปฏิเสธ! คุณยังไม่ออนรหัส (oopp) หรือไม่ได้ส่งเข้าแมพ (oopp2)")
        print(c.DarkRed .. "└──" .. c.Reset)
        return
    end
    
    print(c.DarkRed .. "├──" .. c.Gray .. " บัญชีที่กำลังควบคุม: " .. c.Reset .. Session.Username)
    print(c.DarkRed .. "├──" .. c.Gray .. " แมพที่สแตนด์บายอยู่: " .. c.Reset .. Session.CurrentMap)
    io.write(c.DarkRed .. "├──" .. c.Gray .. " คุณต้องการให้รหัสนี้ทำอะไรในเเมพ (กรอกได้ทุกสิ่งตามใจชอบ): " .. c.Reset)
    local task_input = io.read()
    print(c.DarkRed .. "└──" .. c.Reset)
    
    print("")
    Utils.CyberProgressBar("COMPILING SCRIPTS & EXECUTING CORE LOOPS", 2.5)
    
    print(c.DarkRed .. " ⚡⚡⚡ RUENYAI CORE LOOP ACTIVE ⚡⚡⚡")
    print(c.Red .. " [!] TARGET ACCOUNT : " .. c.Reset .. Session.Username)
    print(c.Red .. " [!] EXECUTING TASK : " .. c.Green .. task_input)
    print(c.Red .. " [!] STATUS         : " .. c.Green .. "RUNNING AUTOMATION (LOOPING IN BACKGROUND)..." .. c.Reset)
    print(c.DarkRed .. " =========================================================" .. c.Reset)
end

-- คอนโซลทำงานหลัก (Main Application Loop)
local function Main()
    local is_running = true
    Theme.PrintHeader()
    
    while is_running do
        -- Terminal Prompt สไตล์รุ่นใหญ่สุดโหด
        io.write("\n" .. c.DarkRed .. "รุ่นใหญ่_HUB" .. c.Gray .. "@" .. c.Red .. "Root_Console" .. c.Reset .. " ~# ")
        local cmd = io.read()
        
        if cmd == "oopp" then
            CoreOOPP.Execute()
        elseif cmd == "oopp2" then
            CoreOOPP2.Execute()
        elseif cmd == "oopp3" then
            Action_OOPP3()
        elseif cmd == "exit" then
            print(c.Gray .. "\n[-] กำลังปิดระบบตัดการเชื่อมต่อจากรุ่นใหญ่ HUB... ลาบอร์ดค่ะพี่!" .. c.Reset)
            is_running = false
        else
            Utils.Log("error", "ไม่พบคำสั่งนี้! กรุณาพิมพ์: oopp, oopp2, oopp3 หรือ exit")
        end
    end
end

-- เริ่มการทำงานคอนโซล
Main()
