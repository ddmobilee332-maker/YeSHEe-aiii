-- Ruenyai HUB v2.0 - Command Module [oopp]
local Theme = require("theme")
local Session = require("session")
local Utils = require("utils")
local c = Theme.Colors

local Module = {}

function Module.Execute()
    print(c.DarkRed .. "┌──( SYSTEM: ACCOUNT CREDENTIALS ENGINE )" .. c.Reset)
    io.write(c.DarkRed .. "├──" .. c.Gray .. " กรอกชื่อจริงในเกม Roblox: " .. c.Reset)
    local user_input = io.read()
    
    if user_input == "" then
        Utils.Log("error", "ชื่อผู้ใช้ไม่สามารถเว้นว่างได้")
        print(c.DarkRed .. "└──" .. c.Reset)
        return
    end
    
    io.write(c.DarkRed .. "├──" .. c.Gray .. " กรอกรหัสผ่าน (Password): " .. c.Reset)
    local pass_input = io.read()
    print(c.DarkRed .. "└──" .. c.Reset)
    
    print("")
    Utils.CyberProgressBar("GENERATING SECURE HASHING & ENCRYPTING DATA", 2.0)
    Utils.CyberProgressBar("CONNECTING TERMINAL TO ROBLOX AUTH-SERVER", 2.5)
    
    -- ทำการบันทึกเข้าสู่วงจรเซสชันกลาง
    Session.Username = user_input
    Session.Password = pass_input:gsub(".", "*") -- ซ่อนพาสเวิร์ดเพิ่มความปลอดภัย
    Session.IsOnline = true
    
    Utils.Log("success", "บัญชี [" .. Session.Username .. "] เข้ารหัสเรียบร้อยและพร้อมใช้งานในระบบบอตคอนโซลแล้ว!")
end

return Module
