------------------------------------------------
-- This Source Was Developed By (Ali) @AAAPA.--
--    This Is The  ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน  @iinzzz .    --
--                 - LaUrEn -                  --
--         -- https://t.me/iinzzz --          --
------------------------------------------------ 
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
DevAli = redis.connect('127.0.0.1', 6379) 
User = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
ServerLaUrEn = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
Ip = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source LaUrEn     --
local AutoSet = function() 
if not DevAli:get(ServerLaUrEn.."IdLaUrEn") then 
io.write('\27[1;35m\nุงูุงู ุงุฑุณู ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู -โบ  โค\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู\n27[0;39;49m') 
DevAli:set(ServerLaUrEn.."IdLaUrEn",DevId) 
else 
print('\27[1;31mโโโโโโ ๐ฃ โโโโโโ\nูู ูุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู ุงุฑุณูู ูุฑู ุงุฎุฑู\nโโโโโโ ๐ฃ โโโโโโ') 
end 
os.execute('lua LaUrEn.lua') 
end 
if not DevAli:get(ServerLaUrEn.."TokenLaUrEn") then 
io.write('\27[1;35m\nุงูุงู ูู ุจุงุฑุณุงู ุชููู ุงูุจูุช -โบ  โค\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31mโโโโโโ ๐ฃ โโโโโโ\nุงูุชููู ุบูุฑ ุตุญูุญ ุชุงูุฏ ููู ุซู ุงุฑุณูู\nโโโโโโ ๐ฃ โโโโโโ') 
else 
io.write('\27[1;36mุชู ุญูุธ ุชููู ุงูุจูุช ุจูุฌุงุญ\n27[0;39;49m') 
DevAli:set(ServerLaUrEn.."TokenLaUrEn",TokenBot) 
end  
else 
print('\27[1;31mโโโโโโ ๐ฃ โโโโโโ\nูู ูุชู ุญูุธ ุชููู ุงูุจูุช ุงุฑุณูู ูุฑู ุงุฎุฑู\nโโโโโโ ๐ฃ โโโโโโ') 
end  
os.execute('lua LaUrEn.lua') 
end 
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAli:get(ServerLaUrEn.."IdLaUrEn"),
TokenBot = DevAli:get(ServerLaUrEn.."TokenLaUrEn"),
LaUrEn = DevAli:get(ServerLaUrEn.."TokenLaUrEn"):match("(%d+)"),
SudoIds = {DevAli:get(ServerLaUrEn.."IdLaUrEn")},
}
Create(Config, "./config.lua")
file = io.open("LaUrEn.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/LaUrEn
token="]]..DevAli:get(ServerLaUrEn.."TokenLaUrEn")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "โโโโโโ ๐ฃ โโโโโโ โ โโโโโโ ๐ฃ โโโโโโ โ โ โ โ"
echo "~ The tg File Was Not Found In The Bot Files"
echo "โโโโโโ ๐ฃ โโโโโโ โ โโโโโโ ๐ฃ โโโโโโ โ โ โ โ"
exit 1
fi
if [ ! $token ]; then
echo "โโโโโโ ๐ฃ โโโโโโ โ โโโโโโ ๐ฃ โโโโโโ โ โ โ โ โ โ"
echo "~ The Token Was Not Found In The config.lua File"
echo "โโโโโโ ๐ฃ โโโโโโ โ โโโโโโ ๐ฃ โโโโโโ โ โ โ โ โ โ"
exit 1
fi
./tg -s ./LaUrEn.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/LaUrEn
while(true) do
rm -fr ../.telegram-cli
screen -S LaUrEn -X kill
screen -S LaUrEn ./LaUrEn.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_LaUrEn = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAli:del(ServerLaUrEn.."IdLaUrEn");DevAli:del(ServerLaUrEn.."TokenLaUrEn")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_LaUrEn() 
print("\27[36m"..[[                                           
LaUrEn Source
]]..'\27[m'.."\n\27[35mServer Information โฌ โค \nโโโโโโ ๐ฃ โโโโโโ โ โ โ โ\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35mโโโโโโ ๐ฃ โโโโโโ โ โ โ โ\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId or Config.SUDO
SudoIds = {Config.SudoIds,742655070,1783964439} or {Config.sudo_users,742655070,1783964439}
LaUrEn = Config.LaUrEn or Config.bot_id
TokenBot = Config.TokenBot or Config.token
NameBot = (DevAli:get(LaUrEn..'Ali:NameBot') or 'ุณูุงุจ')
--     Source LaUrEn     --
FilesPrint = "\27[35m".."\nAll Source Files Started โฌ โค \nโโโโโโ ๐ฃ โโโโโโ โ โ โ โ\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."โโโโโโ ๐ฃ โโโโโโ โ โ โ โ\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source LaUrEn     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source LaUrEn     --
function dl_cb(arg, data)
end
--     Source LaUrEn     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source LaUrEn     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(LaUrEn) then  
var = true  
end  
return var  
end 
--     Source LaUrEn     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
------ Vip Member All ------
function VipAll(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
----   AliConstructor   ----
function AliConstructor(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AliConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AliConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AliConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AliConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AliConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAli:sismember(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AliConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LaUrEn     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAli:sismember(LaUrEn..'Ali:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source LaUrEn     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAli:sismember(LaUrEn..'Ali:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source LaUrEn     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAli:sismember(LaUrEn..'Ali:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source LaUrEn     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAli:sismember(LaUrEn..'Ali:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source LaUrEn     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source LaUrEn     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source LaUrEn     --
function LaUrEnFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.LaUrEn and msg then
FilesText = plugin.LaUrEn(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source LaUrEn     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source LaUrEn     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= LaUrEn:lower() then 
send(chat,msg.id_,"โน : ุนุฐุฑุง ูุฐุง ุงูููู ููุณ ุชุงุจุน ููุฐุง ุงูุจูุช")   
return false 
end
send(chat,msg.id_,"โน : ุฌุงุฑู ุฑูุน ุงูููู ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"โน : ุนุฐุฑุง ุงูููู ููุณ ุจุตูุบุฉ -โบ  Json ูุฑุฌู ุฑูุน ุงูููู ุงูุตุญูุญ")
end
local info_file = io.open('./'..LaUrEn..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAli:set(LaUrEn.."Ali:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAli:sadd(LaUrEn.."Ali:Groups",IdGps) 
DevAli:set(LaUrEn.."Ali:Lock:Bots"..IdGps,"del") DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Ali:Lock:Links','Ali:Lock:Contact','Ali:Lock:Forwards','Ali:Lock:Videos','Ali:Lock:Gifs','Ali:Lock:EditMsgs','Ali:Lock:Stickers','Ali:Lock:Farsi','Ali:Lock:Spam','Ali:Lock:WebLinks','Ali:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAli:set(LaUrEn..Lock..IdGps,true)
end
if v.AliConstructors then
for k,IdAliConstructors in pairs(v.AliConstructors) do
DevAli:sadd(LaUrEn..'Ali:AliConstructor:'..IdGps,IdAliConstructors)  
print('ุชู ุฑูุน ููุดุฆูู ุงููุฌููุนุงุช')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู ุงุณุงุณููู')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAli:sadd(LaUrEn..'Ali:Constructor:'..IdGps,IdConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAli:sadd(LaUrEn..'Ali:Managers:'..IdGps,IdManagers)  
print('ุชู ุฑูุน ( '..k..' ) ูุฏุฑุงุก')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAli:sadd(LaUrEn..'Ali:Admins:'..IdGps,IdAdmins)  
print('ุชู ุฑูุน ( '..k..' ) ุงุฏูููู')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAli:sadd(LaUrEn..'Ali:VipMem:'..IdGps,IdVips)  
print('ุชู ุฑูุน ( '..k..' ) ูููุฒูู')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAli:set(LaUrEn.."Ali:Groups:Links"..IdGps,v.LinkGroups)   
print('( ุชู ูุถุน ุฑูุงุจุท ุงููุฌููุนุงุช )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAli:set(LaUrEn.."Ali:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( ุชู ูุถุน ุชุฑุญูุจ ุงููุฌููุนุงุช )')
end
end
end
send(chat,msg.id_,"โน : ุชู ุฑูุน ุงููุณุฎู ุจูุฌุงุญ \nโน : ุชู ุชูุนูู ุฌููุน ุงููุฌููุนุงุช \nโน : ุชู ุงุณุชุฑุฌุงุน ูุดุฑููู ุงููุฌููุนุงุช \nโน : ุชู ุงุณุชุฑุฌุงุน ุงูุงูุฑ ุงูููู ูุงููุชุญ ูู ุฌููุน ูุฌููุนุงุช ุงูุจูุช ")
end
--     Source LaUrEn     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source LaUrEn     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     Source LaUrEn     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source LaUrEn     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source LaUrEn     --
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source LaUrEn     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source LaUrEn     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source LaUrEn     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source LaUrEn     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source LaUrEn     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source LaUrEn     --
function Dev_Ali(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source LaUrEn     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source LaUrEn     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source LaUrEn     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source LaUrEn     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source LaUrEn     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source LaUrEn     --
local AliRank = function(msg) if SudoId(msg.sender_user_id_) then LaUrEnTEAM  = "ุงููุทูุฑ" elseif SecondSudo(msg) then LaUrEnTEAM = "ุงููุทูุฑ" elseif SudoBot(msg) then LaUrEnTEAM = "ุงููุทูุฑ" elseif ManagerAll(msg) then LaUrEnTEAM = "ุงููุฏูุฑ" elseif AdminAll(msg) then LaUrEnTEAM = "ุงูุงุฏูู" elseif AliConstructor(msg) then LaUrEnTEAM = "ุงููุงูู" elseif BasicConstructor(msg) then LaUrEnTEAM = "ุงูููุดุฆ" elseif Constructor(msg) then LaUrEnTEAM = "ุงูููุดุฆ" elseif Manager(msg) then LaUrEnTEAM = "ุงููุฏูุฑ" elseif Admin(msg) then LaUrEnTEAM = "ุงูุงุฏูู" else LaUrEnTEAM = "ุงูุนุถู" end return LaUrEnTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1783964439) then LaUrEnTEAM = 'ูุทูุฑ ุงูุณูุฑุณ' elseif tonumber(user_id) == tonumber(LaUrEn) then LaUrEnTEAM = 'ุงูุจูุช' elseif SudoId(user_id) then LaUrEnTEAM = 'ุงููุทูุฑ ุงูุงุณุงุณู' elseif DevAli:sismember(LaUrEn..'Ali:SecondSudo:', user_id) then LaUrEnTEAM = 'ุงููุทูุฑ ุงูุซุงููู' elseif DevAli:sismember(LaUrEn..'Ali:SudoBot:', user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:SudoBot:Rd"..chat_id) or 'ุงููุทูุฑ' elseif DevAli:sismember(LaUrEn..'Ali:ManagerAll:', user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Managers:Rd"..chat_id) or 'ุงููุฏูุฑ ุงูุนุงู' elseif DevAli:sismember(LaUrEn..'Ali:AdminAll:', user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Admins:Rd"..chat_id) or 'ุงูุงุฏูู ุงูุนุงู' elseif DevAli:sismember(LaUrEn..'Ali:VipAll:', user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:VipMem:Rd"..chat_id) or 'ุงููููุฒ ุงูุนุงู' elseif DevAli:sismember(LaUrEn..'Ali:AliConstructor:'..chat_id, user_id) then LaUrEnTEAM = 'ุงููุงูู' elseif DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..chat_id, user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:BasicConstructor:Rd"..chat_id) or 'ุงูููุดุฆ ุงูุงุณุงุณู' elseif DevAli:sismember(LaUrEn..'Ali:Constructor:'..chat_id, user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Constructor:Rd"..chat_id) or 'ุงูููุดุฆ' elseif DevAli:sismember(LaUrEn..'Ali:Managers:'..chat_id, user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Managers:Rd"..chat_id) or 'ุงููุฏูุฑ' elseif DevAli:sismember(LaUrEn..'Ali:Admins:'..chat_id, user_id) then LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Admins:Rd"..chat_id) or 'ุงูุงุฏูู' elseif DevAli:sismember(LaUrEn..'Ali:VipMem:'..chat_id, user_id) then  LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:VipMem:Rd"..chat_id) or 'ุงููููุฒ' elseif DevAli:sismember(LaUrEn..'Ali:Cleaner:'..chat_id, user_id) then  LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:Cleaner:Rd"..chat_id) or 'ุงูููุธู' else LaUrEnTEAM = DevAli:get(LaUrEn.."Ali:mem:Rd"..chat_id) or 'ุงูุนุถู' end return LaUrEnTEAM end
--     Source LaUrEn     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(LaUrEn) then  
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:SecondSudo:', user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:SudoBot:', user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:ManagerAll:', user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:AdminAll:', user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:VipAll:', user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:AliConstructor:'..chat_id, user_id) then
var = true
elseif DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAli:sismember(LaUrEn..'Ali:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:Managers:'..chat_id, user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:Admins:'..chat_id, user_id) then
var = true  
elseif DevAli:sismember(LaUrEn..'Ali:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AliDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAli:sismember(LaUrEn..'Ali:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAli:sismember(LaUrEn..'Ali:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAli:sismember(LaUrEn..'Ali:AliConstructor:'..chat_id, user_id) then
var = 'aliconstructor'
elseif DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAli:sismember(LaUrEn..'Ali:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAli:sismember(LaUrEn..'Ali:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source LaUrEn     --
local function Filters(msg, value)
local ali = (LaUrEn..'Ali:Filters:'..msg.chat_id_)
if ali then
local names = DevAli:hkeys(ali)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "iinzzz")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุนุฐุฑุง ุนุฒูุฒู -โบ  ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงูุนุถู -โบ  ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุจูุงุณุทุฉ -โบ  ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงูุญุณุงุจ ูุญุฐูู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู", 1, 'md')
end
end,nil)   
end
--     Source LaUrEn     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "ุงููุงูู"
elseif GetInfo.result.status == "administrator" then 
Status = "ูุดุฑู"
else
Status = false
end
if GetInfo.result.custom_title then 
Ali = GetInfo.result.custom_title
else 
Ali = Status
end
end
return Ali
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'โน : ูุงูู ุงููุฌููุนู')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'โน : ูุฌุฑุฏ ุนุถู ููุง')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'โน : ุงูุดุฎุต ุบูุฑ ููุฌูุฏ ููุง')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
send(msg.chat_id_,msg.id_,'โน : ุตูุงุญูุงุช '..GetCustomTitle(user_id,msg.chat_id_)..' ูู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุญุฐู ุงูุฑุณุงุฆู -โบ  '..DEL..'\nโน : ุฏุนูุฉ ุงููุณุชุฎุฏููู -โบ  '..INV..'\nโน : ุญุธุฑ ุงููุณุชุฎุฏููู -โบ  '..BAN..'\nโน : ุชุซุจูุช ุงูุฑุณุงุฆู -โบ  '..PIN..'\nโน : ุชุบููุฑ ุงููุนูููุงุช -โบ  '..EDT..'\nโน : ุงุถุงูุฉ ูุดุฑููู -โบ  '..VIP..'\nโโโโโโ ๐ฃ โโโโโโ')
end
end
end
--     Source LaUrEn     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Ali = GetInfo.result.bio
else 
Ali = "ูุง ููุฌุฏ"
end
end
return Ali
end
--     Source LaUrEn     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'ุฌุฏุง ุถุนูู' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ุถุนูู' 
elseif tonumber(msgs) < 500 then 
MsgText = 'ุบูุฑ ูุชูุงุนู' 
elseif tonumber(msgs) < 750 then 
MsgText = 'ูุชูุณุท' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'ูุชูุงุนู' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'ููุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ููู ุงูุชูุงุนู'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'ุงุณุทูุฑุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'ูุชูุงุนู ูุงุฑ' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'ูุฌุฏุญ ุฌุฏุญ' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'ุฎูุงูู' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'ุฑุจ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'ูุงูุฑ ุจุงูุชูุงุนู' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "ูุนูู ูุฑุจู" 
end 
return MsgText
end
--     Source LaUrEn     --
function alimoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAli:get(LaUrEn..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source LaUrEn     --
function ChCheck(msg)
local var = true 
if DevAli:get(LaUrEn.."Ali:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAli:get(LaUrEn..'Ali:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAli:get(LaUrEn..'Ali:ChText') then
local ChText = DevAli:get(LaUrEn..'Ali:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAli:get(LaUrEn.."Ali:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "โน : ุนุฐุฑุง ูุงุชุณุชุทูุน ุงุณุชุฎุฏุงู ุงูุจูุช !\nโน : ุนููู ุงูุงุดุชุฑุงู ูู ุงูููุงุฉ ุงููุง :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAli:get(LaUrEn..'yes'..data.sender_user_id_) == 'delyes' then
DevAli:del(LaUrEn..'yes'..data.sender_user_id_, 'delyes')
DevAli:del(LaUrEn..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โน : ูุง ุงุณุชุทูุน ุทุฑุฏ -โบ  "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "โน : ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "โน : ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุทุฑุฏู ูู ุงููุฌููุนู") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAli:get(LaUrEn..'no'..data.sender_user_id_) == 'delno' then
DevAli:del(LaUrEn..'yes'..data.sender_user_id_, 'delyes')
DevAli:del(LaUrEn..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงุทุฑุฏูู") 
end
--     Source LaUrEn     --
if DataText == '/yesdel' and DevAli:get(LaUrEn..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAli:del(LaUrEn..'yesdel'..data.sender_user_id_, 'delyes')
DevAli:del(LaUrEn..'nodel'..data.sender_user_id_, 'delno')
if DevAli:sismember(LaUrEn..'Ali:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAli:sismember(LaUrEn..'Ali:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'ุงููุฏุฑุงุก โข ' else Managers = '' end
if DevAli:sismember(LaUrEn..'Ali:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAli:sismember(LaUrEn..'Ali:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAli:sismember(LaUrEn..'Ali:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = '' end
if DevAli:sismember(LaUrEn..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'ุงููุทุงูู โข ' else donky = '' end
if DevAli:sismember(LaUrEn..'Ali:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAli:sismember(LaUrEn..'Ali:Managers:'..data.chat_id_, data.sender_user_id_) or DevAli:sismember(LaUrEn..'Ali:Admins:'..data.chat_id_, data.sender_user_id_) or DevAli:sismember(LaUrEn..'Ali:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAli:sismember(LaUrEn..'Ali:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAli:sismember(LaUrEn..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAli:srem(LaUrEn..'Ali:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..data.chat_id_,data.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..data.chat_id_,data.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAli:srem(LaUrEn..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุชูุฒููู ูู -โบ  โค\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'ุงูุนุถู' then
EditMsg(Chat_Id2, Msg_Id2, "โน : ููุณ ูุฏูู ุฑุชุจู ูู ุงูุจูุช") 
else 
EditMsg(Chat_Id2, Msg_Id2, "โน : ูุง ุงุณุชุทูุน ุชูุฒูู -โบ  "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAli:get(LaUrEn.."Ali:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู") 
DevAli:del(LaUrEn.."Ali:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAli:get(LaUrEn.."Ali:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "โน : ุงููุทูุฑ ุงูุฌุฏูุฏ -โบ  ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nโน : ุชู ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู ุจูุฌุงุญ") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"โน : ุจูุงุณุทุฉ -โบ  ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nโน : ููุฏ ุงุตุจุญุช ุงูุช ูุทูุฑ ูุฐุง ุงูุจูุช",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
LaUrEn = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAli:del(LaUrEn.."Ali:NewDev"..data.sender_user_id_)
dofile('LaUrEn.lua') 
end
end
if DataText == '/nodel' and DevAli:get(LaUrEn..'nodel'..data.sender_user_id_) == 'delno' then
DevAli:del(LaUrEn..'yesdel'..data.sender_user_id_, 'delyes')
DevAli:del(LaUrEn..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงูุบุงุก ุงูุฑ ูุฒููู") 
end
if DataText == '/YesRolet' and DevAli:get(LaUrEn.."Ali:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAli:smembers(LaUrEn..'Ali:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAli:del(LaUrEn..'Ali:ListRolet'..data.chat_id_) 
DevAli:del(LaUrEn.."Ali:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โน : *ุตุงุญุจ ุงูุญุธ* -โบ  ["..UserName.."]\nโน : *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*")
end
if DataText == '/NoRolet' then
DevAli:del(LaUrEn..'Ali:ListRolet'..data.chat_id_) 
DevAli:del(LaUrEn.."Ali:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAli:del(LaUrEn.."Ali:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงูุบุงุก ุงููุนุจู ูุงุนุงุฏุฉ ุงููุนุจ ุงุฑุณู ุงูุงูุนุงุจ") 
end
if DataText == '/ListRolet' then
local List = DevAli:smembers(LaUrEn..'Ali:ListRolet'..data.chat_id_) 
local Text = 'โน : ูุงุฆูุฉ ุงูุงุนุจูู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n' 
local Textt = 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/YesRolet"},{text="ูุง",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevAli:sismember(LaUrEn..'Ali:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAli:srem(LaUrEn..'Ali:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู ุจูุฌุงุญ .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ูุฐุง ุงูุงูุฑ ููุดู ุงูุฑูุจูุช ูููุณ ูู .")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "โน : ุงููููู -โบ  "..Abbs.." ุชู ุญุฐููุง") 
DevAli:del(LaUrEn..'Ali:Text:GpTexts'..Abbs..data.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRedod'..data.chat_id_,Abbs)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevAli:smembers(LaUrEn..'Ali:Text:GpTexts'..Abbs..data.chat_id_)
if DevAli:get(LaUrEn..'Ali:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงููุงุก ูุญูุธ -โบ  "..#List.." ูู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ -โบ  "..Abbs) 
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "โน : ุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevAli:get(LaUrEn..'Ali:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ -โบ  "..Abbs) 
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevAli:del(LaUrEn..'Ali:Text:GpTexts'..Abbs..data.chat_id_)
DevAli:del(LaUrEn..'Ali:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRedod'..data.chat_id_,Abbs)
else
EditMsg(Chat_Id2, Msg_Id2, "โน : ุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local Abbs = DataText:match('/HideHelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โน : ุชู ุงุฎูุงุก ูููุดุฉ ุงูุงูุงูุฑ") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Abbs = DataText:match('/HelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAli:get(LaUrEn..'Ali:Help')
local Text = [[
โน : ุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุงูุฑ -โบ  โค 
โโโโโโ ๐ฃ โโโโโโ
โน : ู1 -โบ  ุงูุงูุฑ ุงูุญูุงูู
โน : ู2 -โบ  ุงูุงูุฑ ุงูุงุฏูููู
โน : ู3 -โบ  ุงูุงูุฑ ุงููุฏุฑุงุก
โน : ู4 -โบ  ุงูุงูุฑ ุงูููุดุฆูู
โน : ู5 -โบ  ุงูุงูุฑ ุงููุทูุฑูู
โน : ู6 -โบ  ุงูุงูุฑ ุงูุงุนุถุงุก
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Abbs = DataText:match('/HelpList1:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevAli:get(LaUrEn..'Ali:Help1')
local Text = [[
โน : ุงูุงูุฑ ุญูุงูุฉ ุงููุฌููุนู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ููู โข ูุชุญ -โบ  ุงูุฑูุงุจุท
โน : ููู โข ูุชุญ -โบ  ุงููุนุฑูุงุช
โน : ููู โข ูุชุญ -โบ  ุงูุจูุชุงุช
โน : ููู โข ูุชุญ -โบ  ุงููุชุญุฑูู
โน : ููู โข ูุชุญ -โบ  ุงูููุตูุงุช
โน : ููู โข ูุชุญ -โบ  ุงููููุงุช
โน : ููู โข ูุชุญ -โบ  ุงูุตูุฑ
โน : ููู โข ูุชุญ -โบ  ุงูููุฏูู
โน : ููู โข ูุชุญ -โบ  ุงูุงูููุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุฏุฑุฏุดู
โน : ููู โข ูุชุญ -โบ  ุงูุชูุฌูู
โน : ููู โข ูุชุญ -โบ  ุงูุงุบุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุตูุช
โน : ููู โข ูุชุญ -โบ  ุงูุฌูุงุช
โน : ููู โข ูุชุญ -โบ  ุงููุงุฑูุฏุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุชูุฑุงุฑ
โน : ููู โข ูุชุญ -โบ  ุงููุงุดุชุงู
โน : ููู โข ูุชุญ -โบ  ุงูุชุนุฏูู
โน : ููู โข ูุชุญ -โบ  ุงูุงุจุงุญู
โน : ููู โข ูุชุญ -โบ  ุงูุชุซุจูุช
โน : ููู โข ูุชุญ -โบ  ุงูุงุดุนุงุฑุงุช
โน : ููู โข ูุชุญ -โบ  ุงูููุงูุด
โน : ููู โข ูุชุญ -โบ  ุงูุฏุฎูู
โน : ููู โข ูุชุญ -โบ  ุงูุดุจูุงุช
โน : ููู โข ูุชุญ -โบ  ุงูููุงูุน
โน : ููู โข ูุชุญ -โบ  ุงููุดุงุฑ
โน : ููู โข ูุชุญ -โบ  ุงูููุฑ
โน : ููู โข ูุชุญ -โบ  ุงูุทุงุฆููู
โน : ููู โข ูุชุญ -โบ  ุงููู
โน : ููู โข ูุชุญ -โบ  ุงูุนุฑุจูู
โน : ููู โข ูุชุญ -โบ  ุงูุงููููุฒูู
โน : ููู โข ูุชุญ -โบ  ุงููุงุฑุณูู
โน : ููู โข ูุชุญ -โบ  ุงูุชูููุด
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุญูุงูู ุงุฎุฑู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ููู โข ูุชุญ + ุงูุงูุฑ -โบ  โค
โน : ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ
โน : ุงูุชูุฑุงุฑ ุจุงููุชู
โน : ุงูุชูุฑุงุฑ ุจุงูุชููุฏ
โน : ุงููุงุฑุณูู ุจุงูุทุฑุฏ
โน : ุงูุจูุชุงุช ุจุงูุทุฑุฏ
โน : ุงูุจูุชุงุช ุจุงูุชููุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Abbs = DataText:match('/HelpList2:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevAli:get(LaUrEn..'Ali:Help2')
local Text = [[
โน : ุงูุงูุฑ ุงูุงุฏูููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงุนุฏุงุฏุช
โน : ุชุงู ูููู 
โน : ุงูุดุงุก ุฑุงุจุท
โน : ุถุน ูุตู
โน : ุถุน ุฑุงุจุท
โน : ุถุน ุตูุฑู
โน : ุญุฐู ุงูุฑุงุจุท
โน : ุญุฐู ุงููุทุงูู
โน : ูุดู ุงูุจูุชุงุช
โน : ุทุฑุฏ ุงูุจูุชุงุช
โน : ุชูุธูู + ุงูุนุฏุฏ
โน : ุชูุธูู ุงูุชุนุฏูู
โน : ููููู + ุงููููู
โน : ุงุณู ุงูุจูุช + ุงูุงูุฑ
โน : ุถุน โข ุญุฐู -โบ  ุชุฑุญูุจ
โน : ุถุน โข ุญุฐู -โบ  ููุงููู
โน : ุงุถู โข ุญุฐู -โบ  ุตูุงุญูู
โน : ุงูุตูุงุญูุงุช โข ุญุฐู ุงูุตูุงุญูุงุช
โโโโโโ ๐ฃ โโโโโโ
โน : ุถุน ุณุจุงู + ุงูุนุฏุฏ
โน : ุถุน ุชูุฑุงุฑ + ุงูุนุฏุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน ูููุฒ โข ุชูุฒูู ูููุฒ
โน : ุงููููุฒูู โข ุญุฐู ุงููููุฒูู
โน : ูุดู ุงููููุฏ โข ุฑูุน ุงููููุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุญุฐู โข ูุณุญ + ุจุงูุฑุฏ
โน : ููุน โข ุงูุบุงุก ููุน
โน : ูุงุฆูู ุงูููุน
โน : ุญุฐู ูุงุฆูู ุงูููุน
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุฑุงุจุท
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุงูุนุงุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุชุฑุญูุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุชุงู ูููู
โน : ุชูุนูู โข ุชุนุทูู -โบ  ูุดู ุงูุงุนุฏุงุฏุงุช
โโโโโโ ๐ฃ โโโโโโ
โน : ุทุฑุฏ ุงููุญุฐูููู
โน : ุทุฑุฏ -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ูุชู โข ุงูุบุงุก ูุชู
โน : ุชููุฏ โข ุงูุบุงุก ุชููุฏ
โน : ุญุธุฑ โข ุงูุบุงุก ุญุธุฑ
โน : ุงูููุชูููู โข ุญุฐู ุงูููุชูููู
โน : ุงููููุฏูู โข ุญุฐู ุงููููุฏูู
โน : ุงููุญุธูุฑูู โข ุญุฐู ุงููุญุธูุฑูู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูููุฏ ุฏูููู + ุนุฏุฏ ุงูุฏูุงุฆู
โน : ุชูููุฏ ุณุงุนู + ุนุฏุฏ ุงูุณุงุนุงุช
โน : ุชูููุฏ ููู + ุนุฏุฏ ุงูุงูุงู
โน : ุงูุบุงุก ุชูููุฏ -โบ  ูุงูุบุงุก ุงูุชูููุฏ ุจุงูููุช
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Abbs = DataText:match('/HelpList3:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevAli:get(LaUrEn..'Ali:Help3')
local Text = [[
โน : ุงูุงูุฑ ุงููุฏุฑุงุก -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ูุญุต ุงูุจูุช
โน : ุถุน ุงุณู + ุงูุงุณู
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ
โน : ุฑุฏูุฏ ุงููุฏูุฑ
โน : ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ ูุชุนุฏุฏ
โน : ุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ
โน : ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โน : ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โน : ุญุฐู ููุงุฆู ุงูููุน
โน : ููุน -โบ  ุจุงูุฑุฏ ุนูู ( ููุตู โข ุตูุฑู โข ูุชุญุฑูู )
โน : ุญุฐู ูุงุฆูู ููุน + -โบ  โค
( ุงูุตูุฑ โข ุงููุชุญุฑูุงุช โข ุงูููุตูุงุช )
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุฒูู ุงููู
โน : ุฑูุน ุงุฏูู โข ุชูุฒูู ุงุฏูู
โน : ุงูุงุฏูููู โข ุญุฐู ุงูุงุฏูููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุซุจูุช
โน : ุงูุบุงุก ุงูุชุซุจูุช
โน : ุงุนุงุฏู ุงูุชุซุจูุช
โน : ุงูุบุงุก ุชุซุจูุช ุงููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุบูุฑ ุฑุฏ + ุงุณู ุงูุฑุชุจู + ุงููุต -โบ  โค
โน : ุงููุทูุฑ โข ููุดุฆ ุงูุงุณุงุณู
โน : ุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู
โน : ุงููููุฒ โข ุงูููุธู โข ุงูุนุถู
โน : ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุบููุฑ ุงูุงูุฏู -โบ  ูุชุบููุฑ ุงููููุดู
โน : ุชุนููู ุงูุงูุฏู -โบ  ูุชุนููู ุงููููุดู
โน : ุญุฐู ุงูุงูุฏู -โบ  ูุญุฐู ุงููููุดู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ุงุทุฑุฏูู โข ุงูุงูุฏู ุจุงูุตูุฑู โข ุงูุงุจุฑุงุฌ
โน : ูุนุงูู ุงูุงุณูุงุก โข ุงูุงูุฑ ุงููุณุจ โข ุงูุทู
โน : ุงูุงูุฏู โข ุชุญููู ุงูุตูุบ โข ุงูุงูุฑ ุงูุชุญุดูุด
โน : ุฑุฏูุฏ ุงููุฏูุฑ โข ุฑุฏูุฏ ุงููุทูุฑ โข ุงูุชุญูู
โน : ุถุงููู โข ุญุณุงุจ ุงูุนูุฑ โข ุงูุฒุฎุฑูู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Abbs = DataText:match('/HelpList4:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevAli:get(LaUrEn..'Ali:Help4')
local Text = [[
โน : ุงูุงูุฑ ุงูููุดุฆูู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุฒูู ุงููู
โน : ุงูููุฏูุง โข ุงูุณุญ
โน : ุชุนูู ุนุฏุฏ ุงูุญุฐู
โน : ุชุฑุชูุจ ุงูุงูุงูุฑ
โน : ุงุถู โข ุญุฐู -โบ  ุงูุฑ
โน : ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู
โน : ุงูุงูุงูุฑ ุงููุถุงูู
โน : ุงุถู ููุงุท -โบ  ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โน : ุงุถู ุฑุณุงุฆู -โบ  ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โน : ุฑูุน ููุธู โข ุชูุฒูู ููุธู
โน : ุงูููุธููู โข ุญุฐู ุงูููุธููู
โน : ุฑูุน ูุฏูุฑ โข ุชูุฒูู ูุฏูุฑ
โน : ุงููุฏุฑุงุก โข ุญุฐู ุงููุฏุฑุงุก
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ูุฒููู โข ุงูุณุญ
โน : ุงูุญุธุฑ โข ุงููุชู
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงูููุดุฆูู ุงูุงุณุงุณููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ูุถุน ููุจ + ุงูููุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุฑูุน
โน : ุฑูุน ููุดุฆ โข ุชูุฒูู ููุดุฆ
โน : ุงูููุดุฆูู โข ุญุฐู ุงูููุดุฆูู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุดุฑู
โน : ุฑูุน ุจูู ุงูุตูุงุญูุงุช
โน : ุญุฐู ุงูููุงุฆู
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงููุงูููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน โข ุชูุฒูู -โบ  ููุดุฆ ุงุณุงุณู
โน : ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู 
โน : ุงูููุดุฆูู ุงูุงุณุงุณููู 
โน : ุญุฐู ุฌููุน ุงูุฑุชุจ
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Abbs = DataText:match('/HelpList5:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevAli:get(LaUrEn..'Ali:Help5')
local Text = [[
โน : ุงูุงูุฑ ุงููุทูุฑูู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงููุฑูุจุงุช
โน : ุงููุทูุฑูู
โน : ุงููุดุชุฑููู
โน : ุงูุงุญุตุงุฆูุงุช
โน : ุงููุฌููุนุงุช
โน : ุงุณู ุงูุจูุช + ุบุงุฏุฑ
โน : ุงุณู ุงูุจูุช + ุชุนุทูู
โน : ูุดู + -ุงูุฏู ุงููุฌููุนู
โน : ุฑูุน ูุงูู โข ุชูุฒูู ูุงูู
โน : ุงููุงูููู โข ุญุฐู ุงููุงูููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุฏูุฑ ุนุงู
โน : ุญุฐู โข ุงููุฏุฑุงุก ุงูุนุงููู 
โน : ุฑูุน โข ุชูุฒูู -โบ  ุงุฏูู ุนุงู
โน : ุญุฐู โข ุงูุงุฏูููู ุงูุนุงููู 
โน : ุฑูุน โข ุชูุฒูู -โบ  ูููุฒ ุนุงู
โน : ุญุฐู โข ุงููููุฒูู ุนุงู 
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงููุทูุฑ ุงูุงุณุงุณู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุญุฏูุซ
โน : ุงููููุงุช
โน : ุงููุชุฌุฑ
โน : ุงูุณูุฑูุฑ
โน : ุฑูุงุจุท ุงููุฑูุจุงุช
โน : ุชุญุฏูุซ ุงูุณูุฑุณ
โน : ุชูุธูู ุงููุฑูุจุงุช
โน : ุชูุธูู ุงููุดุชุฑููู
โน : ุญุฐู ุฌููุน ุงููููุงุช
โน : ุชุนููู ุงูุงูุฏู ุงูุนุงู
โน : ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู
โน : ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ
โน : ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ
โน : ุบุงุฏุฑ + -ุงูุฏู ุง๏ฟฝ๏ฟฝูุฌููุนู
โน : ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก + ุงูุนุฏุฏ
โน : ุญุธุฑ ุนุงู โข ุงูุบุงุก ุงูุนุงู
โน : ูุชู ุนุงู โข ุงูุบุงุก ุงูุนุงู
โน : ูุงุฆูู ุงูุนุงู โข ุญุฐู ูุงุฆูู ุงูุนุงู
โน : ูุถุน โข ุญุฐู -โบ  ุงุณู ุงูุจูุช
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ ุนุงู
โน : ุฑุฏูุฏ ุงููุทูุฑ โข ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ
โน : ุชุนููู โข ุญุฐู โข ุฌูุจ -โบ  ุฑุฏ ุงูุฎุงุต
โน : ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช
โน : ุฑูุน ุงููุณุฎู + ุจุงูุฑุฏ ุนูู ุงูููู
โน : ุชุนููู โข ุญุฐู -โบ  ููุงุฉ ุงูุงุดุชุฑุงู
โน : ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู
โน : ุชุบููุฑ โข ุญุฐู -โบ  ูููุดู ุงูุงุดุชุฑุงู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุทูุฑ
โน : ุงููุทูุฑูู โข ุญุฐู ุงููุทูุฑูู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุทูุฑ ุซุงููู
โน : ุงูุซุงููููู โข ุญุฐู ุงูุซุงููููู
โน : ุชุนููู โข ุญุฐู -โบ  ูููุดุฉ ุงูุงูุฏู
โน : ุงุฐุงุนู ูููู ุจุงูุชูุฌูู -โบ  ุจุงูุฑุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู ููู + ุงุณู ุงูููู
โน : ุชุนุทูู ููู + ุงุณู ุงูููู
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ุงูุงุฐุงุนู โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู
โน : ุชุฑุญูุจ ุงูุจูุช โข ุงููุบุงุฏุฑู
โน : ุงูุจูุช ุงูุฎุฏูู โข ุงูุชูุงุตู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Abbs = DataText:match('/HelpList6:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAli:get(LaUrEn..'Ali:Help6')
local Text = [[
โน : ุงูุงูุฑ ุงูุงุนุถุงุก -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุณูุฑุณ โข ูููุนู โข ุฑุชุจุชู โข ูุนูููุงุชู 
โน : ุฑููู โข ููุจู โข ูุจุฐุชู โข ุตูุงุญูุงุชู โข ุบูููู
โน : ุฑุณุงุฆูู โข ุญุฐู ุฑุณุงุฆูู โข ุงุณูู โข ูุนุฑูู 
โน : ุงูุฏู โขุงูุฏูู โข ุฌูุงุชู โข ุฑุงุณููู โข ุงูุงูุนุงุจ 
โน : ููุงุทู โข ุจูุน ููุงุทู โข ุงูููุงููู โข ุฒุฎุฑูู 
โน : ุฑุงุจุท ุงูุญุฐู โข ูุฒููู โข ุงุทุฑุฏูู โข ุงููุทูุฑ 
โน : ููู ุถุงููู โข ูุดุงูุฏุงุช ุงูููุดูุฑ โข ุงูุฑุงุจุท 
โน : ุงูุฏู ุงููุฌููุนู โข ูุนูููุงุช ุงููุฌููุนู 
โน : ูุณุจู ุงูุญุจ โข ูุณุจู ุงููุฑู โข ูุณุจู ุงูุบุจุงุก 
โน : ูุณุจู ุงูุฑุฌููู โข ูุณุจู ุงูุงููุซู โข ุงูุชูุงุนู
โโโโโโ ๐ฃ โโโโโโ
โน : ููุจู + ุจุงูุฑุฏ
โน : ููู + ุงููููู
โน : ุฒุฎุฑูู + ุงุณูู
โน : ุจุฑุฌ + ููุน ุงูุจุฑุฌ
โน : ูุนูู ุงุณู + ุงูุงุณู
โน : ุจูุณู โข ุจูุณูุง -โบ  ุจุงูุฑุฏ
โน : ุงุญุณุจ + ุชุงุฑูุฎ ูููุงุฏู
โน : ุฑูุน ูุทู โข ุชูุฒูู ูุทู โข ุงููุทุงูู
โน : ูููู โข ููููุง -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู
โน : ุตูุญู โข ุตูุญูุง -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู
โน : ุตูุงุญูุงุชู -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ุงูุฏู โข ูุดู  -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ุชุญููู + ุจุงูุฑุฏ -โบ  ุตูุฑู โข ููุตู โข ุตูุช โข ุจุตูู
โน : ุงูุทู + ุงูููุงู ุชุฏุนู ุฌููุน ุงููุบุงุช ูุน ุงูุชุฑุฌูู ููุนุฑุจู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..data.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โช ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevAli:get(LaUrEn.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAli:get(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAli:del(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAli:del(LaUrEn.."Set:Cmd:Group:New"..msg.chat_id_)
DevAli:srem(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุงูุงูุฑ ูู ุงููุฌููุนู", 1, 'html')  
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงููุฌุฏ ุงูุฑ ุจูุฐุง ุงูุงุณู", 1, 'html')
end
DevAli:del(LaUrEn.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAli:get(LaUrEn..'Ali:NameBot') or "ุณูุงุจ")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAli:get(LaUrEn..'Ali:NameBot') or "ุณูุงุจ")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAli:get(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAli:get(LaUrEn.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAli:set(LaUrEn.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ุงูุงูุฑ ุงูุฌุฏูุฏ", 1, 'html')
DevAli:del(LaUrEn.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAli:set(LaUrEn.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAli:get(LaUrEn.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAli:get(LaUrEn.."Set:Cmd:Group:New"..msg.chat_id_)
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงูุงูุฑ", 1, 'html')
DevAli:del(LaUrEn.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "โน : ูุงุฆูุฉ ุงูุงูุงูุฑ ุงููุถุงูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
Cmds = DevAli:get(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") โข {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "โน : ูุงุชูุฌุฏ ุงูุงูุฑ ูุถุงูู ูู ุงููุฌููุนู"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู" or text == "ุญุฐู ุงูุงูุงูุฑ" or text == "ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAli:del(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAli:del(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู ูู ุงููุฌููุนู", 1, 'html')
end
if text == "ุชุฑุชูุจ ุงูุงูุงูุฑ" and Constructor(msg) then
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุง","ุงูุฏู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุง")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ู","ุฑูุน ูููุฒ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ู")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุงุฏ","ุฑูุน ุงุฏูู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุงุฏ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ูุฏ","ุฑูุน ูุฏูุฑ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ูุฏ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ูู","ุฑูุน ููุดุฆ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ูู")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุงุณ","ุฑูุน ููุดุฆ ุงุณุงุณู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุงุณ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ูุท","ุฑูุน ูุทูุฑ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ูุท")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุซุงููู","ุฑูุน ูุทูุฑ ุซุงููู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุซุงููู")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชู","ุชูุฒูู ุงููู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุชู")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชุนุท","ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุชุนุท")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชูุน","ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุชูุน")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑ","ุงูุฑุงุจุท")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุฑ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุฑ","ุฑุฏูุฏ ุงููุฏูุฑ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุฑ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุุ","ูุณุญ ุงูููุชูููู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุุ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุฏ","ุงุถู ุฑุฏ")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุฏ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุณุญ","ูุณุญ ุณุญูุงุชู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุณุญ")
DevAli:set(LaUrEn.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุณ","ูุณุญ ุฑุณุงุฆูู")
DevAli:sadd(LaUrEn.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุณ")
    send(msg.chat_id_, msg.id_,"โช๏ธุชู ุชุฑุชูุจ ุงูุงูุงูุฑ ุจุงูุดูู ุงูุชุงูู ~\n- ุงูุฏู - ุง .\n- ุฑูุน ูููุฒ - ู .\n-ุฑูุน ุงุฏูู - ุงุฏ .\n- ุฑูุน ูุฏูุฑ - ูุฏ . \n- ุฑูุน ููุดู - ูู . \n- ุฑูุน ููุดุฆ ุงูุงุณุงุณู - ุงุณ  .\n- ุฑูุน ูุทูุฑ - ูุท .\n-ุฑูุน ูุทูุฑ ุซุงููู - ุซุงููู .\n- ุชูุฒูู ุงููู - ุชู .\n- ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชุนุท .\n- ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชูุน .\n- ุงูุฑุงุจุท - ุฑ .\n- ุฑุฏูุฏ ุงููุฏูุฑ - ุฑุฑ .\n- ูุณุญ ุงูููุชูููู - ุุ .\n- ุงุถู ุฑุฏ - ุฑุฏ .\n- ูุณุญ ุณุญูุงุชู - ุณุญ .\n- ูุณุญ ุฑุณุงุฆูู - ุฑุณ .")  
    end
     if text == "ุงูุณุงุนู" then
local ramsesj20 = "\n ุงูุณุงุนู ุงูุงู : "..os.date("%I:%M%p")
send(msg.chat_id_, msg.id_,ramsesj20)
end

if text == "ุงูุชุงุฑูุฎ" then
local ramsesj20 =  "\n ุงูุชุงุฑูุฎ : "..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_,ramsesj20)
end
if text == "ุงุถู ุงูุฑ" or text == "ุงุถุงูุฉ ุงูุฑ" or text == "ุงุถุงูู ุงูุฑ" and ChCheck(msg) then
DevAli:set(LaUrEn.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ุงูุงูุฑ ุงููุฏูู", 1, 'html')
return false
end
if text == "ุญุฐู ุงูุฑ" or text == "ูุณุญ ุงูุฑ" and ChCheck(msg) then 
DevAli:set(LaUrEn.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ุงูุงูุฑ ุงูุฐู ููุช ุจุงุถุงูุชู ูุฏููุง", 1, 'html')
return false
end
end
--     Source LaUrEn     --
if text == "ุงูุตูุงุญูุงุช" or text == "ุตูุงุญูุงุช" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชูุฌุฏ ุตูุงุญูุงุช ูุถุงูู", 1, 'html')
return false
end
t = "โน : ูุงุฆูุฉ ุงูุตูุงุญูุงุช ุงููุถุงูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
var = DevAli:get(LaUrEn.."Comd:New:rt:Ali:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." โข ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "ุญุฐู ุงูุตูุงุญูุงุช" and ChCheck(msg) or text == "ูุณุญ ุงูุตูุงุญูุงุช" and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAli:del(LaUrEn.."Comd:New:rt:Ali:"..v..msg.chat_id_)
DevAli:del(LaUrEn.."Coomds"..msg.chat_id_)
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุงูุตูุงุญูุงุช ุงููุถุงูู", 1, 'html')
end
end
if text and text:match("^ุงุถู ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุงุถู ุตูุงุญูู (.*)$")
DevAli:set(LaUrEn.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAli:sadd(LaUrEn.."Coomds"..msg.chat_id_,ComdNew)  
DevAli:setex(LaUrEn.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ููุน ุงูุตูุงุญูู \n{ ุนุถู โข ูููุฒ  โข ุงุฏูู  โข ูุฏูุฑ }\nโน : ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, 'html')
end
if text and text:match("^ุญุฐู ุตูุงุญูู (.*)$") and ChCheck(msg) or text and text:match("^ูุณุญ ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุญุฐู ุตูุงุญูู (.*)$") or text:match("^ูุณุญ ุตูุงุญูู (.*)$")
DevAli:del(LaUrEn.."Comd:New:rt:Ali:"..ComdNew..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุงูุตูุงุญูู", 1, 'html')
end
if DevAli:get(LaUrEn.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ", 1, 'html')
DevAli:del(LaUrEn.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "ูุฏูุฑ" then
if not Constructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ  โข ุงุฏูู )\nโน : ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ุงุฏูู" then
if not Manager(msg) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ )\nโน : ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ูููุฒ" then
if not Admin(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู )\nโน : ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ูุฏูุฑ" or text == "ุงุฏูู" or text == "ูููุฒ" or text == "ุนุถู" then
local textn = DevAli:get(LaUrEn.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAli:set(LaUrEn.."Comd:New:rt:Ali:"..textn..msg.chat_id_,text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุถุงูุฉ ุงูุตูุงุญูู", 1, 'html')
DevAli:del(LaUrEn.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("ุฑูุน (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("ุฑูุน (.*)")
if DevAli:sismember(LaUrEn.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrali = DevAli:get(LaUrEn.."Comd:New:rt:Ali:"..DEV_ABBAS..msg.chat_id_)
if mrali == "ูููุฒ" and VipMem(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAli:sadd(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrali == "ุงุฏูู" and Admin(msg) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrali == "ูุฏูุฑ" and Manager(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAli:sadd(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrali == "ุนุถู" then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("ุชูุฒูู (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("ุชูุฒูู (.*)")
if DevAli:sismember(LaUrEn.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrali = DevAli:get(LaUrEn.."Comd:New:rt:Ali:"..DEV_ABBAS..msg.chat_id_)
if mrali == "ูููุฒ" and VipMem(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrali == "ุงุฏูู" and Admin(msg) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrali == "ูุฏูุฑ" and Manager(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrali == "ุนุถู" then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..DEV_ABBAS..' โฉ ุจูุฌุงุญ', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^ุฑูุน (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุฑูุน) (.*) @(.*)$")}
if DevAli:sismember(LaUrEn.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrali = DevAli:get(LaUrEn.."Comd:New:rt:Ali:"..text1[2]..msg.chat_id_)
if mrali == "ูููุฒ" and VipMem(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:sadd(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrali == "ุงุฏูู" and Admin(msg) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrali == "ูุฏูุฑ" and Manager(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:sadd(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:set(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrali == "ุนุถู" then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^ุชูุฒูู (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุชูุฒูู) (.*) @(.*)$")}
if DevAli:sismember(LaUrEn.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrali = DevAli:get(LaUrEn.."Comd:New:rt:Ali:"..text1[2]..msg.chat_id_)
if mrali == "ูููุฒ" and VipMem(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrali == "ุงุฏูู" and Admin(msg) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrali == "ูุฏูุฑ" and Manager(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:del(LaUrEn.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrali == "ุนุถู" then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู -โบ  โจ ['..result.title_..'](t.me/'..(text1[3] or 'iinzzz')..')'..' โฉ\nโน : ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source LaUrEn     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAli:incr(LaUrEn..'Ali:UsersMsgs'..LaUrEn..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAli:incr(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAli:incr(LaUrEn..'Ali:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAli:sismember(LaUrEn.."Ali:Users",msg.chat_id_) then
DevAli:sadd(LaUrEn.."Ali:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source LaUrEn     --
if ChatType == 'pv' then 
if text == '/start' or text == 'ุฑุฌูุน ุ๐โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โน : ูุฑุญุจุง ุนุฒูุฒู ุงููุทูุฑ \nโน : ุงูุช ุงููุทูุฑ ุงูุงุณุงุณู ููุง \nโน : ุงููู ุงุฒุฑุงุฑ ุณูุฑุณ ุณูุงุจ \nโน : ุชุณุชุทูุน ุงูุชุญูู ุจูู ุงูุงูุงูุฑ ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {
{'ูุถุน ุงุณู ุงูุจูุช','-โบ  ุชุญุฏูุซ โช','ูุถุน ูููุดู ุงููุทูุฑ'},
{'-โบ  ุงููุทูุฑูู โช','-โบ  ุงูุงุญุตุงุฆูุงุช โช'},
{'-โบ  ุงููุฌููุนุงุช โช','ุฑูุงุจุท ุงููุฑูุจุงุช','-โบ  ุงููุดุชุฑููู โช'},
{'-โบ  ุชุนุทูู ุงูุชูุงุตู โช','-โบ  ุชูุนูู ุงูุชูุงุตู โช'},
{'ุชูุธูู ุงููุฑูุจุงุช','-โบ  ูุงุฆูู ุงูุนุงู โช','ุชูุธูู ุงููุดุชุฑููู'},
{'-โบ  ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โช'},
{'ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช','ุชูุนูู ุชุฑุญูุจ ุงูุจูุช'},
{'-โบ  ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ โช'},
{'-โบ  ุชุนุทูู ุงููุบุงุฏุฑู โช','-โบ  ุชูุนูู ุงููุบุงุฏุฑู โช'},
{'-โบ  ุชุนุทูู ุงูุงุฐุงุนู โช','-โบ  ุชูุนูู ุงูุงุฐุงุนู โช'},
{'-โบ  ุงุฐุงุนู ุจุงูุชุซุจูุช โช'},
{'-โบ  ุงุฐุงุนู ุนุงู โช','-โบ  ุงุฐุงุนู ุฎุงุต โช'},
{'-โบ  ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู โช','-โบ  ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู โช'},
{'~ ุชุนููู ููุงูุด ุงูุงูุงูุฑ ~'},
{'ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู','ุชูุนูู ุงูุจูุช ุงูุฎุฏูู'},
{'ุฌูุจ ูุณุฎู ุงูุณูุฑุณ','ุชุญุฏูุซ ุงูุณูุฑุณ','ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช'},
{'-โบ  ุญุฐู ุฑุฏ ุนุงู โช','-โบ  ุงูุฑุฏูุฏ ุงูุนุงู โช','-โบ  ุงุถู ุฑุฏ ุนุงู โช'},
{'-โบ  ุญุฐู ุฑุฏ ุงูุฎุงุต โช','-โบ  ุชุนููู ุฑุฏ ุงูุฎุงุต โช'},
{'ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู','ููุงุฉ ุงูุงุดุชุฑุงู','ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู'},
{'ุญุฐู ูููุดู ุงูุงุดุชุฑุงู','ูููุดู ุงูุงุดุชุฑุงู','ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ ุชุนููู ููุงูุด ุงูุงูุงูุฑ ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โน : ุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโน : ุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุชุนุฏูู ูุชุบููุฑ ููุงูุด ุณูุฑุณ ุณูุงุจ ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {
{'ุญุฐู ูููุดุฉ ุงูุงูุฏู','ุชุนููู ูููุดุฉ ุงูุงูุฏู'},
{'ุชุนููู ุงูุฑ ุงูุงูุงูุฑ'},
{'ุชุนููู ุงูุฑ ู3','ุชุนููู ุงูุฑ ู2','ุชุนููู ุงูุฑ ู1'},
{'ุชุนููู ุงูุฑ ู6','ุชุนููู ุงูุฑ ู5','ุชุนููู ุงูุฑ ู4'},
{'ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ'},
{'ุฑุฌูุน ุ๐โ'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAli:get(LaUrEn..'Ali:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="โช ุงููุทูุฑ .",url="t.me/"..(dp.username_ or "iinzzz")}}}
local start = DevAli:get(LaUrEn.."Ali:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "โน : ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโน : ุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nโน : ูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nโน : ุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ -โบ  ุชูุนูู\nโน : ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAli:setex(LaUrEn..'Ali:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source LaUrEn     --
if not SecondSudo(msg) and not DevAli:sismember(LaUrEn..'Ali:Ban:Pv',msg.sender_user_id_) and not DevAli:get(LaUrEn..'Ali:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Ali(msg.sender_user_id_, msg.id_, 1, 'โน : ุชู ุงุฑุณุงู ุฑุณุงูุชู ุงูู [ุงููุทูุฑ](t.me/'..(chat.username_ or "iinzzz")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'โน : ุชู ุงุฑุณุงู ุงูููุตู ูู -โบ  โค\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'ุญุธุฑ' or text == 'ุญุถุฑ' then
local Text = 'โน : ุงูุนุถู -โบ  ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nโน : ุชู ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAli:sadd(LaUrEn..'Ali:Ban:Pv',data.id_)  
return false  
end 
if text == 'ุงูุบุงุก ุงูุญุธุฑ' or text == 'ุงูุบุงุก ุญุธุฑ' then
local Text = 'โน : ุงูุนุถู -โบ  ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nโน : ุชู ุงูุบุงุก ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAli:srem(LaUrEn..'Ali:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู ูุงู ุจุญุธุฑ ุงูุจูุช ูุง ุชุณุชุทูุน ุงุฑุณุงู ุงูุฑุณุงุฆู ูู', 1, 'md')
return false  
end 
if text then
Dev_Ali(id_user, 0, 1, text, 1, "md")  
Text = 'โน : ุชู ุงุฑุณุงู ุงูุฑุณุงูู ุงูู -โบ  โค'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = 'โน : ุชู ุงุฑุณุงู ุงูููุตู ุงูู -โบ  โค'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = 'โน : ุชู ุงุฑุณุงู ุงูุตูุฑู ุงูู -โบ  โค'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = 'โน : ุชู ุงุฑุณุงู ุงููุชุญุฑูู ุงูู -โบ  โค'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = 'โน : ุชู ุงุฑุณุงู ุงูุจุตูู ุงูู -โบ  โค'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source LaUrEn     --
if text and DevAli:get(LaUrEn..'Ali:Start:Bots'..msg.sender_user_id_) then
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevAli:del(LaUrEn..'Ali:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAli:set(LaUrEn.."Ali:Start:Bot",text)  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevAli:del(LaUrEn..'Ali:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'ุชุนููู ุฑุฏ ุงูุฎุงุต' or text == 'ุถุน ูููุดู ุณุชุงุฑุช' or text == '-โบ  ุชุนููู ุฑุฏ ุงูุฎุงุต โช' then 
DevAli:set(LaUrEn..'Ali:Start:Bots'..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ูููุดุฉ ุงูุณุชุงุฑุช ุงูุงู', 1, 'md')
return false
end
if text == 'ุญุฐู ุฑุฏ ุงูุฎุงุต' or text == 'ุญุฐู ูููุดู ุณุชุงุฑุช' or text == '-โบ  ุญุฐู ุฑุฏ ุงูุฎุงุต โช' then 
DevAli:del(LaUrEn..'Start:Bot') 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ูููุดุฉ ุงูุณุชุงุฑุช ุจูุฌุงุญ', 1, 'md')
end
if text == 'ุฌูุจ ุฑุฏ ุงูุฎุงุต' then  
local start = DevAli:get(LaUrEn.."Ali:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "โน : ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโน : ุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nโน : ูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nโน : ุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ -โบ  ุชูุนูู\nโน : ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'ุชูุนูู ุงูุชูุงุตู' or text == '-โบ  ุชูุนูู ุงูุชูุงุตู โช' then   
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุชูุงุตู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Texting:Pv') 
end
if text == 'ุชุนุทูู ุงูุชูุงุตู' or text == '-โบ  ุชุนุทูู ุงูุชูุงุตู โช' then  
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุชูุงุตู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Texting:Pv',true) 
end
end
--     Source LaUrEn     --
if text == "ุงูุงูุนุงุจ ุงูุชุฑููููู" or text == "ุงูุงูุนุงุจ ุงูุงุญุชุฑุงููู" or text == "ุงูุงูุนุงุจ ุงููุชุทูุฑู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Gamesinline'..msg.chat_id_) then
Text =[[
*โน : ูุงุฆูู ุงูุงูุนุงุจ ุงูุชุฑููููู ุงุถุบุท ููุนุจ*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="โ Chess Game โ",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="ูุนุจุฉ ููุงุจู ุจูุฑุฏ ๐ฅ",url='https://t.me/awesomebot?game=FlappyBird'},{text="ุชุญุฏู ุงูุฑูุงุถูุงุช",url='https://t.me/gamebot?game=MathBattle'}},
{{text="ุณุจุงู ุงูุฏุฑุงุฌุงุช ๐",url='https://t.me/gamee?game=MotoFX'},{text="๐ฆ Dragon Game ๐ฆ",url='https://t.me/T4TTTTBOT?game=dragon'}},
{{text="ุณุจุงู ุณูุงุฑุงุช ๐",url='https://t.me/gamee?game=F1Racer'},{text="ูุชุดุงุจู ๐พ",url='https://t.me/gamee?game=DiamondRows'}},
{{text="ูุฑุฉ ูุฏู โฝ",url='https://t.me/gamee?game=FootballStar'}},
{{text="ูุฑู๐คนโโ",url='https://t.me/gamee?game=Hexonix'},{text="Hexonixโ",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx๐๏ธ",url='https://t.me/gamee?game=MotoFx'}},
{{text="ูุนุจุฉ 2048 ๐ฐ",url='https://t.me/awesomebot?game=g2048'},{text="Squares๐",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1โถ๏ธ",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="๐ฆ ูุนุจุฉ ุงูุชููู ๐ฆ",url='https://t.me/T4TTTTBOT?game=dragon'},{text="๐ ูุนุจุฉ ุงูุงูุนู ๐",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="๐ต Color Game ๐ด",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="๐ Rocket Game ๐",url='https://t.me/T4TTTTBOT?game=rocket'},{text="๐น ูุนุจุฉ ุงูุณูุงู ๐น",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text="ูุนุจุฉ ุงููููุฌุง",url='https://t.me/gamee?game=GravityNinja21'},{text="ูุนุจุฉ ุงููุฑุชู",url='https://t.me/gamee?game=KarateKid2'}},
{{text = ' ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน  .', url="t.me/zvzzzz"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     Source LaUrEn     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAli:incr(LaUrEn..'Ali:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAli:set(LaUrEn.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAli:get(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(LaUrEn) then 
DevAli:srem(LaUrEn.."Ali:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(DevId,"โน : ุชู ุทุฑุฏ ุงูุจูุช ูู ุงููุฌููุนู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\nโน : ุจูุงุณุทุฉ -โบ  "..Name.."\nโน : ุงุณู ุงููุฌููุนู -โบ  ["..NameChat.."]\nโน : ุงูุฏู ุงููุฌููุนู -โบ  โค \nโจ `"..msg.chat_id_.."` โฉ\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูููุช -โบ  "..os.date("%I:%M%p").."\nโน : ุงูุชุงุฑูุฎ -โบ  "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAli:incr(LaUrEn..'Ali:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAli:incr(LaUrEn..'Ali:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source LaUrEn     --
if text ==('ุชูุนูู') and not SudoBot(msg) and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:FreeBot'..LaUrEn) then
if ChatType == 'pv' then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุงุชุณุชุทูุน ุชูุนููู ููุง ูุฑุฌู ุงุถุงูุชู ูู ูุฌููุนู ุงููุง', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'ููุดุฆ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ุงุฏูู'
else 
status = 'ุนุถู'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,alii) 
local admins = alii.members_
for i=0 , #admins do
if alii.members_[i].bot_info_ == false and alii.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if alii.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAli:sadd(LaUrEn.."Ali:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAli:sadd(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAli:srem(LaUrEn.."Ali:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAli:srem(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAli:sismember(LaUrEn..'Ali:Groups',msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAli:get(LaUrEn..'Ali:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู -โบ  *'..(DevAli:get(LaUrEn..'Ali:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","โน : ุชู ุชูุนูู ุงููุฌููุนู "..dp.title_)  
DevAli:sadd(LaUrEn.."Ali:Groups",msg.chat_id_)
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAli:set(LaUrEn.."Ali:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"โน : ุชู ุชูุนูู ูุฌููุนู ุฌุฏูุฏู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\nโน : ุจูุงุณุทุฉ -โบ  "..Name.."\nโน : ูููุนู ูู ุงููุฌููุนู -โบ  "..status.."\nโน : ุงุณู ุงููุฌููุนู -โบ  ["..NameChat.."]\nโน : ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู -โบ  โจ *"..NumMem.."* โฉ\nโน : ุงูุฏู ุงููุฌููุนู -โบ  โค \nโจ `"..msg.chat_id_.."` โฉ\nโน : ุฑุงุจุท ุงููุฌููุนู -โบ  โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูููุช -โบ  "..os.date("%I:%M%p").."\nโน : ุงูุชุงุฑูุฎ -โบ  "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชูุนูู ูุฐู ุงููุฌููุนู ุจุณุจุจ ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู', 1, 'md') 
end 
end 
--     Source LaUrEn     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAli:set(LaUrEn..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source LaUrEn     --
local ReFalse = tostring(msg.chat_id_)
if not DevAli:sismember(LaUrEn.."Ali:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source LaUrEn     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAli:get(LaUrEn..'Ali:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, dp.id_)
local Text = 'โน : ุงููุง ุนุฒูุฒู -โบ  ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\nโน : ูุฌุจ ุนูููุง ุงูุชุฃูุฏ ุฃูู ูุณุช ุฑูุจูุช\nโน : ุชู ุชููุฏู ุงุถุบุท ุงูุฒุฑ ุจุงูุงุณูู ูููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงุถุบุท ููุง ููู ุชููุฏู",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevAli:get(LaUrEn.."Ali:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAli:smembers(LaUrEn.."Ali:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ุงูุตูุฑู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAli:smembers(LaUrEn.."Ali:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ุงููุชุญุฑูู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAli:smembers(LaUrEn.."Ali:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ุงูููุตู ุงูุฐู ุงุฑุณูุชู ุชู ููุนู ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessagePhoto" or msg.content_.ID == "MessageSticker" then
if DevAli:get(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_) and msg.reply_to_message_id_ == 0 then
if msg.content_.ID == "MessagePhoto" then Media = 'ุตูุฑู ุงุจุงุญูู' UrlId = msg.content_.photo_.sizes_[1].photo_.persistent_id_
elseif msg.content_.ID == "MessageSticker" then Media = 'ููุตู ุงุจุงุญู' UrlId = msg.content_.sticker_.sticker_.persistent_id_
end
HttpsMsg = https.request('https://apiali.ml/nightclub.php?Get=LaUrEn&TokenBot='..TokenBot..'&Url='..UrlId)
EndMsg = JSON.decode(HttpsMsg)
if EndMsg.Result.Info == "Indecent" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local aliname = 'โน : ุงูุนุถู -โบ  ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local aliid = 'โน : ุงูุฏูู -โบ  `'..dp.id_..'`'
local alitext = 'โน : ูุงู ุจูุดุฑ '..Media
local alitxt = 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุชุนุงูู ูุงูุดุฑููู ุงูู ูุฎุฑุจ'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,alii) 
local admins = alii.members_  
text = '\nโโโโโโ ๐ฃ โโโโโโ\n'
for i=0 , #admins do 
if not alii.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, aliname..'\n'..aliid..'\n'..alitext..text..alitxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
end
end
--     Source LaUrEn     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevAli:get(LaUrEn..'Ali:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุฑุฏ -โบ  '..msg.content_.text_..' ูููููู -โบ  '..GetGpTexts..' ุชู ุญุฐููุง',  1, "html")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAli:srem(LaUrEn..'Ali:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงููููู -โบ  '..msg.content_.text_..' ุชู ุญุฐููุง',  1, "html")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAli:get(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงููููู -โบ  '..msg.content_.text_..' ุชู ุญุฐููุง',  1, "html")
DevAli:del(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAli:get(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงููููู -โบ  '..msg.content_.text_..' ุชู ุญุฐููุง',  1, "html")
DevAli:del(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
DevAli:del(LaUrEn.."Ali:Gif:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Voice:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Audio:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Photo:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Stecker:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Video:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:File:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Text:AllRed"..msg.content_.text_)
DevAli:del(LaUrEn.."Ali:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source LaUrEn     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevAli:get(LaUrEn..'Ali:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevAli:smembers(LaUrEn..'Ali:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "ุงูุบุงุก" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : โน : ุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ -โบ  "..GetGpTexts ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevAli:sadd(LaUrEn..'Ali:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ -โบ  5 ูู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ -โบ  "..GetGpTexts ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Ali = "โน : ุชู ุญูุธ ุงูุฑุฏ ุฑูู -โบ  "..(#List+1).."\nโน : ูู ุจุงุฑุณุงู ุงูุฑุฏ ุฑูู -โบ  "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงููุงุก ูุญูุธ "..(#List+1).." ูู ุงูุฑุฏูุฏ",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="ุงูุบุงุก ูุญุฐู ุงูุชุฎุฒูู",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Ali).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevAli:sismember(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,text) then
local LaUrEnTEAM =  DevAli:smembers(LaUrEn..'Ali:Text:GpTexts'..text..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, '['..LaUrEnTEAM[math.random(#LaUrEnTEAM)]..']' , 1, 'md')  
end
end
--     Source LaUrEn     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAli:get(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'ุงูุบุงุก' then
local DelManagerRep = DevAli:get(LaUrEn..'DelManagerRep'..msg.chat_id_)
DevAli:srem(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevAli:del(LaUrEn..'Ali:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'DelManagerRep'..msg.chat_id_)
return false
end
DevAli:del(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevAli:get(LaUrEn..'Ali:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevAli:set(LaUrEn..'Ali:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAli:set(LaUrEn..'Ali:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAli:set(LaUrEn..'Ali:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAli:set(LaUrEn..'Ali:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAli:set(LaUrEn..'Ali:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAli:set(LaUrEn..'Ali:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevAli:set(LaUrEn..'Ali:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAli:set(LaUrEn..'Ali:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevAli:del(LaUrEn..'Ali:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAli:del(LaUrEn..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevAli:get(LaUrEn..'Ali:Lock:GpRed'..msg.chat_id_) then 
if DevAli:get(LaUrEn..'Ali:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn..'Ali:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAli:get(LaUrEn..'Ali:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn..'Ali:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAli:get(LaUrEn..'Ali:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn..'Ali:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAli:get(LaUrEn..'Ali:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn..'Ali:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAli:get(LaUrEn..'Ali:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn..'Ali:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAli:get(LaUrEn..'Ali:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn..'Ali:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAli:get(LaUrEn..'Ali:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn..'Ali:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevAli:get(LaUrEn..'Ali:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function LaUrEnTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevAli:get(LaUrEn..'Ali:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAli:get(LaUrEn..'Ali:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, LaUrEnTEAM)
end
end
--     Source LaUrEn     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAli:get(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'ุงูุบุงุก' then
local DelSudoRep = DevAli:get(LaUrEn..'DelSudoRep')
DevAli:del(LaUrEn.."Ali:Sudo:AllRed",DelSudoRep)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevAli:del(LaUrEn.."Ali:Add:AllText"..msg.sender_user_id_)
DevAli:del(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
DevAli:del(LaUrEn.."DelSudoRep")
return false
end
DevAli:del(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAli:get(LaUrEn.."Ali:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAli:set(LaUrEn.."Ali:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAli:set(LaUrEn.."Ali:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAli:set(LaUrEn.."Ali:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAli:set(LaUrEn.."Ali:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAli:set(LaUrEn.."Ali:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAli:set(LaUrEn.."Ali:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAli:set(LaUrEn.."Ali:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAli:set(LaUrEn.."Ali:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevAli:del(LaUrEn.."Ali:Add:AllText"..msg.sender_user_id_)
DevAli:del(LaUrEn..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAli:get(LaUrEn..'Ali:Lock:AllRed'..msg.chat_id_) then
if DevAli:get(LaUrEn.."Ali:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn.."Ali:Video:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn.."Ali:File:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn.."Ali:Voice:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn.."Ali:Audio:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn.."Ali:Photo:AllRed"..msg.content_.text_))
end
if  DevAli:get(LaUrEn.."Ali:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAli:get(LaUrEn.."Ali:Gif:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAli:get(LaUrEn.."Ali:Stecker:AllRed"..msg.content_.text_))
end
if DevAli:get(LaUrEn.."Ali:Text:AllRed"..msg.content_.text_) then
function LaUrEnTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevAli:get(LaUrEn..'Ali:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAli:get(LaUrEn.."Ali:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, LaUrEnTEAM)
end
end 
--     Source LaUrEn     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โน : ุงูุนุถู -โบ  '..GetName..' \nโน : ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุทุฑุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAli:sismember(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โน : ุงูุนุถู -โบ  '..GetName..' \nโน : ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุชููุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAli:sadd(LaUrEn..'Ali:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โน : ุงูุนุถู -โบ  '..GetName..' \nโน : ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ูุชูู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions LaUrEn --
--     Source LaUrEn     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= LaUrEn then
floods = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAli:get(LaUrEn.."Ali:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAli:setex(LaUrEn.."Ali:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source LaUrEn     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(LaUrEn) then
DevAli:set(LaUrEn..'Ali:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAli:get(LaUrEn..'Ali:PinnedMsg'..msg.chat_id_)
if pin_id and DevAli:get(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAli:get(LaUrEn..'Ali:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAli:del(LaUrEn..'Ali:viewget'..msg.sender_user_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ูุดุงูุฏุงุช ุงูููุดูุฑ ูู -โบ  ('..msg.views_..')', 1, 'md')
DevAli:del(LaUrEn..'Ali:viewget'..msg.sender_user_id_)
end
end
--     Source LaUrEn     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAli:get(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LaUrEn     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAli:get(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LaUrEn     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAli:get(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = 'โข ููุฑุช ุญุจู \nโข firstname \nโข @username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@iinzzz]'))
Dev_Ali(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevAli:get(LaUrEn.."Ali:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source LaUrEn     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAli:get(LaUrEn..'Ali:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = LaUrEn,offset_ = 0,limit_ = 1},function(extra,alii,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(LaUrEn) then 
if DevAli:sismember(LaUrEn..'Ali:Groups',msg.chat_id_) then BotText = "ููุนูู ูู ุงูุณุงุจู\nโน : ุงุฑุณู -โบ  ุงูุงูุงูุฑ ูุงุณุชูุชุน ุจุงููููุฒูุงุช" else BotText = "ูุนุทูู ูุฌุจ ุฑูุนู ูุดุฑู\nโน : ุจุนุฏ ุฐูู ูุฑุฌู ุงุฑุณุงู ุงูุฑ -โบ  ุชูุนูู\nโน : ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง" end 
if DevAli:get(LaUrEn.."Ali:Text:BotWelcome") then AliText = DevAli:get(LaUrEn.."Ali:Text:BotWelcome") else AliText = "โน : ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโน : ุญุงูุฉ ุงููุฌููุนู -โบ  "..BotText.."\nโโโโโโ ๐ฃ โโโโโโ" end 
if DevAli:get(LaUrEn.."Ali:Photo:BotWelcome") then AliPhoto = DevAli:get(LaUrEn.."Ali:Photo:BotWelcome") elseif alii.photos_[0] then AliPhoto = alii.photos_[0].sizes_[1].photo_.persistent_id_ else AliPhoto = nil end 
if AliPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AliPhoto,AliText)
else 
send(msg.chat_id_,msg.id_,AliText)
end 
end   
end
end,nil)
end
if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAli:get(LaUrEn.."Ali:Lock:Welcome"..msg.chat_id_) then
if DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = 'โข ููุฑุช ุญุจู \nโข firstname \nโข @username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@iinzzz]'))
Dev_Ali(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source LaUrEn     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LaUrEn     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LaUrEn     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAli:get(LaUrEn..'Ali:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAli:get(LaUrEn..'Ali:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAli:get(LaUrEn..'Ali:Spam:Text'..msg.chat_id_))
end
if DevAli:get(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."Ali:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "ุงูุบุงุก" then
send(msg.chat_id_,msg.id_,"โน : ุชู ุงูุบุงุก ุญูุธ ุงูุฑุงุจุท")       
DevAli:del(LaUrEn.."Ali:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAli:set(LaUrEn.."Ali:Groups:Links"..msg.chat_id_,Link)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ุงูุฑุงุจุท ุจูุฌุงุญ', 1, 'md')
DevAli:del(LaUrEn.."Ali:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source LaUrEn     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAli:get('LaUrEnTEAM:'..LaUrEn.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevAli:del('LaUrEnTEAM:'..LaUrEn..'id:user'..msg.chat_id_)  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevAli:del('LaUrEnTEAM:'..LaUrEn.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAli:del('LaUrEnTEAM:'..LaUrEn.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAli:get('LaUrEnTEAM:'..LaUrEn..'id:user'..msg.chat_id_)  
DevAli:incrby(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Ali(msg.chat_id_, msg.id_,  1, "โน : ุชู ุงุถุงูุฉ "..numadded..' ุฑุณุงูู', 1, 'md')
DevAli:del('LaUrEnTEAM:'..LaUrEn..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAli:get('LaUrEnTEAM:'..LaUrEn.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevAli:del('LaUrEnTEAM:'..LaUrEn..'ids:user'..msg.chat_id_)  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevAli:del('LaUrEnTEAM:'..LaUrEn.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAli:del('LaUrEnTEAM:'..LaUrEn.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAli:get('LaUrEnTEAM:'..LaUrEn..'ids:user'..msg.chat_id_)  
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Ali(msg.chat_id_, msg.id_,  1, "โน : ุชู ุงุถุงูุฉ "..numadded..' ููุทู', 1, 'md')
DevAli:del('LaUrEnTEAM:'..LaUrEn..'ids:user'..msg.chat_id_)  
end
end
--     Source LaUrEn     --
if text and (text:match("ุทูุฒ") or text:match("ุฏูุณ") or text:match("ุงููุฌ") or text:match("ููุฌ") or text:match("ุฏููุณ") or text:match("ุนูุฑ") or text:match("ูุณุฎุชู") or text:match("ูุณูู") or text:match("ูุณุฑุจู") or text:match("ุจูุงุน") or text:match("ุงุจู ุงูุนููุฑู") or text:match("ููููุฌ") or text:match("ูุญุจู") or text:match("ูุญุงุจ") or text:match("ุงููุญุจู") or text:match("ูุณู") or text:match("ุทูุฒู") or text:match("ูุณ ุงูู") or text:match("ุตุฑู") or text:match("ูุณ ุงุฎุชู")) then
if not DevAli:get(LaUrEn.."Ali:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ููููุน ุงููุดุงุฑ ูู ุงููุฌููุนู")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุจุง?ุฏ") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("ุฑุงุญุช?") or text:match("ุฎุณุชู") or text:match("ุจ?ุงู") or text:match("ุจูพูุดู") or text:match("ูุฑูู")) then
if DevAli:get(LaUrEn.."Ali:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ููููุน ุงูุชููู ุจุงูุบู ุงููุงุฑุณูู ููุง")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุจุง?ุฏ") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("ุฑุงุญุช?") or text:match("ุฎุณุชู") or text:match("ุจ?ุงู") or text:match("ุจูพูุดู") or text:match("ูุฑูู")) then
if DevAli:get(LaUrEn.."Ali:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("ุฎุฑู ุจุงููู") or text:match("ุฎุจุฑุจู") or text:match("ูุณุฏููุฑุจู") or text:match("ุฎุฑุจ ุจุงููู") or text:match("ุฎุฑุจ ุงููู") or text:match("ุฎุฑู ุจุฑุจู") or text:match("ุงููู ุงูููุงุฏ") or text:match("ุฎุฑู ุจูุญูุฏ") or text:match("ูุณู ุงููู") or text:match("ูุณู ุฑุจู") or text:match("ูุณุฑุจู") or text:match("ูุณุฎุชุงููู") or text:match("ูุณุฎุช ุงููู") or text:match("ุฎุฑู ุจุฏููู") or text:match("ุฎุฑูุจุฏููู") or text:match("ูุณุงููู") or text:match("ุฎุฑุจุงููู")) then
if not DevAli:get(LaUrEn.."Ali:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ููููุน ุงูููุฑ ูู ุงููุฌููุนู") 
end end
if text and (text:match("ุณูู ููุณ") or text:match("ุดูุนู") or text:match("ุงูุดูุนู") or text:match("ุงูุณูู") or text:match("ุทุงุฆูุชูู") or text:match("ุดูุนู") or text:match("ุงูุง ุณูู") or text:match("ูุณูุญู") or text:match("ูููุฏู") or text:match("ุตุงุจุฆู") or text:match("ููุญุฏ") or text:match("ุจุงูุณูู") or text:match("ุดูุนุฉ")) then
if not DevAli:get(LaUrEn.."Ali:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โน : ููููุน ุงูุชููู ุจุงูุทุงุฆููู ููุง") 
end end
--     Source LaUrEn     --
if SecondSudo(msg) then
if text == 'ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช' or text == 'ุฌูุจ ูุณุฎู ุงุญุชูุงุทูู' or text == 'ุฌูุจ ุงููุณุฎู ุงูุงุญุชูุงุทูู' then
local List = DevAli:smembers(LaUrEn..'Ali:Groups') 
local BotName = (DevAli:get(LaUrEn.."Ali:NameBot") or 'ุณูุงุจ')
local GetJson = '{"BotId": '..LaUrEn..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAli:get(LaUrEn.."Ali:Groups:Links"..v)
Welcomes = DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
AliConstructors = DevAli:smembers(LaUrEn..'Ali:AliConstructor:'..v)
Constructors = DevAli:smembers(LaUrEn..'Ali:BasicConstructor:'..v)
BasicConstructors = DevAli:smembers(LaUrEn..'Ali:Constructor:'..v)
Managers = DevAli:smembers(LaUrEn..'Ali:Managers:'..v)
Admis = DevAli:smembers(LaUrEn..'Ali:Admins:'..v)
Vips = DevAli:smembers(LaUrEn..'Ali:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AliConstructors ~= 0 then
GetJson = GetJson..'"AliConstructors":['
for k,v in pairs(AliConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..LaUrEn..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..LaUrEn..'.json', 'โน : ูุญุชูู ุงูููู ุนูู -โบ  '..#List..' ูุฌููุนู',dl_cb, nil)
io.popen('rm -rf ./'..LaUrEn..'.json')
end
if text and (text == 'ุฑูุน ุงููุณุฎู' or text == 'ุฑูุน ุงููุณุฎู ุงูุงุญุชูุงุทูู' or text == 'ุฑูุน ูุณุฎู ุงูุงุญุชูุงุทูู') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Ali( msg.chat_id_, msg.id_, 1,"โน : ููุฌุฏ ููุท ( 6 ) ุงุฎุชูุงุฑุงุช\nโน : ุงุฑุณู ุงุฎุชูุงุฑู ูุฑู ุงุฎุฑู", 1, "md")    
return false  end 
local GETNUM = DevAli:get(LaUrEn.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAli:del(LaUrEn.."SET:GAME"..msg.chat_id_)   
Dev_Ali( msg.chat_id_, msg.id_, 1,'โน : *ุงููุญูุจุณ ุจุงููุฏ ุฑูู* -โบ  '..NUM..'\nโน : *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, "md") 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAli:del(LaUrEn.."SET:GAME"..msg.chat_id_)   
Dev_Ali( msg.chat_id_, msg.id_, 1,'โน : *ุงููุญูุจุณ ุจุงููุฏ ุฑูู* -โบ  '..GETNUM..'\nโน : *ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ูุฑู ุงุฎุฑู ููุนุซูุฑ ุนูู ุงููุญูุจุณ*', 1, "md")
end
end
end
if DevAli:get(LaUrEn..'DevAli4'..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ")
DevAli:del(LaUrEn..'DevAli4'..msg.sender_user_id_)
return false  end 
DevAli:del(LaUrEn..'DevAli4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 'โน : ุงููุนุฑู ูุง ููุฌุฏ ููู ููุงุฉ')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, 'โน : ุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ุญุณุงุจุงุช ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, 'โน : ุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ูุฌููุนู ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'โน : ุงูุจูุช ุงุฏูู ูู ุงูููุงุฉ \nโน : ุชู ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nโน : ุงูุฏู ุงูููุงุฉ -โบ  '..data.id_..'\nโน : ูุนุฑู ุงูููุงุฉ -โบ  [@'..data.type_.channel_.username_..']')
DevAli:set(LaUrEn..'Ali:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'โน : ุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูู ุงูููุงุฉ')
end
return false  
end
end,nil)
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."Ali:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
DevAli:del(LaUrEn.."Ali:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
DevAli:del(LaUrEn.."Ali:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAli:set(LaUrEn.."DevText", DevText)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ูููุดุฉ ุงููุทูุฑ", 1, "md")
end
if DevAli:get(LaUrEn..'Ali:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^ุงูุบุงุก$") then 
DevAli:del(LaUrEn..'Ali:NameBot'..msg.sender_user_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ุงุณู ุงูุจูุช ', 1, 'html')
DevAli:del(LaUrEn..'Ali:NameBot'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:NameBot', text)
return false 
end
--     Source LaUrEn     --
if text == "ุงูุฑุงุจุท" then
if not DevAli:get(LaUrEn.."Ali:Lock:GpLinksinline"..msg.chat_id_) then 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_)) or DevAli:get(LaUrEn.."Private:Group:Link"..msg.chat_id_) 
if linkgpp.ok == true then 
local Text = 'โ ยฆ ๐ซ๐๐๐ ๐ฆ๐๐๐๐ โฌ โค\nโโโโโโ โช โโโโโโ\n['..ta.title_..']('..linkgpp.result..')'
keyboard = {}  
keyboard.inline_keyboard = {{{text = ta.title_, url=linkgpp.result}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/iinzzz&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else 
end 
end,nil) 
end
end
--     Source LaUrEn     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'ุจูุช' or text == 'ุจูุชุช' then 
NameBot = (DevAli:get(LaUrEn..'Ali:NameBot') or 'ุณูุงุจ')
local LaUrEnTEAM = {"ูุชููู ุจูุช ุงุณูู "..NameBot.." ๐๐ช","ุงุณูู ุงููููู "..NameBot.." ๐โฅ๏ธ","ุนูุฏู ุงุณู ุชุฑู ๐๐","ุตูุญููู "..NameBot.." ูุงูู ุจูุช ๐๐ช","ุงูุช ุงูุจูุช ูู ๐๐"} 
Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM[math.random(#LaUrEnTEAM)] , 1, 'html') 
return false
end
if text == 'ุงุณู ุงูุจูุช' or text == 'ุงูุจูุช ุดูู ุงุณูู' or text == 'ุดุณูู ุงูุจูุช' or text == 'ุงูุจูุช ุดุณูู' then
NameBot = (DevAli:get(LaUrEn..'Ali:NameBot') or 'ุณูุงุจ') 
local LaUrEnTEAM = {"ุงุณูู ุงููููู "..NameBot.." ๐โฅ๏ธ","ููุงุง ูุฑูุญูู ููุงูู "..NameBot.." ๐ปโฅ๏ธ"} 
Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM[math.random(#LaUrEnTEAM)] , 1, 'html') 
return false
end
if text and text == (DevAli:get(LaUrEn..'Ali:NameBot') or 'ุณูุงุจ') then 
NameBot = (DevAli:get(LaUrEn..'Ali:NameBot') or 'ุณูุงุจ')
local LaUrEnTEAM = {'๐ธโฅ๏ธ ููุง ููุจู ููุงู '..NameBot..' ุชูุถู','ุชุฑุฉู ูุตุฎุชูุงุง ุงุญุฌูู ุดุฑุงูุฏ ๐๐๐','ุงุทููู ูุงุญุฏุฏ ูุตูุญ '..NameBot..' ๐ปโฅ๏ธ','ุฎุจุตุชุช ุงููุฉุฉ ุดุชุฑูุฏุฏ ุนุงุงุฏ ๐คง๐๐'} 
Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM[math.random(#LaUrEnTEAM)] , 1, 'html') 
return false 
end
if text =='ููุงุทู' and ChCheck(msg) then 
if tonumber((DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูู ุชุฑุจุญ ุงู ููุทู\nโน : ุงุฑุณู -โบ  ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุนุฏุฏ ุงูููุงุท ุงูุชู ุฑุจุญุชูุง -โบ  '..(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'ุญุฐู ุฑุณุงุฆูู' and ChCheck(msg) or text ==  'ูุณุญ ุฑุณุงุฆูู' and ChCheck(msg) then DevAli:del(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ุฌููุน ุฑุณุงุฆูู', 1, 'md') end
if text ==  'ุญุฐู ููุงุทู' and ChCheck(msg) or text ==  'ูุณุญ ููุงุทู' and ChCheck(msg) then DevAli:del(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ุฌููุน ููุงุทู', 1, 'md') end
--     Source LaUrEn     --
if text == 'ุณูุงููุงุช' and ChCheck(msg) or text == 'ุงูุณูุงููุงุช' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฅฅ','๐ฅ','๐','๐','๐ฅ','๐ฅฆ','๐ฅ','๐ถ','๐ฝ','๐ฅ','๐ฅ','๐?','๐ฅ','๐','๐ฅ','๐ฅจ','๐ง','๐ฅ','๐ณ','๐ฅ','๐ฅ','๐ฅฉ','๐','๐','๐ญ','๐','๐','๐','๐ฅช','๐ฅ','๐ผ','โ๏ธ','๐ต','๐ฅค','๐ถ','๐บ','๐ป','๐','โฝ๏ธ','๐','โพ๏ธ','๐พ','๐','๐','๐ฑ','๐','๐ธ','๐ฅ','๐ฐ','๐ฎ','๐ณ','๐ฏ','๐','๐ป','๐ธ','๐บ','๐ฅ','๐น','๐ผ','๐ง','๐ค','๐ฌ','๐จ','๐ญ','๐ช','๐','๐ค','๐','๐ต','๐','๐','๐ฅ','๐ท','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฎ๐ถ','โ๏ธ','๐ก','๐ฎ','๐ก','๐ฃ','โฑ','๐ข','๐','๐','๐','๐','๐ช','๐ซ','๐ฌ','๐ญ','โฐ','๐บ','๐','โ๏ธ','๐ก'}
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅจ','๐ฅจ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฉ','๐ฅฉ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅช','๐ฅช')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐ฅค','๐ฅค')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅฅ','๐ฅฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฆ','๐ฅฆ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐ฝ','๐ฝ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐?','๐?')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โฝ๏ธ','โฝ๏ธ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โพ๏ธ','โพ๏ธ')
name = string.gsub(name,'๐พ','๐พ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฑ','๐ฑ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฐ','๐ฐ')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฏ','๐ฏ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐น','๐น')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐จ','๐จ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ท','๐ท')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฎ๐ถ','๐ฎ๐ถ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฃ','๐ฃ')
name = string.gsub(name,'โฑ','โฑ')
name = string.gsub(name,'๐ข','๐ข')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐ซ','๐ซ')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'โฐ','โฐ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
LaUrEnTEAM = 'โน : ุงูู ูุงุญุฏ ูุฏุฒ ูุฐุง ุงูุณูุงูู ูุฑุจุญ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุณูุงููุงุช ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end
if text == 'ุชุฑุชูุจ' and ChCheck(msg) or text == 'ุงูุชุฑุชูุจ' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ุณุญูุฑ','ุณูุงุฑู','ุงุณุชูุจุงู','ูููู','ุงูููู','ุจุฒููู','ูุทุจุฎ','ูุฑุณุชูุงูู','ุฏุฌุงุฌู','ูุฏุฑุณู','ุงููุงู','ุบุฑูู','ุซูุงุฌู','ูููู','ุณูููู','ุงูุนุฑุงู','ูุญุทู','ุทูุงุฑู','ุฑุงุฏุงุฑ','ููุฒู','ูุณุชุดูู','ููุฑุจุงุก','ุชูุงุญู','ุงุฎุทุจูุท','ุณูููู','ูุฑูุณุง','ุจุฑุชูุงูู','ุชูุงุญ','ูุทุฑูู','ุจุชูุชู','ููุงูู','ุดุจุงู','ุจุงุต','ุณููู','ุฐุจุงุจ','ุชููุงุฒ','ุญุงุณูุจ','ุงูุชุฑููุช','ุณุงุญู','ุฌุณุฑ'};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุณุญูุฑ','ุณ ุฑ ู ุญ')
name = string.gsub(name,'ุณูุงุฑู','ู ุฑ ุณ ู ุง')
name = string.gsub(name,'ุงุณุชูุจุงู','ู ุจ ุง ุช ู ุณ ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุงูููู','ู ู ู ุง')
name = string.gsub(name,'ุจุฒููู','ุฒ ู ู ู')
name = string.gsub(name,'ูุทุจุฎ','ุฎ ุจ ุท ู')
name = string.gsub(name,'ูุฑุณุชูุงูู','ุณ ุช ุง ู ู ู ุฑ ู')
name = string.gsub(name,'ุฏุฌุงุฌู','ุฌ ุฌ ุง ุฏ ู')
name = string.gsub(name,'ูุฏุฑุณู','ู ู ุฏ ุฑ ุณ')
name = string.gsub(name,'ุงููุงู','ู ุง ู ุง ู')
name = string.gsub(name,'ุบุฑูู','ุบ ู ุฑ ู')
name = string.gsub(name,'ุซูุงุฌู','ุฌ ู ุช ู ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ุงูุนุฑุงู','ู ุน ุง ู ุฑ ุง')
name = string.gsub(name,'ูุญุทู','ู ุท ู ุญ')
name = string.gsub(name,'ุทูุงุฑู','ุฑ ุง ุท ู ู')
name = string.gsub(name,'ุฑุงุฏุงุฑ','ุฑ ุง ุฑ ุง ุฏ')
name = string.gsub(name,'ููุฒู','ู ุฒ ู ู')
name = string.gsub(name,'ูุณุชุดูู','ู ุด ุณ ู ุช ู')
name = string.gsub(name,'ููุฑุจุงุก','ุฑ ุจ ู ู ุง ุก')
name = string.gsub(name,'ุชูุงุญู','ุญ ู ุง ุช ู')
name = string.gsub(name,'ุงุฎุทุจูุท','ุท ุจ ู ุง ุฎ ุท')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ูุฑูุณุง','ู ู ุฑ ุณ ุง')
name = string.gsub(name,'ุจุฑุชูุงูู','ุฑ ุช ู ุจ ุง ู ู')
name = string.gsub(name,'ุชูุงุญ','ุญ ู ุง ุช')
name = string.gsub(name,'ูุทุฑูู','ู ุท ู ุฑ ู')
name = string.gsub(name,'ุจุชูุชู','ุจ ุช ุช ู ู')
name = string.gsub(name,'ููุงูู','ู ู ู ู ู')
name = string.gsub(name,'ุดุจุงู','ุจ ุด ุง ู')
name = string.gsub(name,'ุจุงุต','ุต ุง ุจ')
name = string.gsub(name,'ุณููู','ู ุณ ู ู')
name = string.gsub(name,'ุฐุจุงุจ','ุจ ุง ุจ ุฐ')
name = string.gsub(name,'ุชููุงุฒ','ุช ู ู ุฒ ุง')
name = string.gsub(name,'ุญุงุณูุจ','ุณ ุง ุญ ู ุจ')
name = string.gsub(name,'ุงูุชุฑููุช','ุง ุช ู ุฑ ู ู ุช')
name = string.gsub(name,'ุณุงุญู','ุญ ุง ู ุณ')
name = string.gsub(name,'ุฌุณุฑ','ุฑ ุฌ ุณ')
LaUrEnTEAM = 'โน : ุงูู ูุงุญุฏ ูุฑุชุจูุง ูุฑุจุญ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุชุฑุชูุจ ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end
if text == 'ูุญูุจุณ' and ChCheck(msg) or text == 'ุจุงุช' and ChCheck(msg) or text == 'ุงููุญูุจุณ' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAli:set(LaUrEn.."GAMES"..msg.chat_id_,Num) 
TEST = [[
โ     โ     โ     โ     โ     โ
โ     โ     โ     โ     โ     โ
๐ โนโบ ๐๐ป โนโบ ๐๐ผ โนโบ ๐๐ฝ โนโบ ๐๐พ โนโบ ๐๐ฟ

โน : ุงุฎุชุฑ ุฑูู ูุงุณุชุฎุฑุงุฌ ุงููุญูุจุณ
โน : ุงููุงุฆุฒ ูุญุตู ุนูู (5) ููุงุท
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAli:setex(LaUrEn.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'ุญุฒูุฑู' and ChCheck(msg) or text == 'ุงูุญุฒูุฑู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ุงูุฌุฑุณ','ุนูุฑุจ ุงูุณุงุนู','ุงูุณูู','ุงููุทุฑ','5','ุงููุชุงุจ','ุงูุจุณูุงุฑ','7','ุงููุนุจู','ุจูุช ุงูุดุนุฑ','ููุงูู','ุงูุง','ุงูู','ุงูุงุจุฑู','ุงูุณุงุนู','22','ุบูุท','ูู ุงูุณุงุนู','ุงูุจูุชูุฌุงู','ุงูุจูุถ','ุงููุฑุงูู','ุงูุถูุก','ุงูููุงุก','ุงูุถู','ุงูุนูุฑ','ุงูููู','ุงููุดุท','ุงูุญูุฑู','ุงูุจุญุฑ','ุงูุซูุฌ','ุงูุงุณููุฌ','ุงูุตูุช','ุจูู'};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูุฌุฑุณ','ุดูุฆ ุงุฐุง ููุณุชู ุตุฑุฎ ูุง ููู ุ')
name = string.gsub(name,'ุนูุฑุจ ุงูุณุงุนู','ุงุฎูุงู ูุง ูุณุชุทูุนุงู ุชูุถูู ุงูุซุฑ ูู ุฏูููู ูุนุง ููุง ููุง ุ')
name = string.gsub(name,'ุงูุณูู','ูุง ูู ุงูุญููุงู ุงูุฐู ูู ูุตุนุฏ ุงูู ุณูููุฉ ููุญ ุนููู ุงูุณูุงู ุ')
name = string.gsub(name,'ุงููุทุฑ','ุดูุฆ ูุณูุท ุนูู ุฑุฃุณู ูู ุงูุงุนูู ููุง ูุฌุฑุญู ููุง ูู ุ')
name = string.gsub(name,'5','ูุง ุงูุนุฏุฏ ุงูุฐู ุงุฐุง ุถุฑุจุชู ุจููุณู ูุงุถูุช ุนููู 5 ูุตุจุญ ุซูุงุซูู ')
name = string.gsub(name,'ุงููุชุงุจ','ูุง ุงูุดูุฆ ุงูุฐู ูู ุงูุฑุงู ูููุณ ูู ุฌุฐูุฑ ุ')
name = string.gsub(name,'ุงูุจุณูุงุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุง ููุดู ุงูุง ุจุงูุถุฑุจ ุ')
name = string.gsub(name,'7','ุนุงุฆูู ูุคููู ูู 6 ุจูุงุช ูุงุฎ ููู ูููู .ููู ุนุฏุฏ ุงูุฑุงุฏ ุงูุนุงุฆูู ')
name = string.gsub(name,'ุงููุนุจู','ูุง ูู ุงูุดูุฆ ุงูููุฌูุฏ ูุณุท ููุฉ ุ')
name = string.gsub(name,'ุจูุช ุงูุดุนุฑ','ูุง ูู ุงูุจูุช ุงูุฐู ููุณ ููู ุงุจูุงุจ ููุง ููุงูุฐ ุ ')
name = string.gsub(name,'ููุงูู','ูุญุฏู ุญููู ููุบุฑูุฑู ุชูุจุณ ููุฉ ุชููุฑู .ูู ููู ุ ')
name = string.gsub(name,'ุงูุง','ุงุจู ุงูู ูุงุจู ุงุจูู ูููุณ ุจุงุฎุชู ููุง ุจุงุฎูู ููู ูููู ุ')
name = string.gsub(name,'ุงูู','ุงุฎุช ุฎุงูู ูููุณุช ุฎุงูุชู ูู ุชููู ุ ')
name = string.gsub(name,'ุงูุงุจุฑู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููุง ุฎุทุง ุฎุทูู ููุฏ ุดูุฆุง ูู ุฐููู ุ ')
name = string.gsub(name,'ุงูุณุงุนู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููู ุงูุตุฏู ููููู ุงุฐุง ุฌุงุน ูุฐุจ ุ')
name = string.gsub(name,'22','ูู ูุฑู ููุทุจู ุนูุฑุจุง ุงูุณุงุนู ุนูู ุจุนุถููุง ูู ุงูููู ุงููุงุญุฏ ')
name = string.gsub(name,'ุบูุท','ูุง ูู ุงููููู ุงููุญูุฏู ุงูุชู ุชููุถ ุบูุท ุฏุงุฆูุง ุ ')
name = string.gsub(name,'ูู ุงูุณุงุนู','ูุง ูู ุงูุณุคุงู ุงูุฐู ุชุฎุชูู ุงุฌุงุจุชู ุฏุงุฆูุง ุ')
name = string.gsub(name,'ุงูุจูุชูุฌุงู','ุฌุณู ุงุณูุฏ ูููุจ ุงุจูุถ ูุฑุงุณ ุงุฎุธุฑ ููุง ูู ุ')
name = string.gsub(name,'ุงูุจูุถ','ูุงูู ุงูุดูุฆ ุงูุฐู ุงุณูู ุนูู ูููู ุ')
name = string.gsub(name,'ุงููุฑุงูู','ุงุฑู ูู ุดูุฆ ูู ุฏูู ุนููู ูู ุงููู ุ ')
name = string.gsub(name,'ุงูุถูุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฎุชุฑู ุงูุฒุฌุงุฌ ููุง ููุณุฑู ุ')
name = string.gsub(name,'ุงูููุงุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุณูุฑ ุงูุงูู ููุง ุชุฑุงู ุ')
name = string.gsub(name,'ุงูุถู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุงุญูู ุงูููุง ุชุฐูุจ ุ ')
name = string.gsub(name,'ุงูุนูุฑ','ูุง ูู ุงูุดูุก ุงูุฐู ูููุง ุทุงู ูุตุฑ ุ ')
name = string.gsub(name,'ุงูููู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุชุจ ููุง ููุฑุฃ ุ')
name = string.gsub(name,'ุงููุดุท','ูู ุฃุณูุงู ููุง ูุนุถ ูุง ูู ุ ')
name = string.gsub(name,'ุงูุญูุฑู','ูุง ูู ุงูุดูุฆ ุงุฐุง ุฃุฎุฐูุง ููู ุงุฒุฏุงุฏ ููุจุฑ ุ')
name = string.gsub(name,'ุงูุจุญุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฑูุน ุงุซูุงู ููุง ููุฏุฑ ูุฑูุน ูุณูุงุฑ ุ')
name = string.gsub(name,'ุงูุซูุฌ','ุงูุง ุงุจู ุงููุงุก ูุงู ุชุฑูููู ูู ุงููุงุก ูุช ููู ุงูุง ุ')
name = string.gsub(name,'ุงูุงุณููุฌ','ููู ุซููุจ ููุน ุฐุงูู ุงุญูุถ ุงููุงุก ููู ุงููู ุ')
name = string.gsub(name,'ุงูุตูุช','ุงุณูุฑ ุจูุง ุฑุฌููู ููุง ุงุฏุฎู ุงูุง ุจุงูุงุฐููู ููู ุงูุง ุ')
name = string.gsub(name,'ุจูู','ุญุงูู ููุญููู ูุตู ูุงุดู ููุตู ูุจููู ููู ุงููู ุ ')
LaUrEnTEAM = 'โน : ุงูู ูุงุญุฏ ูุญููุง ูุฑุจุญ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุญุฒูุฑู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุนุงูู' and ChCheck(msg) or text == 'ูุนุงูู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ูุฑุฏ','ุฏุฌุงุฌู','ุจุทุฑูู','ุถูุฏุน','ุจููู','ูุญูู','ุฏูู','ุฌูู','ุจูุฑู','ุฏููููู','ุชูุณุงุญ','ูุฑุด','ููุฑ','ุงุฎุทุจูุท','ุณููู','ุฎูุงุด','ุงุณุฏ','ูุฃุฑ','ุฐุฆุจ','ูุฑุงุดู','ุนูุฑุจ','ุฒุฑุงูู','ูููุฐ','ุชูุงุญู','ุจุงุฐูุฌุงู'}
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum2'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ูุฑุฏ','๐')
name = string.gsub(name,'ุฏุฌุงุฌู','๐')
name = string.gsub(name,'ุจุทุฑูู','๐ง')
name = string.gsub(name,'ุถูุฏุน','๐ธ')
name = string.gsub(name,'ุจููู','๐ฆ')
name = string.gsub(name,'ูุญูู','๐')
name = string.gsub(name,'ุฏูู','๐')
name = string.gsub(name,'ุฌูู','๐ซ')
name = string.gsub(name,'ุจูุฑู','๐')
name = string.gsub(name,'ุฏููููู','๐ฌ')
name = string.gsub(name,'ุชูุณุงุญ','๐')
name = string.gsub(name,'ูุฑุด','๐ฆ')
name = string.gsub(name,'ููุฑ','๐')
name = string.gsub(name,'ุงุฎุทุจูุท','๐')
name = string.gsub(name,'ุณููู','๐')
name = string.gsub(name,'ุฎูุงุด','๐ฆ')
name = string.gsub(name,'ุงุณุฏ','๐ฆ')
name = string.gsub(name,'ูุฃุฑ','๐ญ')
name = string.gsub(name,'ุฐุฆุจ','๐บ')
name = string.gsub(name,'ูุฑุงุดู','๐ฆ')
name = string.gsub(name,'ุนูุฑุจ','๐ฆ')
name = string.gsub(name,'ุฒุฑุงูู','๐ฆ')
name = string.gsub(name,'ูููุฐ','๐ฆ')
name = string.gsub(name,'ุชูุงุญู','๐')
name = string.gsub(name,'ุจุงุฐูุฌุงู','๐')
LaUrEnTEAM = 'โน : ูุง ูุนูู ูุฐุง ุงูุณูุงูู :ุ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum2'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงููุนุงูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงูุนูุณ' and ChCheck(msg) or text == 'ุนูุณ' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ุจุงู','ูููุช','ููุฒูู','ุงุณูุนู','ุงุญุจู','ููุญูู','ูุถูู','ุญุงุฑู','ูุงุตู','ุฌูู','ุณุฑูุน','ููุณู','ุทููู','ุณููู','ุถุนูู','ุดุฑูู','ุดุฌุงุน','ุฑุญุช','ุนุฏู','ูุดูุท','ุดุจุนุงู','ููุนุทุดุงู','ุฎูุด ููุฏ','ุงูู','ูุงุฏุฆ'}
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum3'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุจุงู','ููู')
name = string.gsub(name,'ูููุช','ูุงูููุช')
name = string.gsub(name,'ููุฒูู','ุฒูู')
name = string.gsub(name,'ุงุณูุนู','ูุงุณูุนู')
name = string.gsub(name,'ุงุญุจู','ูุงุญุจู')
name = string.gsub(name,'ูุญูู','ุญูู')
name = string.gsub(name,'ูุถูู','ูุตุฎ')
name = string.gsub(name,'ุญุงุฑู','ุจุงุฑุฏู')
name = string.gsub(name,'ูุงุตู','ุนุงูู')
name = string.gsub(name,'ุฌูู','ููู')
name = string.gsub(name,'ุณุฑูุน','ุจุทูุก')
name = string.gsub(name,'ููุณู','ุถูุฌู')
name = string.gsub(name,'ุทููู','ูุฒู')
name = string.gsub(name,'ุณููู','ุถุนูู')
name = string.gsub(name,'ุถุนูู','ููู')
name = string.gsub(name,'ุดุฑูู','ููุงุฏ')
name = string.gsub(name,'ุดุฌุงุน','ุฌุจุงู')
name = string.gsub(name,'ุฑุญุช','ุงุฌูุช')
name = string.gsub(name,'ุญู','ููุช')
name = string.gsub(name,'ูุดูุท','ูุณูู')
name = string.gsub(name,'ุดุจุนุงู','ุฌูุนุงู')
name = string.gsub(name,'ููุนุทุดุงู','ุนุทุดุงู')
name = string.gsub(name,'ุฎูุด ููุฏ','ููุฎูุด ููุฏ')
name = string.gsub(name,'ุงูู','ูุทู')
name = string.gsub(name,'ูุงุฏุฆ','ุนุตุจู')
LaUrEnTEAM = 'โน : ูุง ูู ุนูุณ ูููุฉ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum3'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงูุนูุณ ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุฎุชูู' and ChCheck(msg) or text == 'ูุฎุชูู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'๐ธ','โ?','๐ผ','๐','๐','๐','โญ๏ธ','๐ฅ','โ','๐ฅ','โ๏ธ','๐จโ๐ฌ','๐จโ๐ป','๐จโ๐ง','๐ฉโ๐ณ','๐งโโ','๐งโโ๏ธ','๐งโโ','๐โโ','๐งโโ','๐ฌ','๐จโ๐จโ๐ง','๐','๐ค','โ๏ธ','๐','๐ฉโโ๏ธ','๐จโ๐จ'};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum4'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐ธ','๐น๐น๐น๐ธ๐น๐น๐น๐น')
name = string.gsub(name,'โ?๏ธ','๐๐๐โ?๏ธ๐๐๐๐')
name = string.gsub(name,'๐ผ','๐ป๐ป๐ป๐ป๐ป๐ป๐ป๐ผ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'โญ๏ธ','๐๐๐๐๐๐โญ๏ธ๐')
name = string.gsub(name,'๐ฅ','๐ซ๐ซ๐ซ๐ฅ๐ซ๐ซ๐ซ๐ซ')
name = string.gsub(name,'โ','๐จ๐จ๐จโ๐จ๐จ๐จ๐จ')
name = string.gsub(name,'๐ฅ','โ๏ธโ๏ธโ๏ธ๐ฅโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'โ๏ธ','โ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'๐จโ๐ฌ','๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐จโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ')
name = string.gsub(name,'๐จโ๐ป','๐ฉโ๐ป๐ฉโ๐ป๐จโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป')
name = string.gsub(name,'๐จโ๐ง','๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐จโ๐ง๐ฉโ๐ง')
name = string.gsub(name,'๐ฉโ๐ณ','๐จโ๐ณ๐จโ๐ณ๐ฉโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐โโ๏ธ','๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐ฌ','๐ญ๐ญ๐ญ๐ญ๐ฌ๐ญ๐ญ๐ญ')
name = string.gsub(name,'๐จโ๐จโ๐ง','๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ง๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ค','๐ฅ๐ฅ๐ฅ๐ฅ๐ฅ๐ค๐ฅ๐ฅ')
name = string.gsub(name,'โ๏ธ','โณโณโณโณโณโ๏ธโณโณ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ฉโโ๏ธ','๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐ฉโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ')
name = string.gsub(name,'๐จโ๐จ','๐ฉโ๐จ๐ฉโ๐จ๐จโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ')
LaUrEnTEAM = 'โน : ุงูู ูุงุญุฏ ูุทูุน ุงููุฎุชูู ูุฑุจุญ\n{'..name..'} '
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum4'..msg.chat_id_) and not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงููุฎุชูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุซูู' and ChCheck(msg) or text == 'ุงูุงูุซูู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {
'ุฌูุฒ','ุถุฑุงุทู','ุงูุญุจู','ุงูุญุงูู','ุดูุฑู','ุจูุฏู','ุณูุงูู','ุงููุฎูู','ุงูุฎูู','ุญุฏุงุฏ','ุงููุจูู','ูุฑูุต','ูุฑุฏ','ุงูุนูุจ','ุงูุนูู','ุงูุฎุจุฒ','ุจุงูุญุตุงุฏ','ุดูุฑ','ุดูู','ููุญูู',
};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum5'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฌูุฒ','ููุทู ___ ูููุงุนูุฏู ุณููู')
name = string.gsub(name,'ุถุฑุงุทู','ุงูู ูุณูู ุงููุทู ูุชุญูู ___ ')
name = string.gsub(name,'ุจูุฏู','ุงูู ___ ูุญุฏ ูููุฏู')
name = string.gsub(name,'ุงูุญุงูู','ุชุฌุฏู ูู ___ ูุนุงู')
name = string.gsub(name,'ุดูุฑู','ูุน ุงูุฎูู ูุง ___ ')
name = string.gsub(name,'ุงููุฎูู','ุงูุทูู ุทูู ___ ูุงูุนูู ุนูู ุงูุตุฎูุฉ')
name = string.gsub(name,'ุณูุงูู','ุจุงููุฌู ุงูุฑุงูุฉ ูุจุงูุธูุฑ ___ ')
name = string.gsub(name,'ุงูุฎูู','ูู ููุฉ ___ ุดุฏู ุนูู ุงูฺูุงุจ ุณุฑูุฌ')
name = string.gsub(name,'ุญุฏุงุฏ','ูููู ูู ุตุฎู ูุฌูู ูุงู ุขูู ___ ')
name = string.gsub(name,'ุงููุจูู',' ___ ูุง ูุฎุงู ูู ุงููุทุฑ')
name = string.gsub(name,'ุงูุญุจู','ุงููู ุชูุฏุบุฉ ุงูุญูุฉ ูุฎุงู ูู ุฌุฑุฉ ___ ')
name = string.gsub(name,'ูุฑูุต','ุงููุงูุนุฑู ___ ูููู ุงููุงุน ุนูุฌู')
name = string.gsub(name,'ุงูุนูุจ','ุงููุงูููุญ ___ ูููู ุญุงูุถ')
name = string.gsub(name,'ุงูุนูู','___ ุฅุฐุง ุญุจุช ุงูฺูุฉ ุงุจููุณ ูุฏุฎู ุงูุฌูุฉ')
name = string.gsub(name,'ุงูุฎุจุฒ','ุงูุทู ___ ููุฎุจุงุฒ ุญุชู ูู ูุงูู ูุตู')
name = string.gsub(name,'ุจุงูุญุตุงุฏ','ุงุณูุฉ ___ ูููุฌูู ููุณูุฑ')
name = string.gsub(name,'ุดูุฑ','ุงูุดู ___ ููุง ุชุนุจุฑ ููุฑ')
name = string.gsub(name,'ุดูู','ูุงูู ุชุนุจ ูุงูู ___ ูุง ูู ุนูู ุงูุญุงุถุฑ ููุฉ')
name = string.gsub(name,'ุงููุฑุฏ',' ___ ุจุนูู ุงูู ุบุฒุงู')
name = string.gsub(name,'ููุญูู','ุงุฌู ___ ุนูุงูุง')
LaUrEnTEAM = 'โน : ุงููู ุงููุซุงู ุงูุชุงูู -โบ  ['..name..']'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum5'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAli:del(LaUrEn..'Ali:GameNum5'..msg.chat_id_)
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงูุซูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุฑูุงุถูุงุช' and ChCheck(msg) or text == 'ุงูุฑูุงุถูุงุช' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum6'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 รท 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 รท 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
LaUrEnTEAM = 'โน : ุงููู ุงููุนุงุฏูู ุงูุชุงููู -โบ  โค\n{'..name..'} '
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum6'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAli:del(LaUrEn..'Ali:GameNum6'..msg.chat_id_)
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุฑูุงุถูุงุช ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุงููููุฒู' and ChCheck(msg) or text == 'ุงูุงูุฌููุฒูู' and ChCheck(msg) or text == 'ุงููููุฒูู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ูุนูููุงุช','ูููุงุช','ูุฌููุนุงุช','ูุชุงุจ','ุชูุงุญู','ุณุฏูู','ูููุฏ','ุงุนูู','ุฐุฆุจ','ุชูุณุงุญ','ุฐูู','ุดุงุทุฆ','ุบุจู',};
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum7'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฐุฆุจ','Wolf')
name = string.gsub(name,'ูุนูููุงุช','Information')
name = string.gsub(name,'ูููุงุช','Channels')
name = string.gsub(name,'ูุฌููุนุงุช','Groups')
name = string.gsub(name,'ูุชุงุจ','Book')
name = string.gsub(name,'ุชูุงุญู','Apple')
name = string.gsub(name,'ูููุฏ','money')
name = string.gsub(name,'ุงุนูู','I know')
name = string.gsub(name,'ุชูุณุงุญ','crocodile')
name = string.gsub(name,'ุดุงุทุฆ','Beach')
name = string.gsub(name,'ุบุจู','Stupid')
name = string.gsub(name,'ุตุฏุงูู','Friendchip')
LaUrEnTEAM = 'โน : ูุง ูุนูู ูููุฉ -โบ  '..name
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum7'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAli:del(LaUrEn..'Ali:GameNum7'..msg.chat_id_)
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงููููุฒูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end  
--     Source LaUrEn     --
if text == 'ุงุณุฆูู' and ChCheck(msg) or text == 'ุงุฎุชูุงุฑุงุช' and ChCheck(msg) or text == 'ุงูุงุณุฆูู' and ChCheck(msg) or text == 'ุงุณุงูู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli2 = {'ุงูููู','14','ุงููู','11','30','ุจูุชูู','ุณุชูู ุฌูุจุฑ','ุจุงุฑูุณ','10','ุงูููู','ุญุฑู ุงููุงู','ุงูุดุนุฑ','ุณุญุงุจ','ุงูุงุณู','ุฐูุจ','ุญุฑู ุงูุงู','ุงูุนุฒุงุฆู','ุงูุณุงุช','ุงูููุฌููู','ุงุณูุง','6','ุงูุงุณุฏ','ููุฑ','ุงูุฏููููู','ุงูุฑูุจุง','ุงูุฒุฆุจู','ููุฏู','ุงูุงูุณุงู','ุทูููู','ุฎุฏูุฌู',}
name = DevAli2[math.random(#DevAli2)]
DevAli:set(LaUrEn..'Ali:GameNum8'..msg.chat_id_,name)
DevAli:del(LaUrEn..'Ali:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูููู','โน : ูุงูู ุงุทูู ููุฑ ูู ุงูุนุงูู ุ\n1- ุงูููู\n2- ุงููุฑุงุช\n3- ููุฑ ุงููููุบู')
name = string.gsub(name,'14','โน : ูุงุนุฏุฏ ุนุธุงู ุงููุฌู ุ\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'ุงููู','โน : ูุฑุงุณู ุจูุถุงุก ูุฌุฏุฑุงู ูุฑุฏูู ุงุฐุง ุงุบููุชู ุงุตุจุญ ุธูุงู  ููู ุงููู ุ\n1- ุงููู\n2- ุงูุงุฐู\n3- ุงูุซูุงุฌู')
name = string.gsub(name,'11','โน : ูู ุฌุฒุก ูุญุชูู ูุณูุณู ูุงุฏู ุงูุฐุฆุงุจ ุ\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','โน : ูู ุฌุฒุก ูุญุชูู ุงููุฑุงู ุงููุฑูู ุ\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'ุจูุชูู','โน : ูู ููู ุงุบูู ุฑุฆูุณ ูู ุงูุนุงูู ุ\n1- ุชุฑุงูุจ\n2- ุงูุจุงูุง\n3- ุจูุชูู')
name = string.gsub(name,'ุณุชูู ุฌูุจุฑ','โน : ูู ููู ูุคุณุณ ุดุฑูู ุงุจู ุงูุนุงูููู  ุ\n1- ูุงุฑู ุจุงูุฌ\n2- ุจูู ุฌูุชุณ\n3- ุณุชูู ุฌูุจุฑ')
name = string.gsub(name,'ุจุงุฑูุณ','ูุงูู ุนุงุตูู ูุฑูุณุง ุ\n1- ุจุงุฑูุณ\n2- ูููู\n3- ููุณูู')
name = string.gsub(name,'10','โน : ูุงุนุฏุฏ ุฏูู ุงูุนุฑุจูู ุงูุชู ุชูุฌุฏ ูู ุงูุฑูููุง ุ\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'ุงูููู','โน : ูุงูู ุงูุญููุงู ุงูุฐู ูุญูู 50 ููู ูุฒูู ุ\n1- ุงูููู\n2- ุงูููู\n3- ุงูุซูุฑ')
name = string.gsub(name,'ุญุฑู ุงููุงู','โน : ูุงุฐุง ููุฌุฏ ุจููู ูุจููู ุ\n1- ุงูุถู\n2- ุงูุงุฎูุงู\n3- ุญุฑู ุงููุงู')
name = string.gsub(name,'ุงูุดุนุฑ','โน : ูุงูู ุงูุดูุก ุงููุจุงุช ููุจุช ููุงูุณุงู ุจูุง ุจุฐุฑ ุ\n1- ุงูุงุถุงูุฑ\n2- ุงูุงุณูุงู\n3- ุงูุดุนุฑ')
name = string.gsub(name,'ุณุญุงุจ','โน : ูุง ูู ุงูุดููุก ุงูุฐู ูุณุชุทูุน ุงููุดู ุจุฏูู ุฃุฑุฌู ูุงูุจูุงุก ุจุฏูู ุฃุนูู ุ\n1- ุณุญุงุจ\n2- ุจุฆุฑ\n3- ููุฑ')
name = string.gsub(name,'ุงูุงุณู','โน : ูุง ุงูุดูุก ุงูุฐู ููุชููู , ูููู ุบูุฑูุง ูุณุชุนููู ุฃูุซุฑ ูููุง ุ\n1- ุงูุนูุฑ\n2- ุณุงุนู\n3- ุงูุงุณู')
name = string.gsub(name,'ุฐูุจ','โน : ุงุตูุฑ ุงูููู ุณุงุฑู ุนููู ุงูู ุงูููู ูุญุงุฑููู ูุฐูุฐ ุงูููู ุ\n1- ูุญุงุณ\n2- ุงููุงุณ\n3- ุฐูุจ')
name = string.gsub(name,'ุญุฑู ุงูุงู','โน : ูู ุงูููู ุซูุงุซุฉ ูููู ูู ุงูููุงุฑ ูุงุญุฏู ููุง ูู ุ\n1- ุญุฑู ุงูุจุงุก\n2- ุญุฑู ุงูุงู\n3- ุญุฑู ุงูุฑุงุก')
name = string.gsub(name,'ุงูุนุฒุงุฆู','โน : ุนูู ูุฏุฑ ุงุตู ุงูุนุฒู ุชุฃุชู ุ\n1- ุงูุนุฒุงุฆู\n2- ุงูููุงุฑู\n3- ุงููุจุงุฆุจ')
name = string.gsub(name,'ุงูุณุงุช','โน : ูุงูู ุฌูุน ูููู ุงูุณู ุ\n1- ุณูุฏุงุช\n2- ุงูุณุงุช\n3- ููุงูุต')
name = string.gsub(name,'ุงูููุฌููู','โน : ุงูู ุงุชุณุนููุช ูุฏููุง ูู ุงูุญุฑูุจ ุ\n1- ุงูุตุงุฑูุฎ\n2- ุงููุณุฏุณ\n3- ุงูููุฌููู')
name = string.gsub(name,'ุงุณูุง','โน : ุชูุน ูุจูุงู ูู ูุงุฑู ุ\n1- ุงูุฑูููุง\n2- ุงุณูุง\n3- ุงูุฑููุง ุงูุดูุงููู')
name = string.gsub(name,'6','โน : ูู ุตูุฑุง ููููููู ุ\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'ุงูุงุณุฏ','โน : ูุงูู ุงูุญููุงู ุงูุฐู ูููุจ ุจููู ุงูุบุงุจู ุ\n1- ุงูููู\n2- ุงูุงุณุฏ\n3- ุงูููุฑ')
name = string.gsub(name,'ููุฑ','โน : ูุง ุงุณู ุตุบูุฑ ุงูุญุตุงู ุ\n1- ููุฑ\n2- ุฌุฑู\n3- ุนุฌู')
name = string.gsub(name,'ุงูุฏููููู','โน : ูุง ุงูุญููุงู ุงูุฐู ููุงู ูุงุญุฏู ุนููู ููุชูุญู ุ\n1- ุงููุฑุด\n2- ุงูุฏููููู\n3- ุงูุซุนูุจ\n')
name = string.gsub(name,'ุงูุฑูุจุง','โน : ูุงูู ุงููุงุฑู ุงูุชู ุชููุจ ุจุงููุงุฑู ุงูุนุฌูุฒ ุ\n1- ุงูุฑูุจุง\n2- ุงูุฑููุง ุงูุดูุงููู\n3- ุงูุฑูููุง')
name = string.gsub(name,'ุงูุฒุฆุจู','โน : ูุง ุงุณู ุงููุนุฏู ุงูููุฌูุฏ ููู ุงูุญุงูู ุงูุณุงุฆูู ุ\n1- ุงููุญุงุณ\n2- ุงูุญุฏูุฏ\n3- ุงูุฒุฆุจู')
name = string.gsub(name,'ููุฏู','โน : ูุงูู ุนุงุตูู ุงูุฌูุชุฑุง ุ\n1- ููุฏู\n2- ููุฑุณูู\n3- ุชุฑููุง')
name = string.gsub(name,'ุงูุงูุณุงู','โน : ูุงูู ุงูุดุฆ ุงูุฐู ุจุฑุฃุณู ุณุจุน ูุชุญุงุช ุ\n1- ุงููุงุชู\n2- ุงูุชููุงุฒ\n3- ุงูุงูุณุงู')
name = string.gsub(name,'ุทูููู','โน : ูุงูู ุนุงุตูู ุงููุงุจุงู ุ\n1- ุจุงูููู\n2- ููู ุฏููู\n3- ุทูููู')
name = string.gsub(name,'ุฎุฏูุฌู','โน : ูู ูู ุฒูุฌู ุงูุฑุณูู ุงูุงูุจุฑ ููู ุณูุข ุ\n1- ุญูุถู\n2- ุฒููุจ\n3- ุฎุฏูุฌู')
LaUrEnTEAM = name..'\nโน : ุงุฑุณู ุงูุฌูุงุจ ุงูุตุญูุญ ููุท'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
return false
end end
if text == DevAli:get(LaUrEn..'Ali:GameNum8'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Games:Ids'..msg.chat_id_) then 
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAli:del(LaUrEn..'Ali:GameNum8'..msg.chat_id_)
LaUrEnTEAM = 'โน : ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโน : ุงุฑุณู -โบ  ุงูุงุณุฆูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md')
end
DevAli:set(LaUrEn..'Ali:Games:Ids'..msg.chat_id_,true)
end  
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Ali(msg.chat_id_, msg.id_, 1,"โน : ุนุฐุฑุง ูุง ููููู ุชุฎููู ุนุฏุฏ ุงูุจุฑ ูู ุงูู20 ุฎูู ุฑูู ูุง ุจูู ุงูู1 ูุงูู20", 1, 'md')
return false  end 
local GETNUM = DevAli:get(LaUrEn.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAli:del(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAli:del(LaUrEn.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : *ุงูุชุฎููู ุงูุตุญูุญ ูู* -โบ  '..NUM..'\nโน : *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAli:incrby(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAli:get(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAli:del(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAli:del(LaUrEn.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : *ุงูุชุฎููู ุงูุตุญูุญ ูู* -โบ  '..GETNUM..'\nโน : *ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ูุฑู ุงุฎุฑู ูุชุฎููู ุงูุฑูู ุงูุตุญูุญ*', 1, 'md')
else
if tonumber(DevAli:get(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'ูุญุงููุชุงู ููุท'
elseif tonumber(DevAli:get(LaUrEn..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'ูุญุงููู ูุงุญุฏู ููุท'
end
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุฏ ุฎููุช ุงูุฑูู ุงูุฎุทุง ูุชุจูู ูุฏูู '..SetNum..' ุงุฑุณู ุฑูู ุชุฎููู ูุฑู ุงุฎุฑู ููููุฒ', 1, 'md')
end
end
end
end
if text == 'ุฎูู' and ChCheck(msg) or text == 'ุชุฎููู' and ChCheck(msg) then   
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAli:set(LaUrEn.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงููุง ุจู ุนุฒูุฒู ูู ูุนุจุฉ ุงูุชุฎููู -โบ  โค\n โโโโโโ ๐ฃ โโโโโโ\nโน : ุณูุชู ุชุฎููู ุนุฏุฏ ูุง ุจูู ุงูู1 ูุงูู20 ุงุฐุง ุชุนุชูุฏ ุงูู ุชุณุชุทูุน ุงูููุฒ ุฌุฑุจ ูุงููุนุจ ุงูุงู .\nโน : ููุงุญุธู ูุฏูู ุซูุงุซ ูุญุงููุงุช ููุท ููุฑ ูุจู ุงุฑุณุงู ุชุฎูููู !', 1, 'md')
DevAli:setex(LaUrEn.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source LaUrEn     --
if text == 'ุฑูููุช' then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
DevAli:del(LaUrEn.."Ali:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAli:del(LaUrEn..'Ali:ListRolet'..msg.chat_id_)  
DevAli:setex(LaUrEn.."Ali:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุญุณูุง ูููุนุจ , ุงุฑุณู ุนุฏุฏ ุงููุงุนุจูู ููุฑูููุช .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAli:get(LaUrEn.."Ali:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "โน : ูุง ุงุณุชุทูุน ุจุฏุก ุงููุนุจู ุจูุงุนุจ ูุงุญุฏ ููุท"
else
DevAli:set(LaUrEn.."Ali:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = 'โน : ุชู ุจุฏุก ุชุณุฌูู ุงููุณุชู ูุฑุฌู ุงุฑุณุงู ุงููุนุฑูุงุช \nโน : ุงููุงุฆุฒ ูุญุตู ุนูู 5 ููุงุท ุนุฏุฏ ุงููุทููุจูู -โบ  '..text..' ูุงุนุจ'
end
DevAli:del(LaUrEn.."Ali:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAli:get(LaUrEn.."Ali:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAli:sismember(LaUrEn..'Ali:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'โน : ุงููุนุฑู -โบ  ['..text..'] ููุฌูุฏ ุงุณุงุณุง')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงููุนุฑู ุบูุฑ ุตุญูุญ ูุฑุฌู ุงุฑุณุงู ูุนุฑู ุตุญูุญ', 1, 'md')
return false 
end
DevAli:sadd(LaUrEn..'Ali:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAli:get(LaUrEn.."Ali:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAli:scard(LaUrEn..'Ali:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAli:del(LaUrEn.."Ali:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAli:setex(LaUrEn.."Ali:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "โน : ุชู ุงุฏุฎุงู ุงููุนุฑู -โบ  ["..text.."]\nโน : ูุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/YesRolet"},{text="ูุง",callback_data="/NoRolet"}},{{text="ุงููุงุนุจูู",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "โน : ุชู ุงุฏุฎุงู ุงููุนุฑู -โบ  ["..text.."] ูุชุจูู -โบ  "..CountUser.." ูุงุนุจูู ูููุชูู ุงูุนุฏุฏ ุงุฑุณู ุงููุนุฑู ุงูุงุฎุฑ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุบุงุก",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source LaUrEn     --
if text == 'ูุช ุชููุช' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
local LaUrEnTEAM = {
'ุขุฎุฑ ูุฑุฉ ุฒุฑุช ูุฏููุฉ ุงูููุงููุ','ุขุฎุฑ ูุฑุฉ ุฃููุช ุฃููุชู ุงูููุถููุฉุ','ุงููุถุน ุงูุญุงููุ\nโ1. ุณูุฑุงู\nโ2. ุถุงูุฌ\nโ3. ุฃุชุฃูู','ุขุฎุฑ ุดูุก ุถุงุน ูููุ','ูููุฉ ุฃุฎูุฑุฉ ูุดุงุบู ุงูุจุงูุ','ุทุฑููุชู ุงููุนุชุงุฏุฉ ูู ุงูุชุฎููุต ูู ุงูุทุงูุฉ ุงูุณูุจูุฉุ','ุดูุฑ ูู ุฃุดูุฑ ุงูุนุงู ูู ุฐูุฑู ุฌูููุฉ ูุนูุ','ูููุฉ ุบุฑูุจุฉ ูู ููุฌุชู ููุนูุงูุงุ๐ค','โ- ุดูุก ุณูุนุชู ุนุงูู ูู ุฐููู ูุงููููููุ','ูุชู ุชูุฑู ุงูุดุฎุต ุงูุฐู ุฃูุงูู ุญุชู ูู ููุช ููู ุฃุดุฏ ูุนุฌุจูููุ','โ- ุฃุจุฑุฒ ุตูุฉ ุญุณูุฉ ูู ุตุฏููู ุงูููุฑุจุ','ูู ุชุดุนุฑ ุฃู ููุงูู ููู ููุญุจูุ','ุงุฐุง ุงูุชุดูุช ุฃู ุฃุนุฒ ุฃุตุฏูุงุฆู ูุถูุฑ ูู ุงูุณูุกุ ููููู ุงูุตุฑูุญุ','ุฃุฌูู ุดูุก ุญุตู ูุนู ุฎูุงู ูุงููููุ','ุตูู ุดุนูุฑู ูุฃูุช ุชูุญุจ ุดุฎุต ููุญุจ ุบูุฑูุ๐๐','ูููุฉ ูุดุฎุต ุบุงูู ุงุดุชูุช ุฅูููุ๐','ุขุฎุฑ ุฎุจุฑ ุณุนูุฏุ ูุชู ูุตููุ','ุฃูุง ุขุณู ุนูู ....ุ','ุฃูุตู ููุณู ุจูููุฉุ','ุตุฑูุญุ ูุดุชุงูุ','โ- ุตุฑูุญุ ูู ุณุจู ูุฎุฐูุช ุฃุญุฏูู ููู ุนู ุบูุฑ ูุตุฏุ','โ- ูุงุฐุง ุณุชุฎุชุงุฑ ูู ุงููููุงุช ูุชุนุจุฑ ููุง ุนู ุญูุงุชู ุงูุชู ุนุดุชูุง ุงูู ุงูุขูุ๐ญ','โ- ููุงู/ุฉ ุชูุฏ ูู ูุฏุนููู ุนูู ูุงุฆุฏุฉ ุนุดุงุกุ๐โค','โ- ุชุฎููู ุดูุก ูุฏ ูุญุฏุซ ูู ุงููุณุชูุจูุ','โ- ููุดุจุงุจ | ุขุฎุฑ ูุฑุฉ ูุตูู ุบุฒู ูู ูุชุงุฉุ๐','ุดุฎุต ุฃู ุตุงุญุจ ุนูุถู ููุณุงู ููุฑ ุงูุญูุงุฉ ูุง ุงุณูู ุ','| ุงุฐุง ุดูุช ุญุฏ ูุงุนุฌุจู ูุนูุฏู ุงูุฌุฑุฃู ุงูู ุชุฑูุญ ูุชุชุนุฑู ุนููู ุ ููุฏูุฉ ุงูุญุฏูุซ ุดู ุฑุงุญ ุชููู ุ.','ูู ูุฑู ุชุณุจุญ ุจุงูููู','ูุณุจุฉ ุงููุนุงุณ ุนูุฏู ุญุงูููุงุ','ูู ููุท ูุณููุญ ุดุฎุต ูุงุญุฏ ุชุชุงุจุนู ูุงูุณูุงุจ ููู ุจูููู ุ','ูููู ููุงุจุณู ุชููู ูุงุฑูุฉ ุ','ูุด ุงูุดูุก ุงูู ุชุทูุน ุญุฑุชู ููู ู ุฒุนูุช ุ','ุนูุฏู ุฃุฎูุงู ุงู ุฎูุงุช ูู ุงูุฑุถุงุนุฉุ','ุนูุฏู ูุนุฌุจูู ููุง ูุญุฏ ุฏุฑุง ุนููุ',
'ุฃุทูู ูุฏุฉ ูุถูุชูุง ุจุนูุฏ ุนู ุฃููู ุ','ูู ูุฌู ุนูุฏ ูููุงุฏู ุชุชููุน ูุฌูู ูุฏูุฉุ','ูุจุงู ุนููู ุงูุญุฒู ูู " ุตูุชู - ููุงูุญู','ููู ุชุดูู ููุณู ุจุนุฏ ุณูุชููุ','ูุด ูููููู ูู ููุง ุชุบูู ุ','ุนูุฏู ุญุณ ููุงูู ููุง ููุณูุฉุ','ููู ุชุชุตุฑู ูุน ุงูุดุฎุต ุงููุถููู ุ','ููู ูู ุฃุญูุงู ููุจูุ','ุญุงุฌุฉ ุชุดูู ููุณู ูุจุฏุน ูููุง ุ','ูุชู ุญุจูุชุ','ุดูุก ูู ู ุชุฐูุฑุชู ุชุจุชุณู ...','ุงูุนูุงูู ุงูุณุฑูู ุฏุงููุงู ุชููู ุญูููุ','ุตูุช ูุบูู ู ุชุญุจู','ูู ูุฌู ุนูุฏ ูููุงุฏู ุชุชููุน ูุฌูู ูุฏูุฉุ','ุงุฐุง ุงุญุฏ ุณุฃูู ุนู ุดูุก ู ุชุนุฑูู ุชููู ู ุงุนุฑู ููุง ุชุชููุณู ุ','ูุน ุงู ุถุฏ : ุงูููู ุงูุถู ุญู ูู ูุดุงูู ุงูุญูุงุฉุ','ูุณุงุญุฉ ูุงุฑุบุฉ (..............) ุงูุชุจ ุงู ุดูุก ุชุจูู','ุงุบุฑุจ ุงุณู ูุฑ ุนููู ุ','ุนูุฑู ูููุช ูููุณ ุงุญุฏ ุบูุฑ ุฌูุณูุ','ุงุฐุง ุบูุทุช ูุนุฑูุช ุงูู ุบูุทุงู ุชุญุจ ุชุนุชุฑู ููุง ุชุฌุญุฏุ','ูู ุนูุฏู ูููุณ ูุด ุงูุณูุงุฑุฉ ุงููู ุจุชุดุชุฑููุงุ','ูุด ุงุบุจู ุดูุก ุณููุชู ุ','ุดูุก ูู ุตุบุฑู ูุงุชุบูุฑ ูููุ','ูุด ููุน ุงูุฃููุงู ุงููู ุชุญุจ ุชุชุงุจุนูุ','ูุด ููุน ุงูุฃููุงู ุงููู ุชุญุจ ุชุชุงุจุนูุ','ุชุฌุงูู ุงุญุฏ ุนูู ุญุณุงุจ ูุตูุญุชู ุ','ุชุชูุจู ุงููุตูุญุฉ ูู ุงู ุดุฎุตุ','ูููู ูุงุณูู ูุนู ุงููุชุฑุฉ ูุฐู ุ','ูุชู ูุงุฒู ุชููู ูุง ุ','ุงูุซุฑ ุดูุก ุชุญุณ ุงูู ูุงุช ู ูุฌุชูุนูุงุ','ุชุคูู ุงู ูู "ุญูุจ ูู ุฃูู ูุธุฑุฉ" ููุง ูุง ุ.','ุชุคูู ุงู ูู "ุญูุจ ูู ุฃูู ูุธุฑุฉ" ููุง ูุง ุ.','ูู ุชุนุชูุฏ ุฃู ููุงูู ูู ูุฑุงูุจู ุจุดุบูุ','ุงุดูุงุก ุงุฐุง ุณููุชูุง ูุดุฎุต ุชุฏู ุนูู ุงูู ุชุญุจู ูุซูุฑ ุ','ุงุดูุงุก ุตุนุจ ุชุชูุจููุง ุจุณุฑุนู ุ','ุงูุชุจุงุณ ูุทููุ','ุฃูุซุฑ ุฌููุฉ ุฃุซุฑุช ุจู ูู ุญูุงุชูุ','ุนูุฏู ููุจูุง ูู ุดูุก ุ.',
'ุงูุซุฑ ููููู ุชุญุจูู ูุน ุจุนุถุ','ุฃุฌูู ุจูุช ุดุนุฑ ุณูุนุชู ...','ุณุจู ูุฑุงูุฏู ุดุนูุฑ ุฃูู ูู ุชุนุฏ ุชุนุฑู ููุณูุ','ุชุชููุน ููู ุงุญุฏ ุญุงูุฏ ุนููู ูููุฑูู ุ','ุฃุฌูู ุณูุฉ ูููุงุฏูุฉ ูุฑุช ุนููู ุ','ูู ูุฒุนุช/ู ูุตุฏูู/ู ููุงูู ูุงูู ุฏุฎู ูุด ุจุชุณูู/ููุ','ูุด ุชุญุณ ุงูู ุชุญุชุงุฌ ุงููุชุฑุฉ ูุงุฐู ุ','ูููู ุถุงุน ุนููุ','@ููุดู .. ุดุฎุต ุชุฎุงู ููู ุงุฐุง ุนุตุจ ...','ูููู ุนุงูู ูู ุฐููู ูุง ุชูุณุงู ููู ุฑูุนุชูุ','ุชุฎุชุงุฑ ุฃู ุชููู ุบุจู ุฃู ูุจูุญุ','ุงููููุณ ุงู ุงูุญุจ ุ','ุฃุฌูู ุจูุฏ ูู ูุงุฑุฉ ุขุณูุง ุจูุธุฑูุ','ูุง ุงูุฐู ูุดุบู ุจุงูู ูู ุงููุชุฑุฉ ุงูุญุงููุฉุ','ุงุญูุฑ ุงููุงุณ ูู ูู ...','ููู ูููู ุงูุณุนุงุฏู ุจุฑุงููุ','ุงุดูุงุก ุชูุชุฎุฑ ุงูู ู ุณููุชูุง ุ','ุชุฒุนูู ุงูุฏููุง ููุฑุถูู ุ','ูุด ุงูุญุจ ุจูุธุฑูุ','ุงูุถู ูุฏูู ูููู ุชูุงุณุจูุ','ูู ูู ุญุณุงุจู ุงูุจููู ุ','ูููุฉ ูุดุฎุต ุฃุณุนุฏู ุฑุบู ุญุฒูู ูู ูููู ูู ุงูุฃูุงู ุ','ุนูุฑู ุงูุชููุช ูู ุฃุญุฏ ุ!','ูุง ุงูุณูุก ูู ูุฐู ุงูุญูุงุฉ ุ','ุบููุฉ ุนูุฏู ูุนุงูุง ุฐูุฑูุงุช๐ต๐ป','/','ุฃูุถู ุตูุฉ ุชุญุจู ุจููุณูุ','ุงูุซุฑ ููุช ุชุญุจ ุชูุงู ููู ...','ุฃุทูู ูุฏุฉ ููุช ูููุง ูู ุณุงุนุฉุ','ุฃุตุนุจ ูุฑุงุฑ ูููู ุชุชุฎุฐู ุ','ุฃูุถู ุตูุฉ ุชุญุจู ุจููุณูุ','ุงูุซุฑ ููุช ุชุญุจ ุชูุงู ููู ...','ุฃูุช ูุญุจูุจ ุจูู ุงููุงุณุ ููุงูุฑููุ','ุฅุญุณุงุณู ูู ูุงููุญุธุฉุ','ุงุฎุฑ ุดูุก ุงููุชู ุ','ุชุดูู ุงูุบูุฑู ุงูุงููู ุงู ุญุจุ','ุงุฐูุฑ ูููู ูุงุชูุณุงู ุจุนูุฑูุ','ุงูุซุฑ ูุดุงููู ุจุณุจุจ ุ','ุงูู ูุงุชุตุญู ูู ุงูููู ููู ุชููููุ','ุขุฎุฑ ูุฑุฉ ุถุญูุช ูู ูู ููุจูุ','ูู ุงูุฌูุณูุฉ ุญุณุจ ููุงูุญู ูุด ุจุชููู ุฌูุณูุชูุ','ุงูุซุฑ ุดูุก ูุฑูุน ุถุบุทู','ุงุฐูุฑ ูููู ูุงุชูุณุงู ุจุนูุฑูุ','ูู ูุงููุง ูู  ุชูุงูู ุตูู ูุงุญุฏ ููุท ูู ุงูุทุนุงู ููุฏุฉ ุดูุฑ .',
'ููู ุชุดูู ุงูุฌูู ุฐุงุ','ุฑุฏุฉ ูุนูู ูู ูุฒุญ ูุนู ุดุฎุต ู ุชุนุฑูู ุ','ุงุญูุฑ ุงููุงุณ ูู ูู ...','ุชุญุจ ุงุจูู ููุง ุงูู','ุขุฎุฑ ูููู ูุณูุณู ูุงูุชูููู๐ฅุ','ุฃูุจุญ ุงููุจุญูู ูู ุงูุนูุงูุฉ: ุงูุบุฏุฑ ุฃู ุงูุฅููุงู๐คท๐ผุ','ูููุฉ ูุฃูุฑุจ ุดุฎุต ูููุจู๐คุ','ุญุท@ููุดู ูุดุฎุต ููููู "ุญุฑูุชู ูุงููุง ุฏุงุนู"๐ผ!','ุงุฐุง ุฌุงู ุฎุจุฑ ููุฑุญ ุงูู ูุงุญุฏ ุชุนููู ููู ููู๐๐ฝุ','ุทุจุน ูููู ูุฎููู ุชูุฑู ุดุฎุต ุญุชู ูู ููุช ุชูุญุจู๐๐ปโโ๏ธุ','ุงูุถู ุงูุงู ุงูุงุณุจูุน ุนูุฏู๐ุ','ูููููู ุงู ุงูุญูุงุฉ ุฏุฑูุณ ุ ูุงูู ุฃููู ุฏุฑุณ ุชุนููุชู ูู ุงูุญูุงุฉ๐ุ','ุชุงุฑูุฎ ูู ุชูุณุงู๐ุ','ุชุญุจ ุงูุตูู ูุงูุง ุงูุดุชุงุกโ๏ธโ๏ธุ','ุดุฎุต ุชุญุจ ุชุณุชูุฒู๐ุ','ุดูู ููุงุฏููู ูุงูุช ุตุบูุฑ (ุนูุงุฑุชู)๐ผ๐ปุ','ุนูู ููููู/ุฌ ููุง ููุจ ูุญุจู/ุฌโค๏ธุ','ุงูู ุณูุฑู ูู ููู ุฑุญ ุชูููโ๏ธุ','ูู ุนุฏุฏ ุงููู ูุนุทููู ุจููู๐นุ','ููุนูุฉ ูู ุงูุฃุดุฎุงุต ุชุชุฌูุจูู ูู ุญูุงุชูโุ','ุดุงุฑููุง ุตูุฑุฉ ุงู ููุฏูู ูู ุชุตููุฑูุ๐ธ','ูู ูู ุนุดุฑู ุชุนุทู ุญุธู๐ฉุ','ุงูุซุฑ ุจุฑูุงูุฌ ุชูุงุตู ุงุฌุชูุงุนู ุชุญุจู๐ุ','ูู ุงู ุฏููู ุงูุช๐ุ','ุงูุซุฑ ุฏููู ูุฏู ุชุณุงูุฑ ููุง๐ุ','ููููุฉ "ููุจุฑ ูููุณู" ูู ุชุคูู ุจุตุญุชูุง๐ง๐ผุ','ุชุนุชูุฏ ููู ุฃุญุฏ ูุฑุงูุจู๐ฉ๐ผโ๐ปุ','ูู ุจูุฏู ุชุบูุฑ ุงูุฒูู ุ ุชูุฏูู ููุง ุชุฑุฌุนู๐ฐุ','ูุดุฑูุจู ุงูููุถู๐นุ','โูู ุจูุตู ุขุฎุฑ ุงูุชุจุงุณ ูุณุฎุชูุ๐ญ','ูู ูุฒูู/ุฌ ุทููู/ุฌุ๐','ูู ูุงู ุนูุฑู/ุฌ ูุจู ูจ ุณููู๐ุ','ุฏููู ูุฏูุช ุงูู ุณุงูุฑุช ููุง๐ุ','ูู ูุงูู ูู ูฃ ุฃูููุงุช ุฑุงุญ ุชุชุญูู ุนุงูุณุฑูุน ุดูู ุชููู๐งโโ๏ธุ','โ- ูุณุจุฉ ุงุญุชูุงุฌู ููุนุฒูุฉ ูู 10๐ุ','ุดุฎุต ุชุญุจู ุญุธุฑู ุจุฏูู ุณุจุจ ูุงุถุญุ ุฑุฏุฉ ูุนูู๐งุ','ูุจุฏุฃ ูู ุงูุญูุงุฉ ุชุนุชูุฏ ุนููู ุฏุงุฆูุง๐ฏุ'
}  
Dev_Ali(msg.chat_id_, msg.id_, 1, ''..LaUrEnTEAM[math.random(#LaUrEnTEAM)]..'' , 1, 'md')  
return false
end
end
--     Source LaUrEn     --
if text == 'ุงูุงูุนุงุจ' and ChCheck(msg) or text == 'ุงูุนุงุจ' and ChCheck(msg) or text == 'ุงููุนุจู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1,[[
โน : ูุงุฆูุฉ ุงูุนุงุจ ุงููุฌููุนู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ูุนุจุฉ ุงูุชุฎููู -โบ  ุฎูู
โน : ูุนุจุฉ ุงูุงูุซูู -โบ  ุงูุซูู
โน : ูุนุจุฉ ุงูุนูุณ -โบ  ุงูุนูุณ
โน : ูุนุจุฉ ุงูุงุณุฆูู -โบ  ุงุณุฆูู
โน : ูุนุจุฉ ุงูุฑูููุช -โบ  ุฑูููุช
โน : ูุนุจุฉ ุงูุญุฒูุฑู -โบ  ุญุฒูุฑู
โน : ูุนุจุฉ ุงูุชุฑุชูุจ -โบ  ุชุฑุชูุจ
โน : ูุนุจุฉ ุงููุนุงูู -โบ  ูุนุงูู
โน : ูุนุจุฉ ุงูุชููุช -โบ  ูุช ุชููุช
โน : ูุนุจุฉ ุงููุฎุชูู -โบ  ุงููุฎุชูู
โน : ูุนุจุฉ ุงูุณูุงููุงุช -โบ  ุณูุงููุงุช
โน : ูุนุจุฉ ุงููุญูุจุณ -โบ  ุงููุญูุจุณ
โน : ูุนุจุฉ ุงูุฑูุงุถูุงุช -โบ  ุฑูุงุถูุงุช
โน : ูุนุจุฉ ุงูุงููููุฒูู -โบ  ุงููููุฒูู
โโโโโโ ๐ฃ โโโโโโ
โน : ููุงุทู โข ุจูุน ููุงุทู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]], 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฐุฑุง ุงูุงูุนุงุจ ูุนุทูู ูู ุงููุฌููุนู', 1, 'md')
end
end
--     Source LaUrEn     --
if text == 'ุจูุน ููุงุทู' and ChCheck(msg) then
if tonumber((DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูู ุชุฑุจุญ ุงู ููุทู\nโน : ุงุฑุณู -โบ  ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else
DevAli0 = (DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAli:incrby(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAli0)
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุชู ุจูุน '..(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' ูู ููุงุทู\nโน : ูู ููุทู ุชุณุงูู 50 ุฑุณุงูู', 'md')
DevAli:del(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source LaUrEn     --
if text == 'ุฑูุน ุงููุดุฑููู' and ChCheck(msg) or text == 'ุฑูุน ุงูุงุฏูููู' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,alii) 
local num = 0
local admins = alii.members_  
for i=0 , #admins do   
if alii.members_[i].bot_info_ == false and alii.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if alii.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAli:sadd(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ููุฌุฏ ุงุฏูููู ููุชู ุฑูุนูู\nโน : ุชู ุฑูุน ูุงูู ุงููุฌููุนู", 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุฑูุน '..num..' ูู ุงูุงุฏูููู \nโน : ุชู ุฑูุน ูุงูู ุงููุฌููุนู', 1, 'md')
end
end,nil) 
end
--     Source LaUrEn     --
if text == 'ุบุงุฏุฑ' and SudoBot(msg) then
if DevAli:get(LaUrEn.."Ali:Left:Bot"..LaUrEn) and not SecondSudo(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, "โน : ุงููุบุงุฏุฑู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false  
end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุบุงุฏุฑุฉ ุงููุฌููุนู \nโน : ุชู ุญุฐู ุฌููุน ุจูุงูุงุชูุง ', 1, 'md')
ChatLeave(msg.chat_id_, LaUrEn)
DevAli:srem(LaUrEn.."Ali:Groups",msg.chat_id_)
end
--     Source LaUrEn     --
if text ==('ูููุนู') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'ุงูููุดุฆ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ุงูุงุฏูู'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'ุนุถู'
end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุนู -โบ  '..rtpa, 1, 'md')
end,nil)
end
--     Source LaUrEn     --
if text == "ูุนูููุงุชู" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAli:get(LaUrEn..'Ali:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'ูุง ููุฌุฏ' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุณูู -โบ  โจ ['..result.first_name_..'] โฉ\nโน : ูุนุฑูู -โบ  โจ ['..username..'] โฉ\nโน : ุงูุฏูู -โบ  โจ `'..result.id_..'` โฉ\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุฌูุงุชู -โบ  โจ '..cont..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(msguser)..'\nโน : ุฑุชุจุชู -โบ  '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source LaUrEn     --
if text == "ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุบููุฑ ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุนููู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "ูุถุน ููุงุฉ ุงูุงุดุชุฑุงู" then
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAli:setex(LaUrEn..'DevAli4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, 'โน : ุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู')
end
return false  
end
if text == "ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" then  
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
if DevAli:get(LaUrEn..'Ali:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAli:get(LaUrEn.."Ali:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"โน : ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู ููุนู \nโน : ุนูู ุงูููุงุฉ -โบ  [@"..GetInfo.result.username.."]")
else
DevAli:setex(LaUrEn..'DevAli4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"โน : ูุงุชูุฌุฏ ููุงุฉ ูุชูุนูู ุงูุงุดุชุฑุงู\nโน : ุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู")
end
end
return false  
end
if text == "ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" then  
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:ChId')
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุญุฐู ููุงู ุงูุงุดุชุฑุงู" then
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:ChId')
Dev_Ali(msg.chat_id_, msg.id_, 1,"โน : ุชู ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'ุฌูุจ ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' then
if DevAli:get(LaUrEn..'Ali:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAli:get(LaUrEn.."Ali:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "โน : ููุงุฉ ุงูุงุดุชุฑุงู -โบ  [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "โน : ูุงุชูุฌุฏ ููุงุฉ ูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู")
end
return false  
end end
--     Source LaUrEn     --
if SudoBot(msg) then
if text == 'ุงุฐุงุนู ูููู ุจุงูุชูุฌูู' and tonumber(msg.reply_to_message_id_) > 0 then
function LaUrEnTEAM(extra,result,success)
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
local GpList = DevAli:smembers(LaUrEn.."Ali:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAli:smembers(LaUrEn.."Ali:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโน : โูู -โบ  โจ '..#GpList..' โฉ ูุฌููุนู \nโน : ูุงูู -โบ  โจ '..#PvList..' โฉ ูุดุชุฑู \n โ', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),LaUrEnTEAM)
end
end
--     Source LaUrEn     --
if text == "ูุดุงูุฏู ุงูููุดูุฑ" and ChCheck(msg) or text == "ูุดุงูุฏุงุช ุงูููุดูุฑ" and ChCheck(msg) or text == "ุนุฏุฏ ุงููุดุงูุฏุงุช" and ChCheck(msg) then
DevAli:set(LaUrEn..'Ali:viewget'..msg.sender_user_id_,true)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุญุณูุง ูู ุจุงุนุงุฏุฉ ุชูุฌูู ููููุดูุฑ ุงูุฐู ุชุฑูุฏูู ุญุณุงุจ ูุดุงูุฏุงุชู', 1, 'md')
end
--     Source LaUrEn     --
if text == "ุงูุณูุฑุณ" or text == "ุณูุฑุณ" then
Text = [[
Welcome To Source
[ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- ๐๐๐๐ ๐๐๐๐ โข',url="https://t.me/iinzzz"}},
{{text = '- ู๐ฅ tูuูoูฐfูe ูฐaููlูฐHูฐaููlfูiโคน -',url="t.me/RFRFF"},{text = '- ๐ง๐ช๐ฆ SNAP โข',url="https://t.me/Y22fbot"}},{{text= '๐ฅ ๐๐๐๐๐.',url="https://t.me/YIY88Y"}}
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/iinzzz&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source LaUrEn     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "ุงุทุฑุฏูู" and ChCheck(msg) or text == "ุงุฏูุฑูู" and ChCheck(msg) then
if DevAli:get(LaUrEn.."Ali:Kick:Me"..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevAli:set(LaUrEn..'yes'..msg.sender_user_id_, 'delyes')
DevAli:set(LaUrEn..'no'..msg.sender_user_id_, 'delno')
local Text = 'โน : ูู ุงูุช ูุชุฃูุฏ ูู ุงููุบุงุฏุฑู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/delyes"},{text="ูุง",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source LaUrEn     --
if text == 'ุชุนุทูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevAli:set(LaUrEn.."Ali:Kick:Me"..msg.chat_id_, true)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุฑ ุงุทุฑุฏูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevAli:del(LaUrEn.."Ali:Kick:Me"..msg.chat_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุฑ ุงุทุฑุฏูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source LaUrEn     --
if text == "ูุฒููู" and ChCheck(msg) then
if DevAli:get(LaUrEn.."Ali:Del:Me"..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevAli:set(LaUrEn..'yesdel'..msg.sender_user_id_, 'delyes')
DevAli:set(LaUrEn..'nodel'..msg.sender_user_id_, 'delno')
local Text = 'โน : ูู ุงูุช ูุชุฃูุฏ ูู ุชูุฒููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/yesdel"},{text="ูุง",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source LaUrEn     --
if text == 'ุชุนุทูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevAli:set(LaUrEn.."Ali:Del:Me"..msg.chat_id_, true)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุฑ ูุฒููู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevAli:del(LaUrEn.."Ali:Del:Me"..msg.chat_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุฑ ูุฒููู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source LaUrEn     --
if text and (text == 'ุชูุนูู ุงูุชุงู' or text == 'ุชูุนูู ุงูุชุงู ูููู' or text == 'ุชูุนูู ุชุงู ูููู') and Admin(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุฑ ุชุงู ูููู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'ุชุนุทูู ุงูุชุงู' or text == 'ุชุนุทูู ุงูุชุงู ูููู' or text == 'ุชุนุทูู ุชุงู ูููู') and Admin(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุฑ ุชุงู ูููู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "ุชุงู ูููู" and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "โน : ููููู ูุงูุฑุจุน \nโโโโโโ ๐ฃ โโโโโโ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAli:get(LaUrEn..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAli:get(LaUrEn..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source LaUrEn     --
if text and text:match("^ููููู (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(ููููู) (.*)$")}
if not DevAli:get(LaUrEn..'Ali:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "โน : "..txt[2].." \nโโโโโโ ๐ฃ โโโโโโ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAli:get(LaUrEn..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAli:get(LaUrEn..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source LaUrEn     --
if text == "ุฑุณุงุฆูู" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุนุฏุฏ ุฑุณุงุฆูู ููุง -โบ  *โจ "..user_msgs.." โฉ*", 1, 'md')
end
if text == "ุงูุชูุงุนู" and ChCheck(msg) then
local EntryNumber = (DevAli:get(LaUrEn..'Ali:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAli:get(LaUrEn..'Ali:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAli:get(LaUrEn..'Ali:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงูุถูุงู ุงูุงุนุถุงุก ุงูููู -โบ  *"..EntryNumber.."*\nโน : ูุบุงุฏุฑุฉ ุงูุงุนุถุงุก ุงูููู -โบ  *"..ExitNumber.."*\nโน : ุนุฏุฏ ุงูุฑุณุงุฆู ุงูููู -โบ  *"..MsgNumberDay.."*\nโน : ูุณุจุฉ ุงูุชูุงุนู ุงูููู -โบ  *"..math.random(40,100).."%*", 1, 'md')
end
--     Source LaUrEn     --
if text == "ูุนุฑูู" and ChCheck(msg) then
function get_username(extra,result,success)
text = 'โน : ูุนุฑูู -โบ  โจ User โฉ'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "ุงุณูู" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = 'โน : ุงุณูู -โบ  firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source LaUrEn     --
if text == "ุงููุณ" or text == "ููุณู" or text == "ุงุฑูุฏ ุจูุช ุงูููุณู" or text == "ุฏุฒูู ุจูุช ุงูููุณู" or  text == "ุฏุฒููู ุจูุช ุงูููุณู" then  Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : @Y22fbot', 1, 'md') end
if text == "ุฑุงุจุท ุญุฐู" or text == "ุฑุงุจุท ุงูุญุฐู" or text == "ุงุฑูุฏ ุฑุงุจุท ุงูุญุฐู" or  text == "ุดูุฑูู ุฑุงุจุท ุงูุญุฐู" or text == "ุงุฑูุฏ ุฑุงุจุท ุญุฐู" then local inline = {{{text="ุงุถุบุท ููุง",url="https://my.telegram.org/auth?to=delete"}}} SendInline(msg.chat_id_,'โน : ุงุถุบุท ููุญุตูู ุนูู ุงูุฑุงุจุท',nil,inline) return false end
if text == "ุจูุช ุงูุญุฐู" or text == "ุงุฑูุฏ ุจูุช ุงูุญุฐู" or text == "ุงุฑูุฏ ุจูุช ุญุฐู" or text == "ุจูุช ุญุฐู" or text == "ุจูุช ุญุฐู ุญุณุงุจุงุช" or text == "ุฑุงุญ ุงุญุฐู" then local inline = {{{text="ุงุถุบุท ููุง",url="https://my.telegram.org/auth?to=delete"}}} SendInline(msg.chat_id_,'โน : ุงุถุบุท ููุญุตูู ุนูู ุงูุจูุช',nil,inline) return false end
if text == "ุฌูุงุชู" and ChCheck(msg) or text == "ุงุถุงูุงุชู" and ChCheck(msg) then add = (tonumber(DevAli:get(LaUrEn..'Ali:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุนุฏุฏ ุฌูุงุชู ุงููุถุงูู -โบ  *โจ "..add.." โฉ* ", 1, 'md') end
if text == "ุชุนุฏููุงุชู" or text == "ุณุญูุงุชู" and ChCheck(msg) then local edit_msg = DevAli:get(LaUrEn..'Ali:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุนุฏุฏ ุชุนุฏููุงุชู -โบ  *โจ "..edit_msg.." โฉ* ", 1, 'md') end
if text == "ุงูุฏูู" and ChCheck(msg) then Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุฏูู -โบ  โจ `'..msg.sender_user_id_..'` โฉ', 1, 'md') end
if text == "ุฑุชุจุชู" and ChCheck(msg) then Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุฑุชุจุชู -โบ  '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ุงูุฏู ุงููุฌููุนู" and ChCheck(msg) then Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงูุฏู ุงููุฌููุนู -โบ  `"..msg.chat_id_.."`", 1, 'md') end
if text == 'ูุณุญ ุณุญูุงุชู' or text == 'ูุณุญ ุชุนุฏููุงุชู' or text == 'ุญุฐู ุณุญูุงุชู' or text == 'ุญุฐู ุชุนุฏููุงุชู' then DevAli:del(LaUrEn..'Ali:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ุฌููุน ุชุนุฏููุงุชู ุจูุฌุงุญ' , 1, 'md') end
if text == 'ูุณุญ ุฌูุงุชู' or text == 'ูุณุญ ุงุถุงูุงุชู' or text == 'ุญุฐู ุฌูุงุชู' or text == 'ุญุฐู ุงุถุงูุงุชู' then DevAli:del(LaUrEn..'Ali:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ุฌููุน ุฌูุงุชู ุงููุถุงูู' , 1, 'md') end
--     Source LaUrEn     --
if text and (text == 'ุงููุทูุฑ' or text == 'ูุทูุฑ' or text == '-โบ   ุงููุทูุฑ โช') and not DevAli:get(LaUrEn..'Ali:Devinline:Pv'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,result)
local msg_id = msg.id_/2097152/0.5
Text = "*โน : Dev Name โฌ * ["..result.first_name_.."](T.me/"..result.username_..")\n*โน : Dev User โฌ* [@"..result.username_.."]"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or zvzzzz}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if text == "ูุทูุฑ ุงูุณูุฑุณ" or text == "ูุทูุฑ ุงูุณูุฑุณ" or text == "ุงููุจุฑูุฌ" then 
Text = "โข *The - ู๐ฅ tูuูoูฐfูe ูฐaููlูฐHูฐaููlfูiโคน - and programmer of this source is* : [- ู๐ฅ tูuูoูฐfูe ูฐaููlูฐHูฐaููlfูiโคน -](https://t.me/RFRFF)."
keyboard = {} 
keyboard.inline_keyboard = {{{text='- ู๐ฅ tูuูoูฐfูe ูฐaููlูฐHูฐaููlfูiโคน -',url="t.me/RFRFF"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo=https://t.me/RFRFF&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source LaUrEn     --
if text and text:match('^ูููู @(.*)') and ChCheck(msg) or text and text:match('^ููููุง @(.*)') then 
if not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ูููู @(.*)') or text:match('^ููููุง @(.*)') 
function LaUrEnTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1783964439) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if DevAli:sismember(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,result.id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local LaUrEnTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md') 
local LaUrEnTEAM = { "ููู ุฌุฑุฌู @"..username.." ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ููู ูุงุดู @"..username.." ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุญุจูุจู @"..username.." ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช","ุฏูุดู ูู @"..username.." ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน @"..username.." ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช",}
Dev_Ali(msg.chat_id_, result.id_, 1,''..LaUrEnTEAM[math.random(#LaUrEnTEAM)], 1, 'html') 
else  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,LaUrEnTEAM)
end
end
--     Source LaUrEn     --
if text == ("ูููู") or text == ("ุจุนุฏ ูููู") or text == ("ูููู ุจุนุฏ") or text == ("ูู ูููู") or text == ("ููููุง") or text == ("ููููู") or text == ("ุฑุฒูู") or text == ("ุฑุฒููู") or text == ("ุฑุฒููุง") then
if not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1783964439) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if DevAli:sismember(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local LaUrEnTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md') 
local LaUrEnTEAM = {"ููู ุฌุฑุฌู ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ูุงุดู ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุฏูุดู ูู ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช","ุญุจูุจู ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช"} 
Dev_Ali(msg.chat_id_, result.id_, 1,''..LaUrEnTEAM[math.random(#LaUrEnTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("ุจูุณู") or text == ("ุจุนุฏ ุจูุณู") or text == ("ุถู ุจูุณ") or text == ("ุจูุณู ุจุนุฏ") or text == ("ุจูุณูุง") or text == ("ุจุนุฏ ุจูุณูุง") or text == ("ุถู ุจูุณ") or text == ("ุจูุณูุง ุจุนุฏ") or text == ("ุจูุณูู") then
if not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุจูุณ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Ali(msg.chat_id_, result.id_, 1, 'ููุงุญุญุญ ุงุญูุงุง ุจูุณุฉุฉ ุงููุทูุฑูู๐ป๐ฅ๐', 1, 'html')
return false
end 
local LaUrEnTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md') 
local LaUrEnTEAM = {"ููุงุญุญุญ ุงููุด ุนุงููููู๐๐ฅ๐","ุงูููููุงุงูุญุญ ุดููุนุณู๐ฅบ๐ฏ๐","ููุงุญุญุญุุกููู ุงุฐูุจ๐คค๐"} 
Dev_Ali(msg.chat_id_, result.id_, 1,''..LaUrEnTEAM[math.random(#LaUrEnTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("ุตูุญู") or text == ("ุตูุญูุง") or text == ("ุตูุญูู") or text == ("ุตูุญ") then
if not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Ali(msg.chat_id_, result.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ', 1, 'html')
return false
end 
local LaUrEnTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md') 
local LaUrEnTEAM = {"ุชุชุนุงู ุญุญุจ ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู ุฏูุตูุญูู๐๐ค"} 
Dev_Ali(msg.chat_id_, result.id_, 1,''..LaUrEnTEAM[math.random(#LaUrEnTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source LaUrEn     --
if text and text:match('^ุตูุญู @(.*)') and ChCheck(msg) or text and text:match('^ุตูุญ @(.*)') and ChCheck(msg) then 
if not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ุตูุญู @(.*)') or text:match('^ุตูุญ @(.*)') 
function LaUrEnTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ @'..username, 1, 'html') 
return false  
end  
local LaUrEnTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Ali(msg.chat_id_, msg.id_, 1,LaUrEnTEAM, 1, 'md') 
local LaUrEnTEAM = { "ุชุชุนุงู ุญุญุจ @"..username.." ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู @"..username.." ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ @"..username.." ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู @"..username.." ุฏูุตูุญูู๐๐ค",}
Dev_Ali(msg.chat_id_, result.id_, 1,''..LaUrEnTEAM[math.random(#LaUrEnTEAM)], 1, 'html') 
else  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,LaUrEnTEAM)
end
end
end
--     Source LaUrEn     --
if text == ("ุชูุฒูู ุงููู") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.sender_user_id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevAli:sismember(LaUrEn..'Ali:SudoBot:',result.sender_user_id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevAli:sismember(LaUrEn..'Ali:ManagerAll:',result.sender_user_id_) then
managerall = 'ุงููุฏุฑุงุก ุงูุนุงููู โข ' else managerall = '' end
if DevAli:sismember(LaUrEn..'Ali:AdminAll:',result.sender_user_id_) then
adminall = 'ุงูุงุฏูููู ุงูุนุงููู โข ' else adminall = '' end
if DevAli:sismember(LaUrEn..'Ali:VipAll:',result.sender_user_id_) then
vpall = 'ุงููููุฒูู ุงูุนุงููู โข ' else vpall = '' end
if DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevAli:sismember(LaUrEn..'Ali:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAli:sismember(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevAli:sismember(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAli:sismember(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAli:sismember(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู -โบ  โค\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end
if AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAli:srem(LaUrEn..'Ali:SecondSudo:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:SudoBot:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAli:srem(LaUrEn..'Ali:SudoBot:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'aliconstructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ุงููู @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(ุชูุฒูู ุงููู) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevAli:sismember(LaUrEn..'Ali:SudoBot:',result.id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevAli:sismember(LaUrEn..'Ali:ManagerAll:',result.id_) then
managerall = 'ุงููุฏุฑุงุก ุงูุนุงููู โข ' else managerall = '' end
if DevAli:sismember(LaUrEn..'Ali:AdminAll:',result.id_) then
adminall = 'ุงูุงุฏูููู ุงูุนุงููู โข ' else adminall = '' end
if DevAli:sismember(LaUrEn..'Ali:VipAll:',result.id_) then
vpall = 'ุงููููุฒูู ุงูุนุงููู โข ' else vpall = '' end
if DevAli:sismember(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevAli:sismember(LaUrEn..'Ali:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAli:sismember(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevAli:sismember(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAli:sismember(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAli:sismember(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู -โบ  โค\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","โน : ูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end 
if AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAli:srem(LaUrEn..'Ali:SecondSudo:', result.id_)
DevAli:srem(LaUrEn..'Ali:SudoBot:', result.id_)
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAli:srem(LaUrEn..'Ali:SudoBot:', result.id_)
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAli:srem(LaUrEn..'Ali:ManagerAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:AdminAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:VipAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'aliconstructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_, result.id_)
elseif AliDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, result.id_)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source LaUrEn     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('ุงุถู ูุทูุฑ ุซุงููู') or text ==('ุฑูุน ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุฑูุน ูุทูุฑ ุซุงููู (%d+)')
DevAli:sadd(LaUrEn..'Ali:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end
--     Source LaUrEn     --
--     Rem SecondSudo     --
if text ==('ุญุฐู ูุทูุฑ ุซุงููู') or text ==('ุชูุฒูู ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')
DevAli:srem(LaUrEn..'Ali:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end end
--     Source LaUrEn     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('ุงุถู ูุทูุฑ') or text ==('ุฑูุน ูุทูุฑ') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ (%d+)') or text:match('^ุฑูุน ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ (%d+)') or text:match('ุฑูุน ูุทูุฑ (%d+)')
DevAli:sadd(LaUrEn..'Ali:SudoBot:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end
--     Source LaUrEn     --
--       Rem SudoBot      --
if text ==('ุญุฐู ูุทูุฑ') or text ==('ุชูุฒูู ูุทูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ (%d+)') or text:match('ุชูุฒูู ูุทูุฑ (%d+)')
DevAli:srem(LaUrEn..'Ali:SudoBot:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end end
--     Source LaUrEn     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('ุฑูุน ูุฏูุฑ ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูุฏูุฑ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุฏูุฑ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูุฏูุฑ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุฏูุฑ ุนุงู (%d+)')
DevAli:sadd(LaUrEn..'Ali:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end
--     Source LaUrEn     --
--      Rem ManagerAll    --
if text ==('ุชูุฒูู ูุฏูุฑ ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุฏูุฑ ุนุงู (%d+)')
DevAli:srem(LaUrEn..'Ali:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end end
--     Source LaUrEn     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('ุฑูุน ุงุฏูู ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ุงุฏูู ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ุงุฏูู ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ุงุฏูู ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ุงุฏูู ุนุงู (%d+)')
DevAli:sadd(LaUrEn..'Ali:AdminAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end
--     Source LaUrEn     --
--      Rem adminall      --
if text ==('ุชูุฒูู ุงุฏูู ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ุงุฏูู ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ุงุฏูู ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ุงุฏูู ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ุงุฏูู ุนุงู (%d+)')
DevAli:srem(LaUrEn..'Ali:AdminAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end end
--     Source LaUrEn     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('ุฑูุน ูููุฒ ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูููุฒ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูููุฒ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูููุฒ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูููุฒ ุนุงู (%d+)')
DevAli:sadd(LaUrEn..'Ali:VipAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end
--     Source LaUrEn     --
--       Rem Vipall       --
if text ==('ุชูุฒูู ูููุฒ ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูููุฒ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูููุฒ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูููุฒ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูููุฒ ุนุงู (%d+)')
DevAli:srem(LaUrEn..'Ali:VipAll:',user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end end
--     Source LaUrEn     --
--   Set AliConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('ุฑูุน ูุงูู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูุงูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูุงูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุงูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูุงูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูุงูู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุงูู (%d+)')
DevAli:sadd(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูุงูู")  
end
--     Source LaUrEn     --
--   Rem AliConstructor   --
if text ==('ุชูุฒูู ูุงูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevAli:srem(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^ุชูุฒูู ูุงูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุงูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevAli:srem(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุงูู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุงูู (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevAli:srem(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
end end
--     Source LaUrEn     --
--  Set BasicConstructor  --
if AliConstructor(msg) then
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)')
DevAli:sadd(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end
--     Source LaUrEn     --
--  Rem BasicConstructor  --
if text ==('ุชูุฒูู ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)')
DevAli:srem(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end end
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and not AliConstructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูููุงูููู ูุงููุทูุฑูู ููุท', 1, 'md')
end
--     Source LaUrEn     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('ุฑูุน ููุดุฆ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ (%d+)')
DevAli:sadd(LaUrEn..'Ali:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end
--     Source LaUrEn     --
--    Rem  Constructor    --
if text ==('ุชูุฒูู ููุดุฆ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ (%d+)')
DevAli:srem(LaUrEn..'Ali:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
end
--     Source LaUrEn     --
--      Set Manager       --
if Constructor(msg) then
if text ==('ุฑูุน ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^ุฑูุน ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุฏูุฑ (%d+)')
DevAli:sadd(LaUrEn..'Ali:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end
--     Source LaUrEn     --
--       Rem Manager      --
if text ==('ุชูุฒูู ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุฏูุฑ (%d+)')
DevAli:srem(LaUrEn..'Ali:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end 
--     Source LaUrEn     --
--       Set Cleaner      --
if text ==('ุฑูุน ููุธู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:sadd(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ููุธู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุธู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุธู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุธู (%d+)')
DevAli:sadd(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
end
--     Source LaUrEn     --
--       Rem Cleaner      --
if text ==('ุชูุฒูู ููุธู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุธู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุธู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุธู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุธู (%d+)')
DevAli:srem(LaUrEn..'Ali:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
end end
--     Source LaUrEn     --
--       Set admin        --
if Manager(msg) then
if text ==('ุฑูุน ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ุงุฏูู @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ุงุฏูู (%d+)')
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end
--     Source LaUrEn     --
--        Rem admin       --
if text ==('ุชูุฒูู ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ุงุฏูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ุงุฏูู (%d+)')
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end end
--     Source LaUrEn     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('ุฑูุน ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAli:sadd(LaUrEn..'Ali:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูููุฒ @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูููุฒ (%d+)')
if not BasicConstructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAli:sadd(LaUrEn..'Ali:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end
--     Source LaUrEn     --
--       Rem Vipmem       --
if text ==('ุชูุฒูู ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูููุฒ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูููุฒ (%d+)')
DevAli:srem(LaUrEn..'Ali:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end end
--     Source LaUrEn     --
if text ==('ุฑูุน ุฑุชุจู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "โ ยฆ ุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ ยฆ ูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุฑูุน ุงูุนุถู -โบ โก\nโ ยฆ ุงูุนุถู -โบ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'iinzzz')..')'
if Sudo(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุดุฆ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="ุฑูุน ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="ุฑูุน ูุงูู",callback_data=msg.sender_user_id_..":SetAbsConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุทูุฑ",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="ุฑูุน ูุทูุฑ ุซุงููู",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif SecondSudo(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุดุฆ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="ุฑูุน ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="ุฑูุน ูุงูู",callback_data=msg.sender_user_id_..":SetAbsConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุทูุฑ",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif SudoBot(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุดุฆ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="ุฑูุน ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="ุฑูุน ูุงูู",callback_data=msg.sender_user_id_..":SetAbsConstructor:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif AbsConstructor(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุดุฆ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="ุฑูุน ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif BasicConstructor(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุดุฆ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Constructor(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="ุฑูุน ููุธู",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="ุฑูุน ูุฏูุฑ",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Manager(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="ุฑูุน ุงุฏูู",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Admin(msg) then
inline = {{{text="ุฑูุน ูููุฒ",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
end
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source LaUrEn     --
if text ==('ุชูุฒูู ุฑุชุจู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "โ ยฆ ุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ ยฆ ูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุชูุฒูู ุงูุนุถู -โบ โก\nโ ยฆ ุงูุนุถู -โบ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'iinzzz')..')'
if Sudo(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุดุฆ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="ุชูุฒูู ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="ุชูุฒูู ูุงูู",callback_data=msg.sender_user_id_..":RemAbsConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุทูุฑ",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text="ุชูุฒูู ูุทูุฑ ุซุงููู",callback_data=msg.sender_user_id_..":RemSecondSudo:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif SecondSudo(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุดุฆ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="ุชูุฒูู ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="ุชูุฒูู ูุงูู",callback_data=msg.sender_user_id_..":RemAbsConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุทูุฑ",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif SudoBot(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุดุฆ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="ุชูุฒูู ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="ุชูุฒูู ูุงูู",callback_data=msg.sender_user_id_..":RemAbsConstructor:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif AbsConstructor(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุดุฆ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="ุชูุฒูู ููุดุฆ ุงุณุงุณู",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif BasicConstructor(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุดุฆ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Constructor(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="ุชูุฒูู ููุธู",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="ุชูุฒูู ูุฏูุฑ",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Manager(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="ุชูุฒูู ุงุฏูู",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
elseif Admin(msg) then
inline = {{{text="ุชูุฒูู ูููุฒ",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_}},{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}}
end
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source LaUrEn     --
if text ==('ุชุญูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "โ ยฆ ุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ ยฆ ูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ููุชุญูู ุงูุนุถู -โบ โก\nโ ยฆ ุงูุนุถู -โบ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'iinzzz')..')'
inline = {
{{text="ุฑูุน ุฑุชุจู",callback_data=msg.sender_user_id_..":SetRtba:"..result.sender_user_id_},{text="ุชูุฒูู ุฑุชุจู",callback_data=msg.sender_user_id_..":RemRtba:"..result.sender_user_id_}},
{{text="ูุชู",callback_data=msg.sender_user_id_..":Mute:"..result.sender_user_id_},{text="ุงูุบุงุก ูุชู",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},
{{text="ุญุธุฑ",callback_data=msg.sender_user_id_..":Ban:"..result.sender_user_id_},{text="ุงูุบุงุก ุญุธุฑ",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},
{{text="ุชููุฏ",callback_data=msg.sender_user_id_..":Tked:"..result.sender_user_id_},{text="ุงูุบุงุก ุชููุฏ",callback_data=msg.sender_user_id_..":UnTked:"..result.sender_user_id_}},
{{text = 'ห ๐จ๐ฃ๐๐ฅ ๐ฉ๐๐๐ข ๐ฅก',url="t.me/iinzzz"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source LaUrEn     --
if BasicConstructor(msg) then
if text and text:match("^ุฑูุน ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LaUrEn)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูุดุฑู ูู ุงููุฌููุนู")  
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LaUrEn)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุดุฑููู ุงููุฌููุนู")  
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^ุฑูุน ุจูู ุงูุตูุงุญูุงุช$") or text:match("^ุฑูุน ุจูู ุตูุงุญูุงุช$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LaUrEn)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูุดุฑู ูู ุฌููุน ุงูุตูุงุญูุงุช")  
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")) and ChCheck(msg) then
local Ali = text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LaUrEn)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุงุถุงูุฉ -โบ  "..Ali.." ูููุจ ูู")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..Ali)
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'ููุจู' then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'โน : ููุณ ูุฏูู ููุจ ููุง') 
else
send(msg.chat_id_, msg.id_,'โน : ููุจู -โบ  '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'ููุจู' then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'โน : ููุณ ูุฏูู ููุจ ููุง') 
else
send(msg.chat_id_, msg.id_,'โน : ููุจู -โบ  '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == 'ูุจุฐุชู' or text == 'ุจุงูู' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "ุฑุงุณููู" then
LaUrEnTEAM = {"ูุง ููุงู","ุงูุทู","ููู ุญุจู","ุชูุถู"};
send(msg.sender_user_id_, 0,LaUrEnTEAM[math.random(#LaUrEnTEAM)])
end
--     Source LaUrEn     --
if text == "ุตูุงุญูุชู" or text == "ุตูุงุญูุงุชู" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('ุตูุงุญูุชู') or text ==('ุตูุงุญูุงุชู') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^ุตูุงุญูุชู (%d+)') or text:match('^ุตูุงุญูุงุชู (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('ุตูุงุญูุชู (%d+)') or text:match('ุตูุงุญูุงุชู (%d+)')
Validity(msg,ValidityId)  
end
--     Source LaUrEn     --
if text and text:match('^ุงูุญุณุงุจ (%d+)$') then
local id = text:match('^ุงูุญุณุงุจ (%d+)$')
local text = 'ุงุถุบุท ููุดุงูุฏู ุงูุญุณุงุจ'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
--     Source LaUrEn     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^ูุณุญ$") or text:match("^ุญุฐู$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ุงูุฑุณุงูู ูุน ุฑุณุงูุฉ ุงูุงูุฑ', 1, 'md')
end end end
--     Source LaUrEn     --
if Constructor(msg) then
if text == "ุชูุนูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชูุนูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevAli:del(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุทุฑุฏ ูุงูุญุธุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชุนุทูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevAli:set(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_,"true")
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชูุนูู ุงููุชู" and ChCheck(msg) or text == "ุชูุนูู ุงูุชูููุฏ" and ChCheck(msg) then
DevAli:del(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงููุชู ูุงูุชููุฏ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงููุชู" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชูููุฏ" and ChCheck(msg) then
DevAli:set(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_,"true")
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text == "ุชูุนูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชูุนูู ุงูุชุฑููู" and ChCheck(msg) then
DevAli:del(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชูุนูู ุฑูุน -โบ  ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
if text == "ุชุนุทูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชุฑููู" and ChCheck(msg) then
DevAli:set(LaUrEn.."Ali:Lock:ProSet"..msg.chat_id_,"true")
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชุนุทูู ุฑูุน -โบ  ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
end
--     Source LaUrEn     --
--          Kick          --
if Admin(msg) then
if text ==('ุทุฑุฏ') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุทุฑุฏ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^ุทุฑุฏ @(.*)') and ChCheck(msg) then
local username = text:match('^ุทุฑุฏ @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุทุฑุฏ -โบ  '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^ุทุฑุฏ (%d+)') and ChCheck(msg) then
local user = text:match('ุทุฑุฏ (%d+)')
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุทุฑุฏ -โบ  '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
end
end 
--     Source LaUrEn     --
--          Ban           --
if Admin(msg) then
if text ==('ุญุถุฑ') or text ==('ุญุธุฑ') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุญุธุฑ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAli:sadd(LaUrEn..'Ali:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุญุธุฑู ูู ุงููุฌููุนู") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุญุธุฑ -โบ  '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAli:sadd(LaUrEn..'Ali:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^ุญุถุฑ (%d+)') or text:match('^ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุถุฑ (%d+)') or text:match('ุญุธุฑ (%d+)')
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุญุธุฑ -โบ  '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โน : ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โน : ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAli:sadd(LaUrEn..'Ali:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
end
--     Source LaUrEn     --
--         UnBan          --
if text ==('ุงูุบุงุก ุงูุญุธุฑ') or text ==('ุงูุบุงุก ุญุธุฑ') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('^ุงูุบุงุก ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('ุงูุบุงุก ุญุธุฑ (%d+)')
DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","โน : ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
end 
--     Source LaUrEn     --
--          Mute          --
if Admin(msg) then
if text ==('ูุชู') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ูุชู -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAli:sadd(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ูุชูู ูู ุงููุฌููุนู")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^ูุชู @(.*)') and ChCheck(msg) then
local username = text:match('^ูุชู @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ูุชู -โบ  '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","โน : ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAli:sadd(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^ูุชู (%d+)') and ChCheck(msg) then
local user = text:match('ูุชู (%d+)')
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ูุชู -โบ  '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","โน : ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAli:sadd(LaUrEn..'Ali:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
end
--     Source LaUrEn     --
--         UnMute         --
if text ==('ุงูุบุงุก ุงููุชู') or text ==('ุงูุบุงุก ูุชู') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","โน : ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^ุงูุบุงุก ุงููุชู (%d+)') or text:match('^ุงูุบุงุก ูุชู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงููุชู (%d+)') or text:match('ุงูุบุงุก ูุชู (%d+)')
if not DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","โน : ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
end 
--     Source LaUrEn     --
--          Tkeed           --
if Admin(msg) then
if text ==('ุชูููุฏ') or text ==('ุชููุฏ') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^ุชูููุฏ (%d+)') or text:match('^ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุชูููุฏ (%d+)') or text:match('ุชููุฏ (%d+)')
if not Constructor(msg) and DevAli:get(LaUrEn.."Ali:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โน : ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
end
--     Source LaUrEn     --
--         UnTkeed          --
if text ==('ุงูุบุงุก ุชูููุฏ') or text ==('ุงูุบุงุก ุชููุฏ') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('^ุงูุบุงุก ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('ุงูุบุงุก ุชููุฏ (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
end 
end
--     Source LaUrEn     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('ุญุถุฑ ุนุงู') or text ==('ุญุธุฑ ุนุงู') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAli:sadd(LaUrEn..'Ali:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')) then
local username = text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAli:sadd(LaUrEn..'Ali:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^ุญุถุฑ ุนุงู (%d+)') or text:match('^ุญุธุฑ ุนุงู (%d+)')) then
local user = text:match('ุญุถุฑ ุนุงู (%d+)') or text:match('ุญุธุฑ ุนุงู (%d+)')
if tonumber(user) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',user) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAli:sadd(LaUrEn..'Ali:BanAll:', user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     Source LaUrEn     --
--         MuteAll        --
if text ==('ูุชู ุนุงู') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
DevAli:sadd(LaUrEn..'Ali:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^ูุชู ุนุงู @(.*)') then
local username = text:match('^ูุชู ุนุงู @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
if result.id_ then
DevAli:sadd(LaUrEn..'Ali:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^ูุชู ุนุงู (%d+)') then
local user = text:match('ูุชู ุนุงู (%d+)')
if tonumber(user) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAli:sismember(LaUrEn..'Ali:SecondSudo:',user) and not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
DevAli:sadd(LaUrEn..'Ali:MuteAll:', user)
ReplyStatus(msg,user,"Reply","โน : ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     Source LaUrEn     --
--         UnAll          --
if text ==('ุงูุบุงุก ุนุงู') or text ==('ุงูุบุงุก ุงูุนุงู') then
function UnAllReply(extra, result, success)
DevAli:srem(LaUrEn..'Ali:BanAll:', result.sender_user_id_)
DevAli:srem(LaUrEn..'Ali:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')) then
local username = text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAli:srem(LaUrEn..'Ali:BanAll:', result.id_)
DevAli:srem(LaUrEn..'Ali:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^ุงูุบุงุก ุนุงู (%d+)') or text:match('^ุงูุบุงุก ุงูุนุงู (%d+)')) then
local user = text:match('ุงูุบุงุก ุนุงู (%d+)') or text:match('ุงูุบุงุก ุงูุนุงู (%d+)')
DevAli:srem(LaUrEn..'Ali:BanAll:', user)
DevAli:srem(LaUrEn..'Ali:MuteAll:', user)
ReplyStatus(msg,user,"Reply","โน : ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end
end
end
--     Source LaUrEn     --
if (text == "ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "ููู ููููู ุงูุจูุช" or text == "ุชุบููุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "-โบ  ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โช") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'โน : ูุฌุจ ุงูุชุงูุฏ ุงู ุงููุทูุฑ ุงูุฌุฏูุฏ ุงุฑุณู start ูุฎุงุต ุงูุจูุช ุจุนุฏ ุฐูู ููููู ุงุฑุณุงู ุงูุฏู ุงููุทูุฑ')
DevAli:setex(LaUrEn.."Ali:EditDev"..msg.sender_user_id_,300,true)
end
if DevAli:get(LaUrEn.."Ali:EditDev"..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_,'โน : ุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู')
DevAli:del(LaUrEn.."Ali:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAli:del(LaUrEn.."Ali:EditDev"..msg.sender_user_id_)
DevAli:set(LaUrEn.."Ali:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\nโน : ุงููุนุฑู -โบ  [@'..dp.username_..']' else DevUser = '' end
local Text = 'โน : ุงูุงูุฏู -โบ  '..dp.id_..DevUser..'\nโน : ุงูุงุณู -โบ  ['..dp.first_name_..'](tg://user?id='..dp.id_..')\nโน : ุชู ุญูุธ ุงููุนูููุงุช ุจูุฌุงุญ\nโน : ุงุณุชุฎุฏู ุงูุงุฒุฑุงุฑ ููุชุงููุฏ -โบ  โค'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/setyes"},{text="ูุง",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"โน : ุงููุนูููุงุช ุฎุงุทุฆู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู")
DevAli:del(LaUrEn.."Ali:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source LaUrEn     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุฑูุน ูุทู$") and not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAli:sismember(LaUrEn..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ูู ูุทู ุดุฑูุน ููู ุจุนุฏ๐น๐") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทุงูู") 
DevAli:sadd(LaUrEn..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source LaUrEn     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^ุชูุฒูู ูุทู$") and not DevAli:get(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAli:sismember(LaUrEn..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ูู ููุณ ูุทู ููุชู ุชูุฒููู") 
else
DevAli:srem(LaUrEn..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทุงูู") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source LaUrEn     --
if Admin(msg) then
if text and (text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชููุฏู ููุฏุฉ -โบ  "..mutept.." ุฏ") 
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชููุฏู ููุฏุฉ -โบ  "..mutept.." ุณ") 
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชุณุชุทูุน ุชููุฏ -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุชููุฏู ููุฏุฉ -โบ  "..mutept.." ู") 
DevAli:sadd(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source LaUrEn     --
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
DevAli:set('LaUrEnTEAM:'..LaUrEn..'id:user'..msg.chat_id_,TXT)  
DevAli:setex('LaUrEnTEAM:'..LaUrEn.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ุนุฏุฏ ุงูุฑุณุงุฆู ุงูุงู \nโน : ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Ali(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
function Reply(extra, result, success)
DevAli:del(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAli:incrby(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุถุงูุฉ "..Num..' ุฑุณุงูู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ููุงุท (%d+)$")
DevAli:set('LaUrEnTEAM:'..LaUrEn..'ids:user'..msg.chat_id_,TXT)  
DevAli:setex('LaUrEnTEAM:'..LaUrEn.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ุนุฏุฏ ุงูููุงุท ุงูุงู \nโน : ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Ali(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ููุงุท (%d+)$")
function Reply(extra, result, success)
DevAli:incrby(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุถุงูุฉ "..Num..' ููุทู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevAli:get(LaUrEn..'Ali:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevAli:sadd(LaUrEn.."Ali:cleaner"..msg.chat_id_, msg.id_) else DevAli:sadd(LaUrEn.."Ali:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุชุซุจูุช$") and ChCheck(msg) then 
if DevAli:sismember(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, "โน : ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAli:set(LaUrEn..'Ali:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุซุจูุช ุงูุฑุณุงูู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุจูุช ููุณ ุงุฏูู ููุง !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source LaUrEn     --
if Admin(msg) then
if text == "ุงููููุฒูู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:VipMem:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงููููุฒูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูููุฒูู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LaUrEn     --
if Manager(msg) then
if text == "ุงูุงุฏูููู" and ChCheck(msg) or text == "ุงูุงุฏูููุฉ" and ChCheck(msg) then 
local ali =  'Ali:Admins:'..msg.chat_id_
local List = DevAli:smembers(LaUrEn..ali)
text = "โน : ูุงุฆูุฉ ุงูุงุฏูููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โน : *ูุง ููุฌุฏ ุงุฏูููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source LaUrEn     -- 
if Constructor(msg) then
if text == "ุงููุฏุฑุงุก" and ChCheck(msg) or text == "ูุฏุฑุงุก" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Managers:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงููุฏุฑุงุก -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูุฏุฑุงุก*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "ุงูููุธููู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Cleaner:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงูููุธููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ููุธููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LaUrEn     --
if BasicConstructor(msg) then
if text == "ุงูููุดุฆูู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Constructor:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงูููุดุฆูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ููุดุฆูู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LaUrEn     --
if AliConstructor(msg) then
if text == "ุงููุงูููู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงููุงูููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูุงูููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "ุงูููุดุฆูู ุงูุงุณุงุณููู" and ChCheck(msg) or text == "ููุดุฆูู ุงุณุงุณููู" and ChCheck(msg) or text == "ุงูููุดุฆูู ุงูุงุณุงุณูู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงูููุดุฆูู ุงูุงุณุงุณููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ููุดุฆูู ุงุณุงุณููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("ุงูููุดุฆ") and ChCheck(msg) or text ==("ุงููุงูู") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "โ ยฆ ุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = dp.id_,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
if abbas.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {{{text=dp.first_name_,url=("t.me/"..dp.username_ or "t.me/iinzzz")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..abbas.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape("โ ยฆ ูุงูู ุงููุฌููุนู -โบ โก").."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
SendText(msg.chat_id_,"โ ยฆ ูุงูู ุงููุฌููุนู -โบ ["..dp.first_name_.."](tg://user?id="..dp.id_..")",msg.id_/2097152/0.5,'md')
end
end,nil)  
end,nil)   
end
end
end,nil)   
end
--     Source LaUrEn     --
if Admin(msg) then
if text == "ุงูููุชูููู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Muted:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงูููุชูููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ููุชูููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     --
if text == "ุงููููุฏูู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Tkeed:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงููููุฏูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โน : *ูุง ููุฌุฏ ูููุฏูู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     --
if text == "ุงููุญุธูุฑูู" and ChCheck(msg) or text == "ุงููุญุถูุฑูู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:Ban:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงููุญุธูุฑูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูุญุธูุฑูู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "ูุงุฆูู ุงูููุน" and ChCheck(msg) then
local List = DevAli:hkeys(LaUrEn..'Ali:Filters:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ุงูููุน -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k, v in pairs(List) do
text = text..k..'~ โจ '..v..' โฉ\n'
end
if #List == 0 then
text = "โน : ูุง ุชูุฌุฏ ูููุงุช ููููุนู"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source LaUrEn     --
if text == "ุงููุทุงูู" and ChCheck(msg) or text == "ุงููุทุงูุฉ" and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn..'User:Donky:'..msg.chat_id_)
text = "โน : ูุงุฆูุฉ ูุทุงูุฉ ุงููุฌููุนู ๐น๐ -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โน : *ูุง ููุฌุฏ ูุทุงูู ูููุง ุงูุงุฏู* ๐น๐"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source LaUrEn     --
if text == "ุงููุทูุฑูู ุงูุซุงููููู" and SecondSudo(msg) or text == "ุงูุซุงููููู" and SecondSudo(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:SecondSudo:')
text = "โน : ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โน : *ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู ุซุงููููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     --
if SudoBot(msg) then
if text == "ูุงุฆูู ุงูุนุงู" and ChCheck(msg) or text == "ุงููุญุธูุฑูู ุนุงู" and ChCheck(msg) or text == "ุงูููุชูููู ุนุงู" and ChCheck(msg) or text == "-โบ  ูุงุฆูู ุงูุนุงู โช" and ChCheck(msg) then 
local BanAll = DevAli:smembers(LaUrEn..'Ali:BanAll:')
local MuteAll = DevAli:smembers(LaUrEn..'Ali:MuteAll:')
if #BanAll ~= 0 then 
text = "โน : ูุงุฆูุฉ ุงููุญุธูุฑูู ุนุงู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(BanAll) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."โน : ูุงุฆูุฉ ุงูููุชูููู ุนุงู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(MuteAll) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "โน : *ูู ูุชู ุญุธุฑ ุงู ูุชู ุงู ุนุถู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     --
if text == "ุงููุทูุฑูู" and ChCheck(msg) or text == "-โบ  ุงููุทูุฑูู โช" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:SudoBot:')
text = "โน : ูุงุฆูุฉ ุงููุทูุฑูู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local sudouser = DevAli:get(LaUrEn..'Ali:Sudos'..v) 
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] โฌ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` โฌ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "โน : *ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     --
if text == "ุงููุฏุฑุงุก ุงูุนุงููู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:ManagerAll:')
text = "โน : ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูุฏุฑุงุก ุนุงููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source LaUrEn     --
if text == "ุงููููุฒูู ุนุงู" and ChCheck(msg) or text == "ุงููููุฒูู ุงูุนุงููู" and ChCheck(msg) then 
local List = DevAli:smembers(LaUrEn..'Ali:VipAll:')
text = "โน : ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โน : *ูุง ููุฌุฏ ูููุฒูู ุนุงู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LaUrEn     -- 
if text == "ุงูุงุฏูููู ุงูุนุงููู" and ChCheck(msg) then 
local ali =  'Ali:AdminAll:'
local List = DevAli:smembers(LaUrEn..ali)
text = "โน : ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local username = DevAli:get(LaUrEn..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โน : *ูุง ููุฌุฏ ุงุฏูููู ุนุงููู*"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source LaUrEn     --
if text ==("ุฑูุน ุงูููุดุฆ") and ChCheck(msg) or text ==("ุฑูุน ุงููุงูู") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
local UserName = (dp.username_ or "iinzzz")
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุฑูุน ูุงูู ุงููุฌููุนู -โบ  ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAli:sadd(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source LaUrEn     --
if Manager(msg) then
if text == 'ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAli:sadd(LaUrEn.."Ali:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ููุน ุงูููุตู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงูู ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAli:sadd(LaUrEn.."Ali:FilterPhoto"..msg.chat_id_,photo)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ููุน ุงูุตูุฑู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAli:sadd(LaUrEn.."Ali:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ููุน ุงููุชุญุฑูู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source LaUrEn     --
if text == 'ุงูุบุงุก ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAli:srem(LaUrEn.."Ali:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ููุน ุงูููุตู ูููููู ุงุฑุณุงูู ุงูุงู', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAli:srem(LaUrEn.."Ali:FilterPhoto"..msg.chat_id_,photo)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ููุน ุงูุตูุฑู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAli:srem(LaUrEn.."Ali:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ููุน ุงููุชุญุฑูู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source LaUrEn     --
if text and (text == "ุชูุนูู ุชุญููู ุงูุตูุบ" or text == "ุชูุนูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุชุญููู ุงูุตูุบ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Thwel:Ali'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุชุญููู ุงูุตูุบ" or text == "ุชุนุทูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุชุญููู ุงูุตูุบ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Thwel:Ali'..msg.chat_id_,true)  
end
if text == 'ุชุญููู' and not DevAli:get(LaUrEn..'Ali:Thwel:Ali'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Ali = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Ali.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Ali = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Ali.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','โน : ุชู ุชุญููู ุงูููุตู ุงูู ุตูุฑู')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Ali = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Ali.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"โน : ุชู ุชุญููู ุงููMp3 ุงูู ุจุตูู")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Ali = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Ali.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source LaUrEn     --
if text ==("ูุดู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ุงูุฏู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAli:sismember(LaUrEn..'Ali:BanAll:',result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:MuteAll:',result.sender_user_id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ููุชูู'
elseif DevAli:sismember(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโน : ุงููููุฏ -โบ  '..Tkeed
else 
Tked = '' 
end
if DevAli:sismember(LaUrEn..'Ali:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\nโน : ุนุฏุฏ ุงููุฑูุจุงุช -โบ  '..(DevAli:get(LaUrEn..'Ali:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\nโน : ููุจู -โบ  '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'โน : ุงุณูู -โบ  ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\nโน : ุงูุฏูู -โบ  โจ `'..result.sender_user_id_..'` โฉ\nโน : ุฑุชุจุชู -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(user_msgs)..CustomTitle..'\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุนุฑูู -โบ  [@'..data.username_..']\nโน : ุงูุฏูู -โบ  โจ `'..result.sender_user_id_..'` โฉ\nโน : ุฑุชุจุชู -โบ  '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(user_msgs)..CustomTitle..'\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^ูุดู @(.*)') and ChCheck(msg) or text and text:match('^ุงูุฏู @(.*)') and ChCheck(msg) then 
local username = text:match('^ูุดู @(.*)') or text:match('^ุงูุฏู @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'ููุงุฉ'
local chn = 'โน : ููุน ุงูุญุณุงุจ -โบ  โจ '..ch..' โฉ\nโน : ุงูุงูุฏู -โบ  โจ `'..res.id_..'` โฉ\nโน : ุงููุนุฑู -โบ  โจ [@'..username..'] โฉ\nโน : ุงูุงุณู -โบ  โจ ['..res.title_..'] โฉ'
Dev_Ali(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'ูุฌููุนู'
local grr = 'โน : ููุน ุงูุญุณุงุจ -โบ  โจ '..gr..' โฉ\nโน : ุงูุงูุฏู -โบ  โจ '..res.id_..' โฉ\nโน : ุงููุนุฑู -โบ  โจ [@'..username..'] โฉ\nโน : ุงูุงุณู -โบ  โจ ['..res.title_..'] โฉ'
Dev_Ali(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAli:sismember(LaUrEn..'Ali:BanAll:',res.id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:MuteAll:',res.id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'ููุชูู'
elseif DevAli:sismember(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโน : ุงููููุฏ -โบ  '..Tkeed
else 
Tked = '' 
end
if DevAli:sismember(LaUrEn..'Ali:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\nโน : ุนุฏุฏ ุงููุฑูุจุงุช -โบ  '..(DevAli:get(LaUrEn..'Ali:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\nโน : ููุจู -โบ  '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุนุฑูู -โบ  [@'..data.username_..']\nโน : ุงูุฏูู -โบ  โจ `'..res.id_..'` โฉ\nโน : ุฑุชุจุชู -โบ  '..IdRank(res.id_, msg.chat_id_)..sudobot..'\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(user_msgs)..CustomTitle..'\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('ูุดู (%d+)') and ChCheck(msg) or text and text:match('ุงูุฏู (%d+)') and ChCheck(msg) then 
local iduser = text:match('ูุดู (%d+)') or text:match('ุงูุฏู (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูู ูุชู ุงูุชุนุฑู ุนูู ุงูุญุณุงุจ', 1, 'md')
return false  
end
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAli:sismember(LaUrEn..'Ali:BanAll:',iduser) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:MuteAll:',iduser) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAli:sismember(LaUrEn..'Ali:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'ููุชูู'
elseif DevAli:sismember(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโน : ุงููููุฏ -โบ  '..Tkeed
else 
Tked = '' 
end
if DevAli:sismember(LaUrEn..'Ali:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\nโน : ุนุฏุฏ ุงููุฑูุจุงุช -โบ  '..(DevAli:get(LaUrEn..'Ali:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\nโน : ููุจู -โบ  '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'โน : ุงุณูู -โบ  ['..data.first_name_..'](tg://user?id='..iduser..')\nโน : ุงูุฏูู -โบ  โจ `'..iduser..'` โฉ\nโน : ุฑุชุจุชู -โบ  '..IdRank(data.id_, msg.chat_id_)..sudobot..'\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(user_msgs)..CustomTitle..'\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ูุนุฑูู -โบ  [@'..data.username_..']\nโน : ุงูุฏูู -โบ  โจ `'..iduser..'` โฉ\nโน : ุฑุชุจุชู -โบ  '..IdRank(data.id_, msg.chat_id_)..sudobot..'\nโน : ุฑุณุงุฆูู -โบ  โจ '..user_msgs..' โฉ\nโน : ุชูุงุนูู -โบ  '..formsgs(user_msgs)..CustomTitle..'\nโน : ููุงุทู -โบ  โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source LaUrEn     --
if text == 'ูุดู ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevAli:sismember(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevAli:sismember(LaUrEn..'Ali:BanAll:',result.sender_user_id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevAli:sismember(LaUrEn..'Ali:MuteAll:',result.sender_user_id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevAli:sismember(LaUrEn..'Ali:Tkeed:',result.sender_user_id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุญุธุฑ ุงูุนุงู -โบ  '..banall..'\nโน : ุงููุชู ุงูุนุงู -โบ  '..muteall..'\nโน : ุงูุญุธุฑ -โบ  '..banned..'\nโน : ุงููุชู -โบ  '..muted..'\nโน : ุงูุชููุฏ -โบ  '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^ูุดู ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^ูุดู ุงููููุฏ @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAli:sismember(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevAli:sismember(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevAli:sismember(LaUrEn..'Ali:BanAll:',result.id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevAli:sismember(LaUrEn..'Ali:MuteAll:',result.id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevAli:sismember(LaUrEn..'Ali:Tkeed:',result.id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุญุธุฑ ุงูุนุงู -โบ  '..banall..'\nโน : ุงููุชู ุงูุนุงู -โบ  '..muteall..'\nโน : ุงูุญุธุฑ -โบ  '..banned..'\nโน : ุงููุชู -โบ  '..muted..'\nโน : ุงูุชููุฏ -โบ  '..tkeed, 1, 'md')  
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'ุฑูุน ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","โน : ุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:BanAll:',result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.sender_user_id_) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^ุฑูุน ุงููููุฏ (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('ุฑูุน ุงููููุฏ (%d+)') 
if tonumber(user) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","โน : ุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,user) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,user) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,user) DevAli:srem(LaUrEn..'Ali:BanAll:',user) DevAli:srem(LaUrEn..'Ali:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,user) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,user) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^ุฑูุน ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('ุฑูุน ุงููููุฏ @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ูุนุฑู ููุงุฉ ูููุณ ูุนุฑู ุญุณุงุจ', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(LaUrEn) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","โน : ุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,result.id_) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.id_) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.id_) DevAli:srem(LaUrEn..'Ali:BanAll:',result.id_) DevAli:srem(LaUrEn..'Ali:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_,result.id_) DevAli:srem(LaUrEn..'Ali:Ban:'..msg.chat_id_,result.id_) DevAli:srem(LaUrEn..'Ali:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source LaUrEn     --
if Manager(msg) then
if text and text:match("^ุชุบููุฑ ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุบูุฑ ุงูุงูุฏู$") and ChCheck(msg) then 
local List = {
[[
ใ?๐๐๐ด๐ ๐จ #username ๐ฅฒ .
ใ?๐ผ๐๐ถ ๐จ #msgs ๐ฅฒ .
ใ?๐๐๐ฐ ๐จ #stast ๐ฅฒ .
ใ?๐ธ๐ณ ๐จ #id ๐ฅฒ .
]],
[[
โญ- ๐๐๐๐ #stast ๐ฏ. ๐
โฎ- ๐๐๐๐๐ #username ๐ฏ. ๐
โญ- ๐๐๐๐๐ #msgs ๐ฏ. ๐
โญ- ๐๐ ๐ #id ๐ฏ. ๐
]],
[[
โ ๐ฐ ๐พ๐๐๐๐๐๐ ๐ป๐ ๐ฎ๐๐๐๐ โ
โข ๐ค | ๐ผ๐ฌ๐บ : #username โโโโ
โข ๐ค | ๐บ๐ป๐จ : #stast ๐ง๐ปโโ๏ธ โฅ
โข ๐ค | ๐ฐ๐ซ : #id โโโโ
โข ๐ค | ๐ด๐บ๐ฎ : #msgs ๐
]],
[[
โ ๐๐๐๐ ๐คฑ #username ๐ฆด .
โ ๐๐๐ ๐คฑ #msgs ๐ฆด .
โ ๐๐๐ ๐คฑ #stast ๐ฆด .
โ ๐๐ ๐คฑ #id ๐ฆด .
]],
[[
๐ผ๐ฎ๐ถ ๐ผ๐๐๐๐ต๐๐๐ : #username 
๐ผ๐ฎ๐ถ ๐บ๐๐๐๐ : #stast 
๐ผ๐ฎ๐ถ ๐๐ : #id 
๐ผ๐ฎ๐ถ ๐ฎ๐๐๐๐บ : #game 
๐ผ๐ฎ๐ถ ๐ด๐๐๐ : #msgs
]],
[[
โ: ๐๐๐๐ #stast ๐ฏโธ๐.
โ: ๐๐๐๐๐ #username ๐ฏโธ๐.
โ: ๐๐๐๐๐ #msgs ๐ฏโธ๐.
โ: ๐๐ ๐ #id ๐ฏโธ๐.
]],
[[
โโข๐ฎ๐ฌ๐๐ซ : #username ๐ฃฌ  
โโข๐ฆ๐ฌ๐?  : #msgs ๐ฃฌ 
โโข๐ฌ๐ญ๐ : #stast ๐ฃฌ 
โโข๐ข๐  : #id ๐ฃฌ
]],
[[
- ๐ฌ ๐๐ฌ๐๐ซ : #username ๐ .
- ๐ฌ ๐๐ฌ๐  : #msgs ๐ .
- ๐ฌ ๐๐ญ๐ : #stast ๐ .
- ๐ฌ ๐๐ : #id ๐ .
]],
[[
.๐ฃ ๐ช๐จ๐๐ง๐ฃ๐๐ข๐ , #username  
.๐ฃ ๐จ๐ฉ๐๐จ๐ฉ , #stast  
.๐ฃ ๐ก๐ฟ , #id  
.๐ฃ ๐๐๐ข๐จ , #game 
.๐ฃ ๐ข๐จ๐๐จ , #msgs
]],
[[
โน : ๐๐๐๐ โฌ #username 
โน : ๐๐ โฌ #id
โน : ๐๐๐๐๐ โฌ #stast
โน : ๐๐๐๐ โฌ #cont 
โน : ๐๐๐๐ โฌ #msgs
โน : ๐๐๐๐ โฌ #game
]],
[[
แฏ ๐จ๐ฆ๐๐ฅ๐ก๐ฎ๐บ๐ . #username ๐บ๐ธ ๊ฐ
แฏ ๐ฆ๐ง๐ฎ๐ฆ๐ง . #stast ๐บ๐ธ ๊ฐ
แฏ ๐๐ . #id ๐บ๐ธ ๊ฐ
แฏ ๐๐ฎ๐บ๐๐ฆ . #game ๐บ๐ธ ๊ฐ
แฏ ๐บ๐ฆ๐๐ฆ . #msgs ๐บ๐ธ ๊ฐ
]],
[[
- แดัแดสษดแดแดแด โฅโข #username .
- แดัษขั โฅโข #msgs .
- ัแดแดแดั โฅโข #stast .
- สแดแดส ษชแด โฅโข #id  .
- แดแดษชแด แดsษข โฅโข #edit .
- แดแดแดแดษชสs โฅโข #auto . 
- ษขแดแดแด โฅโข #game .
]]}
local Text_Rand = List[math.random(#List)]
DevAli:set(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุชุบูุฑ ูููุดุฉ ุงูุงูุฏู")  
end
--     Source LaUrEn     --
if SecondSudo(msg) then
if text and text:match("^ุชุนููู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนูู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนููู ูููุดุฉ ุงูุงูุฏู$") then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nโน : ูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\nโโโโโโ ๐ฃ โโโโโโ', 1, 'md')
DevAli:set("LaUrEn:New:id:"..LaUrEn..msg.sender_user_id_,'LaUrEnTEAM')
return "LaUrEnTEAM"
end
if text and DevAli:get("LaUrEn:New:id:"..LaUrEn..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevAli:del("LaUrEn:New:id:"..LaUrEn..msg.sender_user_id_)
return false
end
DevAli:del("LaUrEn:New:id:"..LaUrEn..msg.sender_user_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู', 1, 'md')
DevAli:set(LaUrEn.."Ali:AllIds:Text",text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ูุณุญ ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุญุฐู ูููุดุฉ ุงูุงูุฏู$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู")  
DevAli:del(LaUrEn.."Ali:AllIds:Text")
end
end
--     Source LaUrEn     --
if text and text:match("^ุชุนููู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุนูู ุงูุงูุฏู$") and ChCheck(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nโน : ูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\nโโโโโโ ๐ฃ โโโโโโ', 1, 'md')
DevAli:set("LaUrEn:New:id:"..LaUrEn..msg.chat_id_..msg.sender_user_id_,'LaUrEnTEAM')
return "LaUrEnTEAM"
end
if text and Manager(msg) and DevAli:get("LaUrEn:New:id:"..LaUrEn..msg.chat_id_..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevAli:del("LaUrEn:New:id:"..LaUrEn..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAli:del("LaUrEn:New:id:"..LaUrEn..msg.chat_id_..msg.sender_user_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู', 1, 'md')
DevAli:set(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุงูุฏู$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู")  
DevAli:del(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_)
end
end
--     Source LaUrEn     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ุงูุฏู$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function LaUrEnTEAM(extra,alii,success)
if alii.username_ then username = '@'..alii.username_ else username = 'ูุง ููุฌุฏ' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'ูุง ููุฌุฏ' end
local function getpro(extra, alii, success) 
local msgsday = DevAli:get(LaUrEn..'Ali:UsersMsgs'..LaUrEn..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAli:get(LaUrEn..'Ali:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAli:get(LaUrEn..'Ali:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAli:get(LaUrEn..'Ali:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAli:get(LaUrEn..'Ali:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"ูู ุตูุฑู ุธูู ุจุงููุจู ุ๐คค๐","ููุชูุน ุจุตูุฑุชู !ุ ๐น๐ค","ููุงู ููุงุณูู ุจูุฑูุจูู ุ๐คค๐","ููุงููู ุ๐คค๐","ูุดุฎู ุจุฑุจ ุ๐๐ค","ูุฒูุช ุจููุง ุฏุบูุฑูุง ุนุงุฏ ุ๐๐","ุตูุฑุชู ูุงูุฑุชุงุญููุง ุ๐๐ถ","ุญูุบูู ูุงููู ุ๐ฅบ๐","ูู ุตูุฑู ุบูุจูู ุจุฑุงุณูุง ูฆู? ุญุธ ุ๐น๐ค"}
local Description = Texting[math.random(#Texting)]
if alii.photos_[0] then
if not DevAli:get(LaUrEn..'Ali:Lock:Id'..msg.chat_id_) then 
if not DevAli:get(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_) then 
if DevAli:get(LaUrEn.."Ali:AllIds:Text") then
newpicid = DevAli:get(LaUrEn.."Ali:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#photos',(alii.total_count_ or 'ูุง ููุฌุฏ')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newpicid = "โน : "..Description.."\nโน : ูุนุฑูู -โบ  โจ "..username.." โฉ\nโน : ุงูุฏูู -โบ  โจ "..msg.sender_user_id_.." โฉ\nโน : ุฑุชุจุชู -โบ  "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโน : ุฑุณุงุฆูู -โบ  โจ "..user_msgs.." โฉ\nโน : ุณุญูุงุชู -โบ  โจ "..edit_msg.." โฉ\nโน : ุชูุงุนูู -โบ  "..formsgs(msguser).."\nโน : ููุงุทู -โบ  โจ "..user_nkt.." โฉ\nโโโโโโ ๐ฃ โโโโโโ\n"
end 
if not DevAli:get(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, alii.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAli:get(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(alii.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, alii.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAli:get(LaUrEn.."Ali:AllIds:Text") then
newallid = DevAli:get(LaUrEn.."Ali:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#photos',(alii.total_count_ or 'ูุง ููุฌุฏ')) 
newallid = newallid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newallid = "โน : ูุนุฑูู -โบ  โจ "..username.." โฉ\nโน : ุงูุฏูู -โบ  โจ "..msg.sender_user_id_.." โฉ\nโน : ุฑุชุจุชู -โบ  "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโน : ุฑุณุงุฆูู -โบ  โจ "..user_msgs.." โฉ\nโน : ุณุญูุงุชู -โบ  โจ "..edit_msg.." โฉ\nโน : ุชูุงุนูู -โบ  "..formsgs(msguser).."\nโน : ููุงุทู -โบ  โจ "..user_nkt.." โฉ"
end 
if not DevAli:get(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAli:get(LaUrEn.."Ali:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(alii.total_count_ or 'ูุง ููุฌุฏ')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
Dev_Ali(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฐุฑุง ุงูุงูุฏู ูุนุทู ', 1, 'md')
end
else
if DevAli:get(LaUrEn.."Ali:AllIds:Text") then
notpicid = DevAli:get(LaUrEn.."Ali:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#photos',(alii.total_count_ or 'ูุง ููุฌุฏ')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
notpicid = "โน : ูุง ุงุณุชุทูุน ุนุฑุถ ุตูุฑุชู ูุงูู ููุช ุจุญุธุฑ ุงูุจูุช ุงู ุงูู ูุงุชูุชูู ุตูุฑู ูู ุจุฑููุงููู\nโโโโโโ ๐ฃ โโโโโโ\nโน : ูุนุฑูู -โบ  โจ "..username.." โฉ\nโน : ุงูุฏูู -โบ  โจ "..msg.sender_user_id_.." โฉ\nโน : ุฑุชุจุชู -โบ  "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโน : ุฑุณุงุฆูู -โบ  โจ "..user_msgs.." โฉ\nโน : ุณุญูุงุชู -โบ  โจ "..edit_msg.." โฉ\nโน : ุชูุงุนูู -โบ  "..formsgs(msguser).."\nโน : ููุงุทู -โบ  โจ "..user_nkt.." โฉ\nโโโโโโ ๐ฃ โโโโโโ\n"
end 
if not DevAli:get(LaUrEn..'Ali:Lock:Id'..msg.chat_id_) then
if not DevAli:get(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุนุฑูู -โบ  โจ "..username.." โฉ\nโน : ุงูุฏูู -โบ  โจ "..msg.sender_user_id_.." โฉ\nโน : ุฑุชุจุชู -โบ  "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโน : ุฑุณุงุฆูู -โบ  โจ "..user_msgs.." โฉ\nโน : ุณุญูุงุชู -โบ  โจ "..edit_msg.." โฉ\nโน : ุฑุณุงุฆูู -โบ  โจ "..user_msgs.." โฉ\nโน : ุชูุงุนูู -โบ  "..formsgs(msguser).."\nโน : ููุงุทู -โบ  โจ "..user_nkt.." โฉ", 1, 'md')
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฐุฑุง ุงูุงูุฏู ูุนุทู', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, LaUrEnTEAM)
end
end 
--     Source LaUrEn     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ููู (.*)$") then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุงุจุงุญู" then
if not DevAli:get(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุงุจุงุญู")  
DevAli:set(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุจุงุญู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชุนุฏูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชุนุฏูู")  
DevAli:set(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชุนุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or LockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if not DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุชุนุฏูู ุงูููุฏูุง")  
DevAli:set(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุงุฑุณูู")  
DevAli:set(LaUrEn..'Ali:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑุณูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุดุงุฑ" then
if DevAli:get(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุดุงุฑ")  
DevAli:del(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุดุงุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุทุงุฆููู" then
if DevAli:get(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุทุงุฆููู")  
DevAli:del(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุทุงุฆููู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฑ" then
if DevAli:get(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูููุฑ")  
DevAli:del(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if not DevAli:get(LaUrEn..'Ali:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevAli:set(LaUrEn..'Ali:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููููู ', 1, 'md')
end
end
if LockText[2] == "ุงูุจูุชุงุช" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุญุฐู" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุจูุชุงุช ุจุงูุญุฐู")  
DevAli:set(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุจูุชุงุช ุจุงูุทุฑุฏ")  
DevAli:set(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุจูุชุงุช ุจุงูุชููุฏ")  
DevAli:set(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุญุฐู" then 
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุญุฐู")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ" then 
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชููุฏ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชูููุฏ" then 
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุชููุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงููุชู" then 
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูุฑุงุฑ ุจุงููุชู")  
end
if BasicConstructor(msg) then
if LockText[2] == "ุงูุชุซุจูุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAli:set(LaUrEn.."Ali:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชุซุจูุช")  
DevAli:set(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_,true)
DevAli:sadd(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_) 
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชุซุจูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text and (text:match("^ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุชูุฑุงุฑ (%d+)$")) then   
local TextSpam = text:match("ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุชูุฑุงุฑ (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุชุญุฏูุฏ ุนุฏุฏ ุงูุจุฑ ูู 2 ููุชูุฑุงุฑ', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุถุน ุนุฏุฏ ุงูุชูุฑุงุฑ -โบ  '..TextSpam, 1, 'md')
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")) then  
local TextSpam = text:match("ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")
DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุถุน ุฒูู ุงูุชูุฑุงุฑ -โบ  '..TextSpam, 1, 'md')
end
--     Source LaUrEn     --
if Manager(msg) then
if text and text == 'ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ููุนู', 1, 'md')
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if DevAli:get(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ูุนุทู', 1, 'md')
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'ุชูุนูู ุงูุงูุฏู' and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Lock:Id'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูุฏู ุจุงูุชุงููุฏ ููุนู ', 1, 'md')
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงูุฏู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'ุชุนุทูู ุงูุงูุฏู' and ChCheck(msg) then
if DevAli:get(LaUrEn..'Ali:Lock:Id'..msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูุฏู ุจุงูุชุงููุฏ ูุนุทู ', 1, 'md')
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงูุฏู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source LaUrEn     --
if text == 'ุถุน ุฑุงุจุท' or text == 'ูุถุน ุฑุงุจุท' or text == 'ุถุน ุงูุฑุงุจุท' or text == 'ูุถุน ุงูุฑุงุจุท' then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevAli:setex(LaUrEn.."Ali:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'ุงูุดุงุก ุฑุงุจุท' or text == 'ุงูุดุงุก ุงูุฑุงุจุท' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAli:get(LaUrEn.."Ali:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAli:set(LaUrEn.."Ali:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุดุงุก ุฑุงุจุท ุฌุฏูุฏ ุงุฑุณู -โบ  ุงูุฑุงุจุท', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุฏุนูุฉ ุงููุณุชุฎุฏููู ุนุจุฑ ุงูุฑุงุจุท ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevAli:setex(LaUrEn.."Ali:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text and text:match("^ุชูุนูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุชุฑุญูุจ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn.."Ali:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^ุชุนุทูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุชุฑุญูุจ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn.."Ali:Lock:Welcome"..msg.chat_id_)
end
if DevAli:get(LaUrEn..'Ali:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
DevAli:del(LaUrEn..'Ali:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAli:del(LaUrEn..'Ali:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevAli:set(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
return false   
end
if text and text:match("^ุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ูุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงุถู ุชุฑุญูุจ$") and ChCheck(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ุงูุชุฑุญูุจ ุงูุงู\nโน : ุชุณุชุทูุน ุงุถุงูุฉ ูุงููู -โบ  โค\nโน : ุฏุงูุฉ ุนุฑุถ ุงูุงุณู -โบ  firstname\nโน : ุฏุงูุฉ ุนุฑุถ ุงููุนุฑู -โบ  username', 1, 'md')
DevAli:set(LaUrEn..'Ali:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^ุญุฐู ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุญุฐู ุชุฑุญูุจ$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูุชุฑุญูุจ")  
DevAli:del(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^ุฌูุจ ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุฌูุจ ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local Welcomes = DevAli:get(LaUrEn..'Ali:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_Ali(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ูุชู ูุถุน ุงูุชุฑุญูุจ \nโน : ุงุฑุณู -โบ  ุถุน ุชุฑุญูุจ ููุญูุธ ', 1, 'md')
end
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn..'Ali:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุญูุธ ุงููุตู", 1, 'md')
DevAli:del(LaUrEn..'Ali:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAli:del(LaUrEn..'Ali:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชุบููุฑ ูุตู ุงููุฌููุนู', 1, 'md')
return false  
end 
if text and text:match("^ุถุน ูุตู$") and ChCheck(msg) or text and text:match("^ูุถุน ูุตู$") and ChCheck(msg) then  
DevAli:set(LaUrEn..'Ali:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ุงููุตู ุงูุงู', 1, 'md')
end
--     Source LaUrEn     --
if text and text == "ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevAli:set(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAli:get(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ุงูููุน', 1, 'md')
DevAli:del(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ููุน ุงููููู -โบ  "..text, 1, 'html')
DevAli:del(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAli:hset(LaUrEn..'Ali:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "ุงูุบุงุก ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevAli:set(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAli:get(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุบุงุก ุงูููุน', 1, 'md')
DevAli:del(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAli:hget(LaUrEn..'Ali:Filters:'..msg.chat_id_, text) then  
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงููููู -โบ  "..text.." ุบูุฑ ููููุนู", 1, 'html')
DevAli:del(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAli:hdel(LaUrEn..'Ali:Filters:'..msg.chat_id_, text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงููููู -โบ  "..text.." ุชู ุงูุบุงุก ููุนูุง", 1, 'html')
DevAli:del(LaUrEn.."Ali:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source LaUrEn     --
if SudoBot(msg) then
if text and text == "ุงูุงุญุตุงุฆูุงุช" and ChCheck(msg) or text and text == "-โบ  ุงูุงุญุตุงุฆูุงุช โช" then
local gps = DevAli:scard(LaUrEn.."Ali:Groups") local users = DevAli:scard(LaUrEn.."Ali:Users") 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุญุตุงุฆูุงุช ุงูุจูุช -โบ  โค\nโน : ุนุฏุฏ ุงููุดุชุฑููู -โบ  โจ '..users..' โฉ\nโน : ุนุฏุฏ ุงููุฌููุนุงุช -โบ  โจ '..gps..' โฉ', 1, 'md')
end
if text and text == "ุงููุดุชุฑููู" and ChCheck(msg) or text and text == "-โบ  ุงููุดุชุฑููู โช" then
local users = DevAli:scard(LaUrEn.."Ali:Users")
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ุงููุดุชุฑููู -โบ  โจ '..users..' โฉ', 1, 'md')
end
if text and text == "ุงููุฌููุนุงุช" and ChCheck(msg) or text and text == "-โบ  ุงููุฌููุนุงุช โช" then
local gps = DevAli:scard(LaUrEn.."Ali:Groups")
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ุงููุฌููุนุงุช -โบ  โจ '..gps..' โฉ', 1, 'md')
end
end
--     Source LaUrEn     --
if text and text:match('^ุชูุธูู (%d+)$') and ChCheck(msg) then  
if not DevAli:get(LaUrEn..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^ุชูุธูู (%d+)$')) 
if Number > 1000 then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุงุชุณุชุทูุน ุชูุธูู ุงูุซุฑ ูู 1000 ุฑุณุงูู', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชูุธูู *'..Number..'* ูู ุงูุฑุณุงุฆู', 1, 'md')
DevAli:setex(LaUrEn..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "ุชูุธูู ุงููุดุชุฑููู" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAli:smembers(LaUrEn.."Ali:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAli:srem(LaUrEn.."Ali:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : *ูุง ููุฌุฏ ูุดุชุฑููู ูููููู*', 1, 'md')
else
local ok = #pv - sendok
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ุงููุดุชุฑููู ุงูุงู -โบ  { '..#pv..' }\nโน : ุชู ุญุฐู -โบ  { '..sendok..' } ูู ุงููุดุชุฑููู\nโน : ุงูุนุฏุฏ ุงูุญูููู ุงูุงู  -โบ  ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source LaUrEn     --
if text == "ุชูุธูู ุงููุฑูุจุงุช" and SecondSudo(msg) and ChCheck(msg) or text == "ุชูุธูู ุงููุฌููุนุงุช" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAli:smembers(LaUrEn.."Ali:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAli:srem(LaUrEn.."Ali:Groups",group[i]) 
changeChatMemberStatus(group[i], LaUrEn, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAli:srem(LaUrEn.."Ali:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAli:srem(LaUrEn.."Ali:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAli:srem(LaUrEn.."Ali:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : *ูุงุชูุฌุฏ ูุฌููุนุงุช ููููู*', 1, 'md')   
else
local LaUrEngp2 = (w + q)
local LaUrEngp3 = #group - LaUrEngp2
if q == 0 then
LaUrEngp2 = ''
else
LaUrEngp2 = '\nโน : ุชู ุญุฐู -โบ  { '..q..' } ูุฌููุนู ูู ุงูุจูุช'
end
if w == 0 then
LaUrEngp1 = ''
else
LaUrEngp1 = '\nโน : ุชู ุญุฐู -โบ  { '..w..' } ูุฌููุนู ุจุณุจุจ ุชูุฒูู ุงูุจูุช ุงูู ุนุถู'
end
Dev_Ali(msg.chat_id_, msg.id_, 1,'โน : ุนุฏุฏ ุงููุฑูุจุงุช ุงูุงู -โบ  { '..#group..' }'..LaUrEngp1..LaUrEngp2..'\nโน : ุงูุนุฏุฏ ุงูุญูููู ุงูุงู  -โบ  ( '..LaUrEngp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source LaUrEn     --
if text and (text == "ุชูุนูู ุงูุณุญ" or text == "ุชูุนูู ุงููุณุญ ุงูุชููุงุฆู" or text == "ุชูุนูู ุงูุญุฐู ุงูุชููุงุฆู") and Constructor(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุณุญ ูุน ููุฒุฉ ุงูุญุฐู ุงูุชููุงุฆู ููููุฏูุง'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Clean'..msg.chat_id_,true)  
end
if text and (text == "ุชุนุทูู ุงูุณุญ" or text == "ุชุนุทูู ุงููุณุญ ุงูุชููุงุฆู" or text == "ุชุนุทูู ุงูุญุฐู ุงูุชููุงุฆู") and Constructor(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุณุญ ูุน ููุฒุฉ ุงูุญุฐู ุงูุชููุงุฆู ููููุฏูุง'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Clean'..msg.chat_id_) 
end
if text and (text:match("^ุชุนูู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("^ุชุนููู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("^ุชุนูู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("^ุชุนููู ุนุฏุฏ ุงูุญุฐู (%d+)$")) and Constructor(msg) then   
local Num = text:match("ุชุนูู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("ุชุนูู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงูุญุฐู (%d+)$")
if tonumber(Num) < 50 or tonumber(Num) > 200 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุชุญุฏูุฏ ุนุฏุฏ ุงูุจุฑ ูู 50 ูุงุตุบุฑ ูู 200 ููุญุฐู ุงูุชููุงุฆู', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุถุน -โบ  *'..Num..'* ูู ุงูููุฏูุง ููุญุฐู ุงูุชููุงุฆู', 1, 'md')
DevAli:set(LaUrEn..'Ali:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevAli:get(LaUrEn..'Ali:Lock:Clean'..msg.chat_id_) then
if DevAli:get(LaUrEn..'Ali:CleanNum'..msg.chat_id_) then CleanNum = DevAli:get(LaUrEn..'Ali:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevAli:scard(LaUrEn.."Ali:cleaner"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevAli:smembers(LaUrEn.."Ali:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"โน : ุชู ุญุฐู "..Del.." ูู ุงูููุฏูุง ุชููุงุฆูุง",0,'md') 
DevAli:del(LaUrEn.."Ali:cleaner"..msg.chat_id_)
end 
end 
if Cleaner(msg) then
if DevAli:get(LaUrEn..'Ali:Lock:Clean'..msg.chat_id_) then 
if text == "ุงูููุฏูุง" and ChCheck(msg) or text == "ุนุฏุฏ ุงูููุฏูุง" and ChCheck(msg) then 
local M = DevAli:scard(LaUrEn.."Ali:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุนุฏุฏ ุงูููุฏูุง -โบ  "..M.."\nโน : ุงูุญุฐู ุงูุชููุงุฆู -โบ  "..(DevAli:get(LaUrEn..'Ali:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชูุฌุฏ ููุฏูุง ููุง", 1, 'md') 
end end
if text == "ุงูุณุญ" and ChCheck(msg) or text == "ุงุญุฐู" and ChCheck(msg) or text == "ุชูุธูู ููุฏูุง" and ChCheck(msg) or text == "ุชูุธูู ุงูููุฏูุง" and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn.."Ali:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู "..Del.." ูู ุงูููุฏูุง", 1, 'md') 
DevAli:del(LaUrEn.."Ali:cleaner"..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชูุฌุฏ ููุฏูุง ููุง", 1, 'md') 
end end 
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text == "ุชูุธูู ุชุนุฏูู" or text == "ุชูุธูู ุงูุชุนุฏูู" and ChCheck(msg) then   
Ali_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Ali_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Ali_Del},function(arg,data)
new = 0
Ali_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Ali_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Ali_Del2)
end,nil)  
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชูุธูู 100 ูู ุงูุฑุณุงุฆู ุงููุนุฏูู', 1, 'md')
end
--     Source LaUrEn     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุงุจุงุญู" then
if DevAli:get(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุงุจุงุญู")  
DevAli:del(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุจุงุญู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชุนุฏูู" then
if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุชุนุฏูู")  
DevAli:del(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชุนุฏูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or UnLockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุชุนุฏูู ุงูููุฏูุง")  
DevAli:del(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุงุฑุณูู")  
DevAli:del(LaUrEn..'Ali:Lock:Farsi'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑุณูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุดุงุฑ" then
if not DevAli:get(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุดุงุฑ")  
DevAli:set(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุดุงุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุทุงุฆููู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุทุงุฆููู")  
DevAli:set(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุทุงุฆููู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฑ" then
if not DevAli:get(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูููุฑ")  
DevAli:set(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if DevAli:get(LaUrEn..'Ali:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevAli:del(LaUrEn..'Ali:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููุชูุญู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุจูุชุงุช" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุจูุชุงุช")  
DevAli:del(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "ุงูุชูุฑุงุฑ" then 
DevAli:hdel(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุชูุฑุงุฑ")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "ุงูุชุซุจูุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุชุซุจูุช")  
DevAli:del(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_)
DevAli:srem(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชุซุจูุช ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text and text:match("^ููู (.*)$") then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุฏุฑุฏุดู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุฏุฑุฏุดู")  
DevAli:set(LaUrEn..'Ali:Lock:Text'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฏุฑุฏุดู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงูููุงูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุงูููุงูู")  
DevAli:set(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูููุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุฑ" then
if not DevAli:get(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุตูุฑ")  
DevAli:set(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุตูุฑ ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุด" then
if not DevAli:get(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูููุงูุด")  
DevAli:set(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุงูุด ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฏุฎูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุฏุฎูู")  
DevAli:set(LaUrEn..'Ali:Lock:Join'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฏุฎูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฏูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูููุฏูู")  
DevAli:set(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุชุญุฑูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุชุญุฑูู")  
DevAli:set(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุชุญุฑูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุบุงูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุงุบุงูู")  
DevAli:set(LaUrEn..'Ali:Lock:Music'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุบุงูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุตูุช")  
DevAli:set(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุตูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฑูุงุจุท" then
if not DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุฑูุงุจุท")  
DevAli:set(LaUrEn..'Ali:Lock:Links'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฑูุงุจุท ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุน" then
if not DevAli:get(LaUrEn..'Ali:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูููุงูุน")  
DevAli:set(LaUrEn..'Ali:Lock:Location'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุงูุน ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุนุฑู" or LockText[2] == "ุงููุนุฑูุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุนุฑูุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุนุฑูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููููุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููููุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:Document'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููููุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุดุชุงู" or LockText[2] == "ุงูุชุงู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุงุดุชุงู")  
DevAli:set(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุดุชุงู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฌูุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุฌูุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, '๏ธโน : ุงูุฌูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุดุจูุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุดุจูุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุดุจูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุนุฑุจูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุนุฑุจูู")  
DevAli:set(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุฑุจูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงููููุฒูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุงููููุฒูู")  
DevAli:set(LaUrEn..'Ali:Lock:English'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงููููุฒูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุตูุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูููุตูุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุตูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑูุฏุงูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงููุงุฑูุฏุงูู")  
DevAli:set(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑูุฏุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if not DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุงุดุนุงุฑุงุช")  
DevAli:set(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุดุนุงุฑุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชูุฌูู" then
if not DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูุฌูู")  
DevAli:set(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชูุฌูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุฏุฑุฏุดู" then
if DevAli:get(LaUrEn..'Ali:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุฏุฑุฏุดู")  
DevAli:del(LaUrEn..'Ali:Lock:Text'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฏุฑุฏุดู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุฑ" then
if DevAli:get(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุตูุฑ")  
DevAli:del(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุตูุฑ ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุด" then
if DevAli:get(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูููุงูุด")  
DevAli:del(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุงูุด ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฏุฎูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุฏุฎูู")  
DevAli:del(LaUrEn..'Ali:Lock:Join'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฏุฎูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฏูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูููุฏูู")  
DevAli:del(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุฏูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููููุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููููุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:Document'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููููุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงูููุงูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุงูููุงูู")  
DevAli:del(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงูููุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑูุฏุงูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุงุฑูุฏุงูู")  
DevAli:del(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุฑูุฏุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุชุญุฑูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุชุญุฑูู")  
DevAli:del(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุชุญุฑูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุบุงูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุงุบุงูู")  
DevAli:del(LaUrEn..'Ali:Lock:Music'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุบุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุตูุช")  
DevAli:del(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุตูุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฑูุงุจุท" then
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุฑูุงุจุท")  
DevAli:del(LaUrEn..'Ali:Lock:Links'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฑูุงุจุท ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุน" then
if DevAli:get(LaUrEn..'Ali:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูููุงูุน")  
DevAli:del(LaUrEn..'Ali:Lock:Location'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุงูุน ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุนุฑู" or UnLockText[2] == "ุงููุนุฑูุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุนุฑูุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุนุฑูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุดุชุงู" or UnLockText[2] == "ุงูุชุงู" then
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงููุงุดุชุงู")  
DevAli:del(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุงุดุชุงู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฌูุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุฌูุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุฌูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุดุจูุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุดุจูุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุดุจูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุนุฑุจูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุนุฑุจูู")  
DevAli:del(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุนุฑุจูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงููููุฒูู" then
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุงููููุฒูู")  
DevAli:del(LaUrEn..'Ali:Lock:English'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงููููุฒูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุงุดุนุงุฑุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุงุดุนุงุฑุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุตูุงุช" then
if DevAli:get(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูููุตูุงุช")  
DevAli:del(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูููุตูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชูุฌูู" then
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุชูุฌูู")  
DevAli:del(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุชูุฌูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     Source LaUrEn     --
if text and text:match("^ููู ุงูุชูููุด$") or text and text:match("^ุชูุนูู ุงูุญูุงูู ุงููุตูู$") then
if not Constructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููููุดุฆูู ููุท', 1, 'md')
else
DevAli:set(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_,"del") DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Ali:Lock:Links','Ali:Lock:Contact','Ali:Lock:Forwards','Ali:Lock:Videos','Ali:Lock:Gifs','Ali:Lock:EditMsgs','Ali:Lock:Stickers','Ali:Lock:Farsi','Ali:Lock:Spam','Ali:Lock:WebLinks','Ali:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAli:set(LaUrEn..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุงูุชูููุด")  
end
end
if text and text:match("^ูุชุญ ุงูุชูููุด$") then
if not Constructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููููุดุฆูู ููุท', 1, 'md')
else
DevAli:hdel(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Ali:Lock:Links','Ali:Lock:Contact','Ali:Lock:Forwards','Ali:Lock:Videos','Ali:Lock:Gifs','Ali:Lock:EditMsgs','Ali:Lock:Stickers','Ali:Lock:Farsi','Ali:Lock:Spam','Ali:Lock:WebLinks','Ali:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAli:del(LaUrEn..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุงูุชูููุด")  
end
end
--     Source LaUrEn     --
if text and text:match("^ููู ุงููู$") then
if not Constructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููููุดุฆูู ููุท', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_) 
DevAli:set(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_,"del") DevAli:hset(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Ali:Lock:EditMsgs','Ali:Lock:Farsi','Ali:Lock:TagServr','Ali:Lock:Inline','Ali:Lock:Photo','Ali:Lock:Spam','Ali:Lock:Videos','Ali:Lock:Gifs','Ali:Lock:Music','Ali:Lock:Voice','Ali:Lock:Links','Ali:Lock:Location','Ali:Lock:Tags','Ali:Lock:Stickers','Ali:Lock:Markdown','Ali:Lock:Forwards','Ali:Lock:Document','Ali:Lock:Contact','Ali:Lock:Hashtak','Ali:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAli:set(LaUrEn..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ููู ุฌููุน ุงูุงูุงูุฑ")  
end
end
if text and text:match("^ูุชุญ ุงููู$") then
if not Constructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููููุดุฆูู ููุท', 1, 'md')
else
DevAli:set(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_,true) DevAli:set(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_,true) DevAli:set(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_,true) DevAli:hdel(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Ali:Lock:NightClub','Ali:Lock:EditMsgs','Ali:Lock:Text','Ali:Lock:Arabic','Ali:Lock:English','Ali:Lock:Join','Ali:Lock:Bots','Ali:Lock:Farsi','Ali:Lock:FarsiBan','Ali:Lock:TagServr','Ali:Lock:Inline','Ali:Lock:Photo','Ali:Lock:Spam','Ali:Lock:Videos','Ali:Lock:Gifs','Ali:Lock:Music','Ali:Lock:Voice','Ali:Lock:Links','Ali:Lock:Location','Ali:Lock:Tags','Ali:Lock:Stickers','Ali:Lock:Markdown','Ali:Lock:Forwards','Ali:Lock:Document','Ali:Lock:Contact','Ali:Lock:Hashtak','Ali:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAli:del(LaUrEn..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ูุชุญ ุฌููุน ุงูุงูุงูุฑ")  
end
end
--     Source LaUrEn     --
if Admin(msg) then
if text and (text:match("^ุถุน ุณุจุงู (%d+)$") or text:match("^ูุถุน ุณุจุงู (%d+)$")) then
local SetSpam = text:match("ุถุน ุณุจุงู (%d+)$") or text:match("ูุถุน ุณุจุงู (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฎุชุฑ ุนุฏุฏ ุงูุจุฑ ูู 40 ุญุฑู ', 1, 'md')
else
DevAli:set(LaUrEn..'Ali:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุถุน ุนุฏุฏ ุงูุณุจุงู -โบ '..SetSpam, 1, 'md')
end
end
end
--     Source LaUrEn     --
if Manager(msg) then
if text == "ูุญุต" or text == "ูุญุต ุงูุจูุช" then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LaUrEn)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุตูุงุญูุงุช ุงูุจูุช ูู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุญุฐู ุงูุฑุณุงุฆู -โบ  '..DEL..'\nโน : ุฏุนูุฉ ุงููุณุชุฎุฏููู -โบ  '..INV..'\nโน : ุญุธุฑ ุงููุณุชุฎุฏููู -โบ  '..BAN..'\nโน : ุชุซุจูุช ุงูุฑุณุงุฆู -โบ  '..PIN..'\nโน : ุชุบููุฑ ุงููุนูููุงุช -โบ  '..EDT..'\nโน : ุงุถุงูุฉ ูุดุฑููู -โบ  '..VIP..'\nโโโโโโ ๐ฃ โโโโโโ', 1, 'md')
end end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") 
DevAli:set(LaUrEn.."Ali:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงููุทูุฑ ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") 
DevAli:set(LaUrEn.."Ali:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูุงุณุงุณู ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") 
DevAli:set(LaUrEn.."Ali:Constructor:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") 
DevAli:set(LaUrEn.."Ali:Managers:Rd"..msg.chat_id_,Text) 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") 
DevAli:set(LaUrEn.."Ali:Admins:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงูุงุฏูู ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") 
DevAli:set(LaUrEn.."Ali:VipMem:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงููููุฒ ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูููุธู (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูููุธู (.*)$") 
DevAli:set(LaUrEn.."Ali:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงูููุธู ุงูู -โบ  "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") 
DevAli:set(LaUrEn.."Ali:mem:Rd"..msg.chat_id_,Text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุบูุฑ ุฑุฏ ุงูุนุถู ุงูู -โบ  "..Text, 1, 'md')
end
if text == "ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ" or text == "ูุณุญ ุฑุฏูุฏ ุงูุฑุชุจ" then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุฌููุน ุฑุฏูุฏ ุงูุฑุชุจ", 1, 'md')
DevAli:del(LaUrEn.."Ali:mem:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:Cleaner:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:VipMem:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:Admins:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:Managers:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:Constructor:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:BasicConstructor:Rd"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source LaUrEn     --
if text == "ูุดู ุงูุจูุชุงุช" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = 'โน : *ูุงุฆูุฉ ุงูุจูุชุงุช* -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' โฏ'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
return false end
if #admins == i then 
local a = 'โโโโโโ ๐ฃ โโโโโโ\nโน : *ุนุฏุฏ ุงูุจูุชุงุช ููุง* -โบ  '..n..'\n'
local f = 'โน : *ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* -โบ  '..t..'\nโน : *ููุงุญุถู ุนูุงูุฉ ุงูู*โฏ *ุชุนูู ุงู ุงูุจูุช ุงุฏูู ูู ูุฐู ุงููุฌููุนู*'
Dev_Ali(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'ุญุฐู ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ุทุฑุฏ ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ูุณุญ ุงูุจูุชุงุช' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(LaUrEn) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : *ุนุฏุฏ ุงูุจูุชุงุช ููุง* -โบ  "..c.."\nโน : *ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* -โบ  "..x.."\nโน : *ุชู ุทุฑุฏ* -โบ  "..(c - x).." *ูู ุงูุจูุชุงุช*", 1, 'md')
end 
end,nil)  
end 
--     Source LaUrEn     --
end
--     Source LaUrEn     --
if Admin(msg) then
if text and text:match("^ุญุฐู (.*)$") or text and text:match("^ูุณุญ (.*)$") then
local txts = {string.match(text, "^(ุญุฐู) (.*)$")}
local txtss = {string.match(text, "^(ูุณุญ) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'ุงูุซุงููููู' or txtss[2] == 'ุงูุซุงููููู' or txts[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' or txtss[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' then
DevAli:del(LaUrEn..'Ali:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุทูุฑูู ุงูุซุงููููู")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'ุงููุทูุฑูู' or txtss[2] == 'ุงููุทูุฑูู' then
DevAli:del(LaUrEn..'Ali:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุทูุฑูู")  
end
if txts[2] == 'ูุงุฆูู ุงูุนุงู' or txtss[2] == 'ูุงุฆูู ุงูุนุงู' then
DevAli:del(LaUrEn..'Ali:BanAll:')
DevAli:del(LaUrEn..'Ali:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูุงุฆูุฉ ุงูุนุงู")  
end
end
if SudoBot(msg) then
if txts[2] == 'ุงูุงุฏูููู ุงูุนุงููู' or txts[2] == 'ุงูุงุฏูููู ุงูุนุงู' or txtss[2] == 'ุงูุงุฏูููู ุงูุนุงููู' or txtss[2] == 'ุงูุงุฏูููู ุงูุนุงู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูุงุฏูููู ุงูุนุงููู")  
DevAli:del(LaUrEn..'Ali:AdminAll:')
end
if txts[2] == 'ุงููููุฒูู ุนุงู' or txts[2] == 'ุงููููุฒูู ุงูุนุงููู' or txtss[2] == 'ุงููููุฒูู ุนุงู' or txtss[2] == 'ุงููููุฒูู ุงูุนุงููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููููุฒูู ุนุงู")  
DevAli:del(LaUrEn..'Ali:VipAll:')
end
if txts[2] == 'ุงููุฏุฑุงุก ุงูุนุงููู' or txts[2] == 'ุงููุฏุฑุงุก ุงูุนุงู' or txtss[2] == 'ุงููุฏุฑุงุก ุงูุนุงููู' or txtss[2] == 'ุงููุฏุฑุงุก ุงูุนุงู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุฏุฑุงุก ุงูุนุงููู")  
DevAli:del(LaUrEn..'Ali:ManagerAll:')
end
if txts[2] == 'ุงููุงูููู' or txtss[2] == 'ุงููุงูููู' then
DevAli:del(LaUrEn..'Ali:AliConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,dp) 
local admins = dp.members_
for i=0 , #admins do
if dp.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAli:sadd(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุงูููู")  
end
end
if AliConstructor(msg) then
if txts[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' or txtss[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู")  
DevAli:del(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'ุงูููุดุฆูู' or txtss[2] == 'ุงูููุดุฆูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูููุดุฆูู")  
DevAli:del(LaUrEn..'Ali:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'ุงููุฏุฑุงุก' or txtss[2] == 'ุงููุฏุฑุงุก' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุฏุฑุงุก")  
DevAli:del(LaUrEn..'Ali:Managers:'..msg.chat_id_)
end 
if txts[2] == 'ุงูููุธููู' or txtss[2] == 'ุงูููุธููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูููุธููู")  
DevAli:del(LaUrEn..'Ali:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'ุงูุงุฏูููู' or txtss[2] == 'ุงูุงุฏูููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูุงุฏูููู")  
DevAli:del(LaUrEn..'Ali:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'ููุงููู' or txtss[2] == 'ููุงููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูููุงููู")  
DevAli:del(LaUrEn..'Ali:rules'..msg.chat_id_)
end
if txts[2] == 'ุงููุทุงูู' or txtss[2] == 'ุงููุทุงูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุทุงูู")  
DevAli:del(LaUrEn..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'ุงูุฑุงุจุท' or txtss[2] == 'ุงูุฑุงุจุท' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุฑุงุจุท ุงููุฌููุนู")  
DevAli:del(LaUrEn.."Ali:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'ุงููููุฒูู' or txtss[2] == 'ุงููููุฒูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููููุฒูู")  
DevAli:del(LaUrEn..'Ali:VipMem:'..msg.chat_id_)
end
if txts[2] == 'ุงูููุชูููู' or txtss[2] == 'ุงูููุชูููู' then
DevAli:del(LaUrEn..'Ali:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูููุชูููู")  
end
if txts[2] == 'ุงููููุฏูู' or txtss[2] == 'ุงููููุฏูู' then     
local List = DevAli:smembers(LaUrEn..'Ali:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAli:srem(LaUrEn..'Ali:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููููุฏูู")  
end
if txts[2] == 'ูุงุฆูู ุงูููุน' or txtss[2] == 'ูุงุฆูู ุงูููุน' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูุงุฆูุฉ ุงูููุน")  
DevAli:del(LaUrEn..'Ali:Filters:'..msg.chat_id_)
end
if txts[2] == 'ููุงุฆู ุงูููุน' or txtss[2] == 'ููุงุฆู ุงูููุน' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ููุงุฆู ุงูููุน")  
DevAli:del(LaUrEn..'Ali:Filters:'..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:FilterAnimation"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:FilterPhoto"..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' then     
DevAli:del(LaUrEn.."Ali:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงููุชุญุฑูุงุช")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' or txtss[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' then     
DevAli:del(LaUrEn.."Ali:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูุตูุฑ")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' then     
DevAli:del(LaUrEn.."Ali:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูููุตูุงุช")  
end
end
end
--     Source LaUrEn     --
if text and text:match("^ุญุฐู ุงูููุงุฆู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูููุงุฆู$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ููููุดุฆ ุงูุงุณุงุณู ููุท', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:Ban:'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:Admins:'..msg.chat_id_) DevAli:del(LaUrEn..'User:Donky:'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:VipMem:'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:Filters:'..msg.chat_id_) DevAli:del(LaUrEn..'Ali:Muted:'..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู -โบ  โจ ูุงุฆูุฉ ุงูููุน โข ุงููุญุธูุฑูู โข ุงูููุชูููู โข ุงูุงุฏูููู โข ุงููููุฒูู โข ุงููุทุงูู โฉ ุจูุฌุงุญ \n โ", 1, 'md')
end end
--     Source LaUrEn     --
if text and text:match("^ุญุฐู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ูุณุญ ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ุชูุฒูู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) then
if not AliConstructor(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุงูููู ููุท', 1, 'md')
else
local basicconstructor = DevAli:smembers(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_)
local constructor = DevAli:smembers(LaUrEn..'Ali:Constructor:'..msg.chat_id_)
local Managers = DevAli:smembers(LaUrEn..'Ali:Managers:'..msg.chat_id_)
local admins = DevAli:smembers(LaUrEn..'Ali:Admins:'..msg.chat_id_)
local vipmem = DevAli:smembers(LaUrEn..'Ali:VipMem:'..msg.chat_id_)
local donky = DevAli:smembers(LaUrEn..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'ุงูููุดุฆูู โข ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'ุงููุฏุฑุงุก โข ' else Managerst = '' end
if #admins ~= 0 then adminst = 'ุงูุงุฏูููู โข ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'ุงููููุฒูู โข ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'ุงููุทุงูู โข ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAli:del(LaUrEn..'Ali:BasicConstructor:'..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Constructor:'..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Managers:'..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Admins:'..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:VipMem:'..msg.chat_id_)
DevAli:del(LaUrEn..'User:Donky:'..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ุฌููุน ุงูุฑุชุจ ุงูุชุงููู -โบ  โจ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." โฉ ุจูุฌุงุญ \n โ", 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงุชูุฌุฏ ุฑุชุจ ููุง", 1, 'md')
end 
end 
end
--     Source LaUrEn     --
if Admin(msg) then 
if text and text:match("^ุงูุงุนุฏุงุฏุงุช$") and ChCheck(msg) then
if not DevAli:get(LaUrEn..'Ali:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAli:get(LaUrEn..'Ali:Spam:Text'..msg.chat_id_)
end
--     Source LaUrEn     --
if DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "ุจุงูุทุฑุฏ"     
elseif DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "ุจุงูุชููุฏ"     
elseif DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "ุจุงููุชู"           
elseif DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "ุจุงูุญุฐู"
else     
flood = "ููุชูุญ"     
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "ุจุงูุญุฐู"
elseif DevAli:get(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "ุจุงูุชููุฏ"   
elseif DevAli:get(LaUrEn.."Ali:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "ุจุงูุทุฑุฏ"    
else
lock_bots = "ููุชูุญู"    
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn..'Ali:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู'end
if DevAli:get(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_) then mute_photo = 'ููููู' else mute_photo = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_) then mute_video = 'ููููู' else mute_video = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ููููู' else mute_gifs = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Music'..msg.chat_id_) then mute_music = 'ููููู' else mute_music = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_) then mute_in = 'ููููู' else mute_in = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ููููู' else mute_edit = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:NightClub'..msg.chat_id_) then mute_nightclub = 'ูููู' else mute_nightclub = 'ููุชูุญ' end
if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_) then lock_pin = 'ููููู' else lock_pin = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ููููู' else lock_sticker = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ููููู' else lock_tgservice = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ููููู' else lock_wp = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ููููู' else lock_htag = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then lock_tag = 'ููููู' else lock_tag = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Location'..msg.chat_id_) then lock_location = 'ููููู' else lock_location = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_) then lock_contact = 'ููููู' else lock_contact = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then lock_english = 'ููููู' else lock_english = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ููููู' else lock_arabic = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ููููู' else lock_forward = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Document'..msg.chat_id_) then lock_file = 'ููููู' else lock_file = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_) then markdown = 'ููููู' else markdown = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_) then lock_spam = 'ููููู' else lock_spam = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Join'..msg.chat_id_) then lock_Join = 'ูููู' else lock_Join = 'ููุชูุญ' end
if DevAli:get(LaUrEn.."Ali:Lock:Welcome"..msg.chat_id_) then send_welcome = 'ููููู' else send_welcome = 'ููุชูุญู' end
if DevAli:get(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end
if DevAli:get(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end
if DevAli:get(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end
if DevAli:get(LaUrEn..'Ali:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'ููููู' else lock_farsi = 'ููุชูุญู' end
local Flood_Num = DevAli:hget(LaUrEn.."Ali:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source LaUrEn     --
local TXTE = "โน : ุงุนุฏุงุฏุงุช ุงููุฌููุนู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n"
.."โน : ุงูุฑูุงุจุท -โบ  "..mute_links.."\n"
.."โน : ุงููุนุฑู -โบ  "..lock_tag.."\n"
.."โน : ุงูุจูุชุงุช -โบ  "..lock_bots.."\n"
.."โน : ุงููุชุญุฑูู -โบ  "..mute_gifs.."\n"
.."โน : ุงูููุตูุงุช -โบ  "..lock_sticker.."\n"
.."โน : ุงููููุงุช -โบ  "..lock_file.."\n"
.."โน : ุงูุตูุฑ -โบ  "..mute_photo.."\n"
.."โน : ุงูููุฏูู -โบ  "..mute_video.."\n"
.."โน : ุงูุงูููุงูู -โบ  "..mute_in.."\n"
.."โน : ุงูุฏุฑุฏุดู -โบ  "..mute_text.."\n"
.."โน : ุงูุชูุฌูู -โบ  "..lock_forward.."\n"
.."โน : ุงูุงุบุงูู -โบ  "..mute_music.."\n"
.."โน : ุงูุตูุช -โบ  "..mute_voice.."\n"
.."โน : ุงูุฌูุงุช -โบ  "..lock_contact.."\n"
.."โน : ุงููุงุฑูุฏุงูู -โบ  "..markdown.."\n"
.."โน : ุงููุงุดุชุงู -โบ  "..lock_htag.."\n"
.."โน : ุงูุชุนุฏูู -โบ  "..mute_edit.."\n"
.."โน : ุงูุงุจุงุญู -โบ  "..mute_nightclub.."\n"
.."โน : ุงูุชุซุจูุช -โบ  "..lock_pin.."\n"
.."โน : ุงูุงุดุนุงุฑุงุช -โบ  "..lock_tgservice.."\n"
.."โน : ุงูููุงูุด -โบ  "..lock_spam.."\n"
.."โน : ุงูุฏุฎูู -โบ  "..lock_Join.."\n"
.."โน : ุงูุดุจูุงุช -โบ  "..lock_wp.."\n"
.."โน : ุงูููุงูุน -โบ  "..lock_location.."\n"
.."โน : ุงููุดุงุฑ -โบ  "..lock_fshar.."\n"
.."โน : ุงูููุฑ -โบ  "..lock_kaf.."\n"
.."โน : ุงูุทุงุฆููู -โบ  "..lock_taf.."\n"
.."โน : ุงูุนุฑุจูู -โบ  "..lock_arabic.."\n"
.."โน : ุงูุงููููุฒูู -โบ  "..lock_english.."\n"
.."โน : ุงููุงุฑุณูู -โบ  "..lock_farsi.."\n"
.."โน : ุงูุชูุฑุงุฑ -โบ  "..flood.."\n"
.."โน : ุนุฏุฏ ุงูุชูุฑุงุฑ -โบ  "..Flood_Num.."\n"
.."โน : ุนุฏุฏ ุงูุณุจุงู -โบ  "..spam_c.."\n"
.."โโโโโโ ๐ฃ โโโโโโ\nโน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)\n"
Dev_Ali(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source LaUrEn     --
if text and text:match("^ููู (.*)$") then
local txt = {string.match(text, "^(ููู) (.*)$")}
Dev_Ali(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if text == "ุชูุนูู ุงูุทู" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ููุฒุฉ ุงูุทู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Antk:Ali'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุทู" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ููุฒุฉ ุงูุทู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Antk:Ali'..msg.chat_id_,true)  
end
if text and text:match("^ุงูุทู (.*)$") and not DevAli:get(LaUrEn..'Ali:Antk:Ali'..msg.chat_id_) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^ุงูุทู (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source LaUrEn     --
if DevAli:get(LaUrEn..'Ali:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
DevAli:del(LaUrEn..'Ali:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAli:del(LaUrEn..'Ali:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:rules'..msg.chat_id_,text)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
return false   
end
if text and text:match("^ุถุน ููุงููู$") and ChCheck(msg) or text and text:match("^ูุถุน ููุงููู$") and ChCheck(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ุงูููุงููู ุงูุงู', 1, 'md')
DevAli:set(LaUrEn..'Ali:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^ุงูููุงููู$") then
local rules = DevAli:get(LaUrEn..'Ali:rules'..msg.chat_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source LaUrEn     --
if text == 'ุฑููู' then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "โน : ุฑููู -โบ  +"..result.phone_number_
else
MyNumber = "โน : ุฑููู ููุถูุน ูุฌูุงุช ุงุชุตุงูู ููุท"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source LaUrEn     --
if text == "ุชูุนูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุฒุฎุฑูู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Zrf:Ali'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุฒุฎุฑูู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Zrf:Ali'..msg.chat_id_,true)  
end
if DevAli:get(LaUrEn..'Zrf:Ali'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุฒุฎุฑูู', 1, 'md')
DevAli:del(LaUrEn..'Zrf:Ali'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "โน : ูุงุฆูุฉ ุงูุฒุฎุฑูู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAli:del(LaUrEn..'Zrf:Ali'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevAli:get(LaUrEn..'Ali:Zrf:Ali'..msg.chat_id_) then
if text == 'ุฒุฎุฑูู' and ChCheck(msg) or text == 'ุงูุฒุฎุฑูู' and ChCheck(msg) then  
DevAli:setex(LaUrEn.."Zrf:Ali"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ุงููููู ูุฒุฎุฑูุชูุง \nููููู ุงูุฒุฎุฑูุฉ ุจุงููุบู { en } ~ { ar } ', 1, 'md')
end
end
if not DevAli:get(LaUrEn..'Ali:Zrf:Ali'..msg.chat_id_) then
if text and text:match("^ุฒุฎุฑูู (.*)$") and ChCheck(msg) or text and text:match("^ุฒุฎุฑู (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^ุฒุฎุฑูู (.*)$") or text:match("^ุฒุฎุฑู (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "โน : ูุงุฆูุฉ ุงูุฒุฎุฑูู -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source LaUrEn     --
if text == "ุชูุนูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงุจุฑุงุฌ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Brg:Ali'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงุจุฑุงุฌ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Brg:Ali'..msg.chat_id_,true)  
end
if not DevAli:get(LaUrEn..'Ali:Brg:Ali'..msg.chat_id_) then
if text and text:match("^ุจุฑุฌ (.*)$") and ChCheck(msg) or text and text:match("^ุจุฑุฌู (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^ุจุฑุฌ (.*)$") or text:match("^ุจุฑุฌู (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LaUrEn     --
if text and (text == "ุชูุนูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชูุนูู " or text == "ุชูุนูู ูุณุจู ุงููุฑู" or text == "ุชูุนูู ูุณุจู ุงูุฑุฌููู" or text == "ุชูุนูู ูุณุจู ุงูุงููุซู" or text == "ุชูุนูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงูุฑ ุงููุณุจ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชุนุทูู ูุณุจู ุงูุญุจ" or text == "ุชุนุทูู ูุณุจู ุงููุฑู" or text == "ุชุนุทูู ูุณุจู ุงูุฑุฌููู" or text == "ุชุนุทูู ูุณุจู ุงูุงููุซู" or text == "ุชุนุทูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงูุฑ ุงููุณุจ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_,true)  
end
if not DevAli:get(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) then
if text == "ูุณุจู ุงูุญุจ" and ChCheck(msg) or text == "ูุณุจุฉ ุงูุญุจ" and ChCheck(msg) then
DevAli:set(LaUrEn..'LoveNsba:Ali'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงูุญุจ ุจููููุง ููุซุงู -โบ  ุฌุงู ูุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุญุจ" and text ~= "ูุณุจุฉ ุงูุญุจ" and DevAli:get(LaUrEn..'LoveNsba:Ali'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุญุจ ', 1, 'md')
DevAli:del(LaUrEn..'LoveNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Ali = math.random(0,100);
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุณุจุฉ ุงูุญุจ ุจูู '..text..' ูู : '..Ali..'%', 1, 'md')
DevAli:del(LaUrEn..'LoveNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAli:get(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) then
if text == "ูุณุจู ุงููุฑู" and ChCheck(msg) or text == "ูุณุจุฉ ุงููุฑู" and ChCheck(msg) then
DevAli:set(LaUrEn..'HataNsba:Ali'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงููุฑู ุจููููุง ููุซุงู -โบ  ุฌุงู ูุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงููุฑู" and text ~= "ูุณุจุฉ ุงููุฑู" and DevAli:get(LaUrEn..'HataNsba:Ali'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงููุฑู ', 1, 'md')
DevAli:del(LaUrEn..'HataNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Ali = math.random(0,100);
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุณุจุฉ ุงููุฑู ุจูู '..text..' ูู : '..Ali..'%', 1, 'md')
DevAli:del(LaUrEn..'HataNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAli:get(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุฑุฌููู" or text == "ูุณุจุฉ ุงูุฑุฌููู" or text == "ูุณุจู ุฑุฌููู" or text == "ูุณุจุฉ ุฑุฌููู") and ChCheck(msg) then
DevAli:set(LaUrEn..'RjolaNsba:Ali'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุฑุฌููุชู ููุซุงู -โบ  ุฌุงู', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุฑุฌููู" and text ~= "ูุณุจุฉ ุงูุฑุฌููู" and text ~= "ูุณุจู ุฑุฌููู" and text ~= "ูุณุจุฉ ุฑุฌููู" and DevAli:get(LaUrEn..'RjolaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุฑุฌููู ', 1, 'md')
DevAli:del(LaUrEn..'RjolaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Ali = math.random(0,100);
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุณุจุฉ ุฑุฌููุฉ '..text..' ูู : '..Ali..'%', 1, 'md')
DevAli:del(LaUrEn..'RjolaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAli:get(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุงููุซู" or text == "ูุณุจุฉ ุงูุงููุซู" or text == "ูุณุจู ุงููุซู" or text == "ูุณุจุฉ ุงููุซู") and ChCheck(msg) then
DevAli:set(LaUrEn..'AnothaNsba:Ali'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุงููุซุชู ููุซุงู -โบ  ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุงููุซู" and text ~= "ูุณุจุฉ ุงูุงููุซู" and text ~= "ูุณุจู ุงููุซู" and text ~= "ูุณุจุฉ ุงููุซู" and DevAli:get(LaUrEn..'AnothaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุงููุซู ', 1, 'md')
DevAli:del(LaUrEn..'AnothaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Ali = math.random(0,100);
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุณุจุฉ ุงููุซุฉ '..text..' ูู : '..Ali..'%', 1, 'md')
DevAli:del(LaUrEn..'AnothaNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAli:get(LaUrEn..'Ali:Nsba:Ali'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุบุจุงุก" or text == "ูุณุจุฉ ุงูุบุจุงุก") and ChCheck(msg) then
DevAli:set(LaUrEn..'StupidNsba:Ali'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุบุจุงุฆู ููุซุงู -โบ  ุฌุงู ุงู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุบุจุงุก" and text ~= "ูุณุจุฉ ุงูุบุจุงุก" and DevAli:get(LaUrEn..'StupidNsba:Ali'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุบุจุงุก ', 1, 'md')
DevAli:del(LaUrEn..'StupidNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Ali = math.random(0,100);
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุณุจุฉ ุบุจุงุก '..text..' ูู : '..Ali..'%', 1, 'md')
DevAli:del(LaUrEn..'StupidNsba:Ali'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source LaUrEn     --
if text == "ุชูุนูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุญุณุงุจ ุงูุนูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Age:Ali'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุญุณุงุจ ุงูุนูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Age:Ali'..msg.chat_id_,true)  
end
if not DevAli:get(LaUrEn..'Ali:Age:Ali'..msg.chat_id_) then
if text and text:match("^ุงุญุณุจ (.*)$") and ChCheck(msg) or text and text:match("^ุนูุฑู (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^ุงุญุณุจ (.*)$") or text:match("^ุนูุฑู (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LaUrEn     --
if text == "ุชูุนูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ูุนุงูู ุงูุงุณูุงุก'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Mean:Ali'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ูุนุงูู ุงูุงุณูุงุก'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Mean:Ali'..msg.chat_id_,true)  
end
if not DevAli:get(LaUrEn..'Ali:Mean:Ali'..msg.chat_id_) then
if text and text:match("^ูุนูู ุงูุงุณู (.*)$") and ChCheck(msg) or text and text:match("^ูุนูู ุงุณู (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^ูุนูู ุงูุงุณู (.*)$") or text:match("^ูุนูู ุงุณู (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Ali(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LaUrEn     --
if text == "ุบูููู" and ChCheck(msg) then
data,res = https.request('https://apiabs.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='โข ุชุน ุูููู?ู?ูฐู ุบููุชูู ๐ฆ'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน  .',url="t.me/iinzzz"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id='..msg.chat_id_..'&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text and (text == "ูุชุญุฑูู" or text == "-โบ ูุชุญุฑูู แฅ") and not DevAli:get(LaUrEn..'Ali:gif:Ali'..msg.chat_id_) and SourceCh(msg) then
Ali = math.random(2,1075); 
local Text ='*แฅ๏ธุชู ุงุฎุชูุงุฑ ุงููุชุญุฑูู ูู*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'แฅ SNAP Team .',url="t.me/iinzzz"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://MemzLaricA/'..Ali..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) st("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/iinzzz/'..Ali..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LaUrEn     --
if Admin(msg) then
if DevAli:get(LaUrEn..'Ali:LockSettings'..msg.chat_id_) then 
if text == "ุงูุฑูุงุจุท" then if DevAli:get(LaUrEn..'Ali:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุฑูุงุจุท -โบ  "..mute_links.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงููุนุฑู" or text == "ุงููุนุฑูุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:Tags'..msg.chat_id_) then lock_tag = 'ูููููู' else lock_tag = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงููุนุฑู -โบ  "..lock_tag.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงููุชุญุฑูู" or text == "ุงูููุตูุงุช ุงููุชุญุฑูู" then if DevAli:get(LaUrEn..'Ali:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ูููููู' else mute_gifs = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงููุชุญุฑูู -โบ  "..mute_gifs.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูููุตูุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ูููููู' else lock_sticker = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูููุตูุงุช -โบ  "..lock_sticker.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุตูุฑ" then if DevAli:get(LaUrEn..'Ali:Lock:Photo'..msg.chat_id_) then mute_photo = 'ูููููู' else mute_photo = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุตูุฑ -โบ  "..mute_photo.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูููุฏูู" or text == "ุงูููุฏูููุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:Videos'..msg.chat_id_) then mute_video = 'ูููููู' else mute_video = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูููุฏูู -โบ  "..mute_video.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุงูููุงูู" then if DevAli:get(LaUrEn..'Ali:Lock:Inline'..msg.chat_id_) then mute_in = 'ูููู' else mute_in = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุงูููุงูู -โบ  "..mute_in.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุฏุฑุฏุดู" then if DevAli:get(LaUrEn..'Ali:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุฏุฑุฏุดู -โบ  "..mute_text.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุชูุฌูู" or text == "ุงุนุงุฏู ุงูุชูุฌูู" then if DevAli:get(LaUrEn..'Ali:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ูููู' else lock_forward = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุชูุฌูู -โบ  "..lock_forward.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุงุบุงูู" then if DevAli:get(LaUrEn..'Ali:Lock:Music'..msg.chat_id_) then mute_music = 'ูููููู' else mute_music = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุงุบุงูู -โบ  "..mute_music.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุตูุช" or text == "ุงูุตูุชูุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุตูุช -โบ  "..mute_voice.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุฌูุงุช" or text == "ุฌูุงุช ุงูุงุชุตุงู" then if DevAli:get(LaUrEn..'Ali:Lock:Contact'..msg.chat_id_) then lock_contact = 'ูููููู' else lock_contact = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุฌูุงุช -โบ  "..lock_contact.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงููุงุฑูุฏุงูู" then if DevAli:get(LaUrEn..'Ali:Lock:Markdown'..msg.chat_id_) then markdown = 'ูููู' else markdown = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงููุงุฑูุฏุงูู -โบ  "..markdown.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงููุงุดุชุงู" then if DevAli:get(LaUrEn..'Ali:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ูููู' else lock_htag = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงููุงุดุชุงู -โบ  "..lock_htag.."\n"Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุชุนุฏูู" then if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ูููู' else mute_edit = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุชุนุฏูู -โบ  "..mute_edit.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุชุซุจูุช" then if DevAli:get(LaUrEn..'Ali:Lock:Pin'..msg.chat_id_) then lock_pin = 'ูููู' else lock_pin = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุชุซุจูุช -โบ  "..lock_pin.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุงุดุนุงุฑุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ูููููู' else lock_tgservice = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุงุดุนุงุฑุงุช -โบ  "..lock_tgservice.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูููุงูุด" then if DevAli:get(LaUrEn..'Ali:Lock:Spam'..msg.chat_id_) then lock_spam = 'ูููููู' else lock_spam = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูููุงูุด -โบ  "..lock_spam.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุฏุฎูู" then if DevAli:get(LaUrEn..'Ali:Lock:Join'..msg.chat_id_) then lock_Join = 'ููููู' else lock_Join = 'ููุชูุญ' end local LaUrEnTEAM = "\n" .."โน : ุงูุฏุฎูู -โบ  "..lock_Join.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุดุจูุงุช" then if DevAli:get(LaUrEn..'Ali:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ูููููู' else lock_wp = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุดุจูุงุช -โบ  "..lock_wp.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูููุงูุน" then if DevAli:get(LaUrEn..'Ali:Lock:Location'..msg.chat_id_) then lock_location = 'ูููููู' else lock_location = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูููุงูุน -โบ  "..lock_location.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุนุฑุจูู" then if DevAli:get(LaUrEn..'Ali:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ูููููู' else lock_arabic = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุนุฑุจูู -โบ  "..lock_arabic.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุงููููุฒูู" then if DevAli:get(LaUrEn..'Ali:Lock:English'..msg.chat_id_) then lock_english = 'ูููููู' else lock_english = 'ููุชูุญู' end local LaUrEnTEAM = "\n" .."โน : ุงูุงููููุฒูู -โบ  "..lock_english.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูููุฑ" then if DevAli:get(LaUrEn..'Ali:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end local LaUrEnTEAM = "\n" .."โน : ุงูููุฑ -โบ  "..lock_kaf.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงููุดุงุฑ" then if DevAli:get(LaUrEn..'Ali:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end local LaUrEnTEAM = "\n" .."โน : ุงููุดุงุฑ -โบ  "..lock_fshar.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
if text == "ุงูุทุงุฆููู" then if DevAli:get(LaUrEn..'Ali:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end local LaUrEnTEAM = "\n" .."โน : ุงูุทุงุฆููู -โบ  "..lock_taf.."\n" Dev_Ali(msg.chat_id_, msg.id_, 1, LaUrEnTEAM, 1, 'md') end
end
--     Source LaUrEn     --
if text == 'ุชูุนูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ูุดู ุงูุงุนุฏุงุฏุงุช'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:LockSettings'..msg.chat_id_,true)  
end
if text == 'ุชุนุทูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ูุดู ุงูุงุนุฏุงุฏุงุช'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:LockSettings'..msg.chat_id_) 
end
--     Source LaUrEn     --
if text == 'ุชูุนูู ุงูุงูุฑ ุงูุชุญุดูุด' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงูุฑ ุงูุชุญุดูุด'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุงูุงูุฑ ุงูุชุญุดูุด' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงูุฑ ุงูุชุญุดูุด'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Stupid'..msg.chat_id_,true)
end
--     Source LaUrEn     --
if text and (text == 'ุชุนุทูู ุงูุชุญูู' or text == 'ููู ุงูุชุญูู' or text == 'ุชุนุทูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุชุญูู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'ุชูุนูู ุงูุชุญูู' or text == 'ูุชุญ ุงูุชุญูู' or text == 'ุชูุนูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุชุญูู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Robot'..msg.chat_id_,true)
end
--     Source LaUrEn     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:GpRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:GpRed'..msg.chat_id_,true)
end
--     Source LaUrEn     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุฑุฏูุฏ ุงููุทูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:AllRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุฑุฏูุฏ ุงููุทูุฑ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:AllRed'..msg.chat_id_,true)
end
--     Source LaUrEn     --
if SecondSudo(msg) then
if text == 'ุชูุนูู ุงููุบุงุฏุฑู' or text == '-โบ  ุชูุนูู ุงููุบุงุฏุฑู โช' then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงููุบุงุฏุฑู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn.."Ali:Left:Bot"..LaUrEn)
end
if text == 'ุชุนุทูู ุงููุบุงุฏุฑู' or text == '-โบ  ุชุนุทูู ุงููุบุงุฏุฑู โช' then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงููุบุงุฏุฑู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn.."Ali:Left:Bot"..LaUrEn,true) 
end 
if text == 'ุชูุนูู ุงูุงุฐุงุนู' or text == '-โบ  ุชูุนูู ุงูุงุฐุงุนู โช' then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงุฐุงุนู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn.."Ali:Send:Bot"..LaUrEn)
end
if text == 'ุชุนุทูู ุงูุงุฐุงุนู' or text == '-โบ  ุชุนุทูู ุงูุงุฐุงุนู โช' then 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงุฐุงุนู ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn.."Ali:Send:Bot"..LaUrEn,true) 
end
end
--     Source LaUrEn     --
if text and text:match("^ุถุน ุงุณู (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ุถุน ุงุณู) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"โน : ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุบูุฑ ุงุณู ุงููุฌููุนู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source LaUrEn     --
if msg.content_.photo_ then
if DevAli:get(LaUrEn..'Ali:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"โน : ุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู ูุงููุญุงููู ูุงุญูุง") 
DevAli:del(LaUrEn..'Ali:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช") 
DevAli:del(LaUrEn..'Ali:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุบูุฑ ุตูุฑุฉ ุงููุฌููุนู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevAli:del(LaUrEn..'Ali:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ุถุน ุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุถุน ุตูุฑู$") and ChCheck(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, 'โน : ุงุฑุณู ุตูุฑุฉ ุงููุฌููุนู ุงูุงู', 1, 'md')
DevAli:set(LaUrEn..'Ali:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source LaUrEn     --
if text and text:match("^ุญุฐู ุงูุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุตูุฑู$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุตูุฑุฉ ุงููุฌููุนู")  
return false  
end
--     Source LaUrEn     --
if Manager(msg) then
if text and text:match("^ุงูุบุงุก ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงูุบุงุก ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevAli:sismember(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, "โน : ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAli:del(LaUrEn..'Ali:PinnedMsg'..msg.chat_id_)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุงูุบุงุก ุชุซุจูุช ุงูุฑุณุงูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"โน : ุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     Source LaUrEn     --
if text and text:match("^ุงูุบุงุก ุชุซุจูุช ุงููู$") then  
if DevAli:sismember(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, "โน : ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุงูุบุงุก ุชุซุจูุช ุงููู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAli:del(LaUrEn.."Ali:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"โน : ุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     Source LaUrEn     --
if text and text:match("^ุงุนุงุฏู ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏู ุงูุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏุฉ ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevAli:sismember(LaUrEn.."Ali:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Ali(msg.chat_id_,msg.id_, 1, "โน : ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
local PinId = DevAli:get(LaUrEn..'Ali:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุงุนุงุฏุฉ ุชุซุจูุช ุงูุฑุณุงูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source LaUrEn     --
if text == 'ุทุฑุฏ ุงููุญุฐูููู' or text == 'ูุณุญ ุงููุญุฐูููู' or text == 'ุทุฑุฏ ุงูุญุณุงุจุงุช ุงููุญุฐููู' or text == 'ุญุฐู ุงููุญุฐูููู' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุทุฑุฏ ุงููุญุฐูููู")  
end,nil)
end
--     Source LaUrEn     --
if text and text:match("^ูุณุญ ุงููุญุธูุฑูู$") or text and text:match("^ุญุฐู ุงููุญุธูุฑูู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงููุทุฑูุฏูู$") or text and text:match("^ุญุฐู ุงููุทุฑูุฏูู$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Ali(msg.chat_id_, msg.id_, 0,'โน : *ูุง ููุฌุฏ ูุญุธูุฑูู*', 1, 'md')
DevAli:del(LaUrEn..'Ali:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevAli:del(LaUrEn..'Ali:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงููุญุธูุฑูู")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source LaUrEn     --
if text and text:match("^ูุนูููุงุช ุงููุฌููุนู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุนุถุงุก$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุฑูุจ$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุฏูููู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุญุธูุฑูู$") and ChCheck(msg) then
local Muted = DevAli:scard(LaUrEn.."Ali:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู -โบ  โจ '..dp.title_..' โฉ\nโน : ุงูุงูุฏู -โบ  โจ '..msg.chat_id_..' โฉ\nโน : ุนุฏุฏ ุงูุงุนุถุงุก -โบ  โจ *'..data.member_count_..'* โฉ\nโน : ุนุฏุฏ ุงูุงุฏูููู -โบ  โจ *'..data.administrator_count_..'* โฉ\nโน : ุนุฏุฏ ุงููุทุฑูุฏูู -โบ  โจ *'..data.kicked_count_..'* โฉ\nโน : ุนุฏุฏ ุงูููุชูููู -โบ  โจ *'..Muted..'* โฉ\nโน : ุนุฏุฏ ุฑุณุงุฆู ุงููุฌููุนู -โบ  โจ *'..(msg.id_/2097152/0.5)..'* โฉ\nโโโโโโ ๐ฃ โโโโโโ\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source LaUrEn     --
if text and text:match('^ูุดู (-%d+)') then
local ChatId = text:match('ูุดู (-%d+)') 
if not SudoBot(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑูู ููุท', 1, 'md')
else
local ConstructorList = DevAli:scard(LaUrEn.."Ali:Constructor:"..ChatId) or 0
local BanedList = DevAli:scard(LaUrEn.."Ali:Ban:"..ChatId) or 0
local ManagerList = DevAli:scard(LaUrEn.."Ali:Managers:"..ChatId) or 0
local MutedList = DevAli:scard(LaUrEn.."Ali:Muted:"..ChatId) or 0
local TkeedList = DevAli:scard(LaUrEn.."Ali:Ali:Tkeed:"..ChatId) or 0
local AdminsList = DevAli:scard(LaUrEn.."Ali:Admins:"..ChatId) or 0
local VipList = DevAli:scard(LaUrEn.."Ali:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/iinzzz' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Ali) 
if Ali.first_name_ ~= false then
ConstructorAli = "["..Ali.first_name_.."](T.me/"..(Ali.username_ or "iinzzz")..")"
else 
ConstructorAli = "ุญุณุงุจ ูุญุฐูู"
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงููุฌููุนู -โบ  ["..dp.title_.."]("..LinkGroup..")\nโน : ุงูุงูุฏู -โบ  ( `"..ChatId.."` )\nโน : ุงูููุดุฆ -โบ  "..ConstructorAli.."\nโน : ุนุฏุฏ ุงููุฏุฑุงุก -โบ  ( *"..ManagerList.."* )\nโน : ุนุฏุฏ ุงูููุดุฆูู -โบ  ( *"..ConstructorList.."* )\nโน : ุนุฏุฏ ุงูุงุฏูููู -โบ  ( *"..AdminsList.."* )\nโน : ุนุฏุฏ ุงููููุฒูู -โบ  ( *"..VipList.."* )\nโน : ุนุฏุฏ ุงููุญุธูุฑูู -โบ  ( *"..BanedList.."* )\nโน : ุนุฏุฏ ุงููููุฏูู -โบ  ( *"..TkeedList.."* )\nโน : ุนุฏุฏ ุงูููุชูููู -โบ  ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุดููุง", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source LaUrEn     --
if text and text:match("^ุบุงุฏุฑ (-%d+)$")  then
local Text = { string.match(text, "^(ุบุงุฏุฑ) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงููุฌููุนู -โบ  ["..dp.title_.."]\nโน : ุชูุช ุงููุบุงุฏุฑู ูููุง ุจูุฌุงุญ", 1, "md")
Dev_Ali(Text[2], 0, 1, "โน : ุจุงูุฑ ุงููุทูุฑ ุชู ูุบุงุฏุฑุฉ ูุฐู ุงููุฌููุนู ", 1, "md")  
ChatLeave(dp.id_, LaUrEn)
DevAli:srem(LaUrEn.."Ali:Groups", dp.id_)
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุบุงุฏุฑุชูุง", 1, "md")
end 
end,nil)
end 
end
--     Source LaUrEn     --
if text and text:match("^ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) or text and text:match("^ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) then
local Num = text:match("ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$")
DevAli:set(LaUrEn..'Ali:Num:Add:Bot',Num) 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ูุถุน ุนุฏุฏ ุงูุงุนุถุงุก -โบ  *'..Num..'* ุนุถู', 1, 'md')
end
--     Source LaUrEn     --
if text == 'ุชูุนูู ุงูุจูุช ุงูุฎุฏูู' then 
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุจูุช ุงูุฎุฏูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:FreeBot'..LaUrEn) 
end 
end
if text == 'ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู' then 
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:FreeBot'..LaUrEn,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'ุชูุนูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชูุนูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then   
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุงูุงูุนุงุจ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn..'Ali:Lock:Games'..msg.chat_id_) 
end
if text == 'ุชุนุทูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชุนุทูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then  
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุงูุงูุนุงุจ ุจูุฌุงุญ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn..'Ali:Lock:Games'..msg.chat_id_,true)  
end
if text == "ุชูุนูู ุงูุฑุงุจุท" or text == "ุชูุนูู ุฌูุจ ุงูุฑุงุจุท" then 
if Admin(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชูุนูู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:del(LaUrEn.."Ali:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "ุชุนุทูู ุงูุฑุงุจุท" or text == "ุชุนุทูู ุฌูุจ ุงูุฑุงุจุท" then 
if Admin(msg) then
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุชุนุทูู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
DevAli:set(LaUrEn.."Ali:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source LaUrEn     --
if text and text:match('^ุชูุนูู$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAli:get(LaUrEn..'Ali:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู -โบ  *'..(DevAli:get(LaUrEn..'Ali:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,alii) 
local admins = alii.members_
for i=0 , #admins do
if alii.members_[i].bot_info_ == false and alii.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAli:srem(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAli:sadd(LaUrEn..'Ali:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if alii.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAli:sadd(LaUrEn.."Ali:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAli:sadd(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAli:srem(LaUrEn.."Ali:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAli:srem(LaUrEn.."Ali:AliConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAli:sismember(LaUrEn..'Ali:Groups',msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","โน : ุชู ุชูุนูู ุงููุฌููุนู "..dp.title_)  
DevAli:sadd(LaUrEn.."Ali:Groups",msg.chat_id_)
if not DevAli:get(LaUrEn..'Ali:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAli:incrby(LaUrEn..'Ali:Sudos'..msg.sender_user_id_,1)
DevAli:set(LaUrEn..'Ali:SudosGp'..msg.sender_user_id_..msg.chat_id_,"ali")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAli:set(LaUrEn.."Ali:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"โน : ุชู ุชูุนูู ูุฌููุนู ุฌุฏูุฏู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\nโน : ุจูุงุณุทุฉ -โบ  "..Name.."\nโน : ุงุณู ุงููุฌููุนู -โบ  ["..NameChat.."]\nโน : ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู -โบ  โจ *"..NumMem.."* โฉ\nโน : ุงูุฏู ุงููุฌููุนู -โบ  โค \nโจ `"..msg.chat_id_.."` โฉ\nโน : ุฑุงุจุท ุงููุฌููุนู -โบ  โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูููุช -โบ  "..os.date("%I:%M%p").."\nโน : ุงูุชุงุฑูุฎ -โบ  "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'ุชุนุทูู' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAli:sismember(LaUrEn..'Ali:Groups',msg.chat_id_) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงููุฌููุนู ุจุงูุชุงููุฏ ูุนุทูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","โน : ุชู ุชุนุทูู ุงููุฌููุนู "..dp.title_)  
DevAli:srem(LaUrEn.."Ali:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAli:set(LaUrEn.."Ali:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"โน : ุชู ุชุนุทูู ูุฌููุนู ุฌุฏูุฏู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\nโน : ุจูุงุณุทุฉ -โบ  "..Name.."\nโน : ุงุณู ุงููุฌููุนู -โบ  ["..NameChat.."]\nโน : ุงูุฏู ุงููุฌููุนู -โบ  โค \nโจ `"..msg.chat_id_.."` โฉ\nโน : ุฑุงุจุท ุงููุฌููุนู -โบ  โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูููุช -โบ  "..os.date("%I:%M%p").."\nโน : ุงูุชุงุฑูุฎ -โบ  "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source LaUrEn     --
if text and text:match("^ุงููุทูุฑ$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "โน : ุฑุงุจุท ุงููุฌููุนู -โบ  โค\nโจ ["..LinkGroup.."] โฉ"
else
LinkGroup = 'โน : ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุฏุนูู ููุฐู ุงููุฌููุนู !'
end
if not Sudo(msg) then
SendText(DevId,"โน : ููุงู ูู ุจุญุงุฌู ุงูู ูุณุงุนุฏู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูุดุฎุต -โบ  "..Name.."\nโน : ุงุณู ุงููุฌููุนู -โบ  ["..NameChat.."]\nโน : ุงูุฏู ุงููุฌููุนู -โบ  โค \nโจ `"..msg.chat_id_.."` โฉ\n"..LinkGroup.."\nโโโโโโ ๐ฃ โโโโโโ\nโน : ุงูููุช -โบ  "..os.date("%I:%M%p").."\nโน : ุงูุชุงุฑูุฎ -โบ  "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source LaUrEn     --
if text == 'ุฌูุจ ูุณุฎู ุงูุณูุฑุณ' then
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './LaUrEn.lua', 'โน : ูุณุฎุฉ ููู ุณูุฑุณ ุณูุงุจ',dl_cb, nil)
end end
--     Source LaUrEn     --
if text == 'ุฑูุงุจุท ุงููุฑูุจุงุช' or text == 'ุฑูุงุจุท ุงููุฌููุนุงุช' then
if not Sudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
local List = DevAli:smembers(LaUrEn.."Ali:Groups")
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุง ุชูุฌุฏ ูุฌููุนุงุช ููุนูู', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุฌุงุฑู ุงุฑุณุงู ูุณุฎู ุชุญุชูู ุนูู -โบ  '..#List..' ูุฌููุนู', 1, 'md')
local Text = "โน : Source LaUrEn\nโน : File Bot Groups\nโโโโโโ ๐ฃ โโโโโโ\n"
for k,v in pairs(List) do
local GroupsManagers = DevAli:scard(LaUrEn.."Ali:Managers:"..v) or 0
local GroupsAdmins = DevAli:scard(LaUrEn.."Ali:Admins:"..v) or 0
local Groupslink = DevAli:get(LaUrEn.."Ali:Groups:Links" ..v)
Text = Text..k.." โฌ โค \nโน : Group ID โฌ "..v.."\nโน : Group Link โฌ "..(Groupslink or "Not Found").."\nโน : Group Managers โฌ "..GroupsManagers.."\nโน : Group Admins โฌ "..GroupsAdmins.."\nโโโโโโ ๐ฃ โโโโโโ\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source LaUrEn     --
if text == "ุงุฐุงุนู ุฎุงุต" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "-โบ  ุงุฐุงุนู ุฎุงุต โช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAli:setex(LaUrEn.."Ali:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุงุฑุณู ูู ุณูุงุก -โบ  โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก ) \n โ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAli:get(LaUrEn.."Ali:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAli:smembers(LaUrEn..'Ali:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AliText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AliText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AliText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AliText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AliText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AliText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AliText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AliText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุฐุงุนุฉ "..AliText.." ุจูุฌุงุญ \nโน : โุงูู -โบ  โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LaUrEn     --
if text == "ุงุฐุงุนู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "-โบ  ุงุฐุงุนู ุนุงู โช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAli:setex(LaUrEn.."Ali:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุงุฑุณู ูู ุณูุงุก -โบ  โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก ) \n โ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAli:get(LaUrEn.."Ali:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAli:smembers(LaUrEn..'Ali:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AliText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AliText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AliText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AliText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AliText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AliText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AliText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AliText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุฐุงุนุฉ "..AliText.." ุจูุฌุงุญ \nโน : โูู -โบ  โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LaUrEn     --
if text == "ุงุฐุงุนู ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "-โบ  ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู โช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAli:setex(LaUrEn.."Ali:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก ) \n โ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAli:get(LaUrEn.."Ali:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAli:smembers(LaUrEn..'Ali:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโน : โูู -โบ  โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LaUrEn     --
if text == "ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "-โบ  ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู โช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAli:setex(LaUrEn.."Ali:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก ) \n โ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAli:get(LaUrEn.."Ali:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAli:smembers(LaUrEn..'Ali:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโน : โุงูู -โบ  โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LaUrEn     --
if text == "ุงุฐุงุนู ุจุงูุชุซุจูุช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "-โบ  ุงุฐุงุนู ุจุงูุชุซุจูุช โช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAli:get(LaUrEn.."Ali:Send:Bot"..LaUrEn) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"โน : ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAli:setex(LaUrEn.."Ali:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุงุฑุณู ูู ุณูุงุก -โบ  โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก ) \n โ'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAli:get(LaUrEn.."Ali:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "ุงูุบุงุก" then   
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevAli:smembers(LaUrEn.."Ali:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AliText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AliText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AliText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AliText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AliText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AliText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AliText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AliText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAli:set(LaUrEn..'Ali:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุฐุงุนุฉ "..AliText.." ุจุงูุชุซุจูุช \nโน : โูู -โบ  โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAli:del(LaUrEn.."Ali:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source LaUrEn     --
if text == 'ุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏ ูู ูุชุนุฏุฏ' and Manager(msg) and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
return false
end
DevAli:set(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ูููุฉ ุงูุฑุฏ ุงููุง" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "ุงูุบุงุก" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevAli:sismember(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,text) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุงููุฌุฏ ุฑุฏ ูุชุนุฏุฏ ููุฐู ุงููููู -โบ  "..text ,  1, "md")
return false
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูู ุจุงุฑุณุงู ุงูุฑุฏ ุงููุชุนุฏุฏ ุงูุฐู ุชุฑูุฏ ุญุฐูู ูู ุงููููู -โบ  "..text ,  1, "md")
DevAli:set(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevAli:set(LaUrEn..'Ali:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text == 'ุญุฐู ุฑุฏ ูุชุนุฏุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏ ูุชุนุฏุฏ' and Manager(msg) and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
return false
end
DevAli:set(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง" ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ ูุชุนุฏุฏ' and Manager(msg) and ChCheck(msg) then
DevAli:set(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ุงูุงู" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRedod = DevAli:get(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "ุงูุบุงุก" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevAli:sismember(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,text) then
local Ali = "โน : ูุงุชุณุชุทูุน ุงุถุงูุฉ ุฑุฏ ุจุงูุชุงููุฏ ูุถุงู ูู ุงููุงุฆูู ูู ุจุญุฐูู ุงููุง !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุญุฐู ุงูุฑุฏ -โบ  "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Ali).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevAli:del(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงูุงูุฑ ุงุฑุณู ุงูุฑุฏ ุงูุงูู\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก )" ,  1, "md")
DevAli:set(LaUrEn..'Ali:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevAli:set(LaUrEn..'Ali:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevAli:sadd(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source LaUrEn     --
if text == 'ุญุฐู ุฑุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏ' and  Manager(msg) and ChCheck(msg) then
local List = DevAli:smembers(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
return false
end
DevAli:set(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ' and Manager(msg) and ChCheck(msg) then
DevAli:set(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAli:get(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "ุงูุบุงุก" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู -โบ  โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโน : ููููู ุงุถุงูุฉ ุงูู ุงููุต -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\nโโโโโโ ๐ฃ โโโโโโ\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก )\n โ" ,  1, "md")
DevAli:set(LaUrEn..'Ali:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevAli:set(LaUrEn..'Ali:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevAli:sadd(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_,text)
DevAli:set(LaUrEn..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source LaUrEn     --
if text == 'ุญุฐู ุฑุฏ ุนุงู' and SecondSudo(msg) or text == '-โบ  ุญุฐู ุฑุฏ ุนุงู โช' and SecondSudo(msg) or text == 'ูุณุญ ุฑุฏ ุนุงู' and SecondSudo(msg) then
local List = DevAli:smembers(LaUrEn.."Ali:Sudo:AllRed")
if #List == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
return false
end
DevAli:set(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ ุนุงู' and SecondSudo(msg) or text == '-โบ  ุงุถู ุฑุฏ ุนุงู โช' and SecondSudo(msg) then
DevAli:set(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAli:get(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "ุงูุบุงุก" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevAli:del(LaUrEn..'Ali:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู -โบ  โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโน : ููููู ุงุถุงูุฉ ุงูู ุงููุต -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\nโโโโโโ ๐ฃ โโโโโโ\nโน : ููุฎุฑูุฌ ุงุฑุณู -โบ  ( ุงูุบุงุก )\n โ" ,  1, "md")
DevAli:set(LaUrEn.."Ali:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAli:set(LaUrEn.."Ali:Add:AllText"..msg.sender_user_id_, text)
DevAli:sadd(LaUrEn.."Ali:Sudo:AllRed",text)
DevAli:set(LaUrEn.."DelSudoRep",text)
return false 
end end
--     Source LaUrEn     --
if text == 'ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู' and Manager(msg) and ChCheck(msg) then
local redod = DevAli:smembers(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_)
MsgRep = 'โน : ูุงุฆูุฉ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) โข {*ุงูุนุฏุฏ -โบ  '..#DevAli:smembers(LaUrEn..'Ali:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = 'โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู' and Manager(msg) and ChCheck(msg) then
local redod = DevAli:smembers(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevAli:del(LaUrEn..'Ali:Text:GpTexts'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู")  
return false
end
end
--     Source LaUrEn     --
if text == 'ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then
local redod = DevAli:smembers(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_)
MsgRep = 'โน : ุฑุฏูุฏ ุงููุฏูุฑ -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n'
for k,v in pairs(redod) do
if DevAli:get(LaUrEn.."Ali:Gif:GpRed"..v..msg.chat_id_) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevAli:get(LaUrEn.."Ali:Voice:GpRed"..v..msg.chat_id_) then
dp = 'ุจุตูู ๐'
elseif DevAli:get(LaUrEn.."Ali:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ููุตู ๐'
elseif DevAli:get(LaUrEn.."Ali:Text:GpRed"..v..msg.chat_id_) then
dp = 'ุฑุณุงูู โ'
elseif DevAli:get(LaUrEn.."Ali:Photo:GpRed"..v..msg.chat_id_) then
dp = 'ุตูุฑู ๐'
elseif DevAli:get(LaUrEn.."Ali:Video:GpRed"..v..msg.chat_id_) then
dp = 'ููุฏูู ๐ฝ'
elseif DevAli:get(LaUrEn.."Ali:File:GpRed"..v..msg.chat_id_) then
dp = 'ููู ๐'
elseif DevAli:get(LaUrEn.."Ali:Audio:GpRed"..v..msg.chat_id_) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) -โบ  {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = 'โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'ุญุฐู ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then
local redod = DevAli:smembers(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevAli:del(LaUrEn..'Ali:Gif:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Voice:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Audio:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Photo:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Stecker:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Video:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:File:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Text:GpRed'..v..msg.chat_id_)
DevAli:del(LaUrEn..'Ali:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ")  
return false
end
end
--     Source LaUrEn     --
if  text == "ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) or text == "ุงูุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "ุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "-โบ  ุงูุฑุฏูุฏ ุงูุนุงู โช" and SecondSudo(msg) then
local redod = DevAli:smembers(LaUrEn.."Ali:Sudo:AllRed")
MsgRep = 'โน : ุฑุฏูุฏ ุงููุทูุฑ -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n'
for k,v in pairs(redod) do
if DevAli:get(LaUrEn.."Ali:Gif:AllRed"..v) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevAli:get(LaUrEn.."Ali:Voice:AllRed"..v) then
dp = 'ุจุตูู ๐'
elseif DevAli:get(LaUrEn.."Ali:Stecker:AllRed"..v) then
dp = 'ููุตู ๐'
elseif DevAli:get(LaUrEn.."Ali:Text:AllRed"..v) then
dp = 'ุฑุณุงูู โ'
elseif DevAli:get(LaUrEn.."Ali:Photo:AllRed"..v) then
dp = 'ุตูุฑู ๐'
elseif DevAli:get(LaUrEn.."Ali:Video:AllRed"..v) then
dp = 'ููุฏูู ๐ฝ'
elseif DevAli:get(LaUrEn.."Ali:File:AllRed"..v) then
dp = 'ููู ๐'
elseif DevAli:get(LaUrEn.."Ali:Audio:AllRed"..v) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) -โบ  {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = 'โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == "ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) or text == "ุญุฐู ุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "ูุณุญ ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) then
local redod = DevAli:smembers(LaUrEn.."Ali:Sudo:AllRed")
if #redod == 0 then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevAli:del(LaUrEn.."Ali:Add:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Gif:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Voice:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Audio:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Photo:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Stecker:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Video:AllRed"..v)
DevAli:del(LaUrEn.."Ali:File:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Text:AllRed"..v)
DevAli:del(LaUrEn.."Ali:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โน : ุชู ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ")  
return false
end
end 
--     Source LaUrEn     --
if text and text == "ุชุบููุฑ ุงุณู ุงูุจูุช" or text and text == "ูุถุน ุงุณู ุงูุจูุช" or text and text == "ุชุบูุฑ ุงุณู ุงูุจูุช" then
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูู ุงุณู ุงูุจูุช ุงูุงู" ,  1, "md") 
DevAli:set(LaUrEn..'Ali:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'ุญุฐู ุงุณู ุงูุจูุช' or text == 'ูุณุญ ุงุณู ุงูุจูุช' then
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:NameBot')
local LaUrEnTEAM = 'โน : ุงููุง ุนุฒูุฒู -โบ  '..AliRank(msg)..' \nโน : ุชู ุญุฐู ุงุณู ุงูุจูุช'
alimoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LaUrEnTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source LaUrEn     --
if text and text:match("^ุงุณุชุนุงุฏู ุงูุงูุงูุฑ$") and SecondSudo(msg) or text and text:match("^ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ$") and SecondSudo(msg) then
HelpList ={'Ali:Help','Ali:Help1','Ali:Help2','Ali:Help3','Ali:Help4','Ali:Help5','Ali:Help6'}
for i,Help in pairs(HelpList) do
DevAli:del(LaUrEn..Help) 
end
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงุณุชุนุงุฏุฉ ุงูููุงูุด ุงูุงุตููู" ,  1, "md") 
end
if text == "ุชุนููู ุงูุงูุงูุฑ" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ุงูุงูุงูุฑ" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ุงูุงูุงูุฑ) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help0'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help0'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ุงูุงูุงูุฑ" or text == "ุงูุงูุฑ" or text == "ูุณุงุนุฏู" then
local Help = DevAli:get(LaUrEn..'Ali:Help')
local Text = [[
โน : ุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุงูุฑ -โบ  โค 
โโโโโโ ๐ฃ โโโโโโ
โน : ู1 -โบ  ุงูุงูุฑ ุงูุญูุงูู
โน : ู2 -โบ  ุงูุงูุฑ ุงูุงุฏูููู
โน : ู3 -โบ  ุงูุงูุฑ ุงููุฏุฑุงุก
โน : ู4 -โบ  ุงูุงูุฑ ุงูููุดุฆูู
โน : ู5 -โบ  ุงูุงูุฑ ุงููุทูุฑูู
โน : ู6 -โบ  ุงูุงูุฑ ุงูุงุนุถุงุก
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุงูุฑ ุงูุงุฏูููู",callback_data="/HelpList2:"..msg.sender_user_id_},{text="ุงูุงูุฑ ุงูุญูุงูู",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="ุงูุงูุฑ ุงูููุดุฆูู",callback_data="/HelpList4:"..msg.sender_user_id_},{text="ุงูุงูุฑ ุงููุฏุฑุงุก",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="ุงูุงูุฑ ุงูุงุนุถุงุก",callback_data="/HelpList6:"..msg.sender_user_id_},{text="ุงูุงูุฑ ุงููุทูุฑูู",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "ุชุนููู ุงูุฑ ู1" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููก" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู1) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help01'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help01'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help1', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู1" or text == "ููก" or text == "ุงูุงูุฑ1" or text == "ุงูุงูุฑูก" then
if not Admin(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโน : ุงุฑุณู -โบ  (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAli:get(LaUrEn..'Ali:Help1')
local Text = [[
โน : ุงูุงูุฑ ุญูุงูุฉ ุงููุฌููุนู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ููู โข ูุชุญ -โบ  ุงูุฑูุงุจุท
โน : ููู โข ูุชุญ -โบ  ุงููุนุฑูุงุช
โน : ููู โข ูุชุญ -โบ  ุงูุจูุชุงุช
โน : ููู โข ูุชุญ -โบ  ุงููุชุญุฑูู
โน : ููู โข ูุชุญ -โบ  ุงูููุตูุงุช
โน : ููู โข ูุชุญ -โบ  ุงููููุงุช
โน : ููู โข ูุชุญ -โบ  ุงูุตูุฑ
โน : ููู โข ูุชุญ -โบ  ุงูููุฏูู
โน : ููู โข ูุชุญ -โบ  ุงูุงูููุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุฏุฑุฏุดู
โน : ููู โข ูุชุญ -โบ  ุงูุชูุฌูู
โน : ููู โข ูุชุญ -โบ  ุงูุงุบุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุตูุช
โน : ููู โข ูุชุญ -โบ  ุงูุฌูุงุช
โน : ููู โข ูุชุญ -โบ  ุงููุงุฑูุฏุงูู
โน : ููู โข ูุชุญ -โบ  ุงูุชูุฑุงุฑ
โน : ููู โข ูุชุญ -โบ  ุงููุงุดุชุงู
โน : ููู โข ูุชุญ -โบ  ุงูุชุนุฏูู
โน : ููู โข ูุชุญ -โบ  ุงูุงุจุงุญู
โน : ููู โข ูุชุญ -โบ  ุงูุชุซุจูุช
โน : ููู โข ูุชุญ -โบ  ุงูุงุดุนุงุฑุงุช
โน : ููู โข ูุชุญ -โบ  ุงูููุงูุด
โน : ููู โข ูุชุญ -โบ  ุงูุฏุฎูู
โน : ููู โข ูุชุญ -โบ  ุงูุดุจูุงุช
โน : ููู โข ูุชุญ -โบ  ุงูููุงูุน
โน : ููู โข ูุชุญ -โบ  ุงููุดุงุฑ
โน : ููู โข ูุชุญ -โบ  ุงูููุฑ
โน : ููู โข ูุชุญ -โบ  ุงูุทุงุฆููู
โน : ููู โข ูุชุญ -โบ  ุงููู
โน : ููู โข ูุชุญ -โบ  ุงูุนุฑุจูู
โน : ููู โข ูุชุญ -โบ  ุงูุงููููุฒูู
โน : ููู โข ูุชุญ -โบ  ุงููุงุฑุณูู
โน : ููู โข ูุชุญ -โบ  ุงูุชูููุด
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุญูุงูู ุงุฎุฑู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ููู โข ูุชุญ + ุงูุงูุฑ -โบ  โค
โน : ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ
โน : ุงูุชูุฑุงุฑ ุจุงููุชู
โน : ุงูุชูุฑุงุฑ ุจุงูุชููุฏ
โน : ุงููุงุฑุณูู ุจุงูุทุฑุฏ
โน : ุงูุจูุชุงุช ุจุงูุทุฑุฏ
โน : ุงูุจูุชุงุช ุจุงูุชููุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู2" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููข" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู2) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help21'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help21'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help2', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู2" or text == "ููข" or text == "ุงูุงูุฑ2" or text == "ุงูุงูุฑูข" then
if not Admin(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโน : ุงุฑุณู -โบ  (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAli:get(LaUrEn..'Ali:Help2')
local Text = [[
โน : ุงูุงูุฑ ุงูุงุฏูููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงุนุฏุงุฏุช
โน : ุชุงู ูููู 
โน : ุงูุดุงุก ุฑุงุจุท
โน : ุถุน ูุตู
โน : ุถุน ุฑุงุจุท
โน : ุถุน ุตูุฑู
โน : ุญุฐู ุงูุฑุงุจุท
โน : ุญุฐู ุงููุทุงูู
โน : ูุดู ุงูุจูุชุงุช
โน : ุทุฑุฏ ุงูุจูุชุงุช
โน : ุชูุธูู + ุงูุนุฏุฏ
โน : ุชูุธูู ุงูุชุนุฏูู
โน : ููููู + ุงููููู
โน : ุงุณู ุงูุจูุช + ุงูุงูุฑ
โน : ุถุน โข ุญุฐู -โบ  ุชุฑุญูุจ
โน : ุถุน โข ุญุฐู -โบ  ููุงููู
โน : ุงุถู โข ุญุฐู -โบ  ุตูุงุญูู
โน : ุงูุตูุงุญูุงุช โข ุญุฐู ุงูุตูุงุญูุงุช
โโโโโโ ๐ฃ โโโโโโ
โน : ุถุน ุณุจุงู + ุงูุนุฏุฏ
โน : ุถุน ุชูุฑุงุฑ + ุงูุนุฏุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน ูููุฒ โข ุชูุฒูู ูููุฒ
โน : ุงููููุฒูู โข ุญุฐู ุงููููุฒูู
โน : ูุดู ุงููููุฏ โข ุฑูุน ุงููููุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุญุฐู โข ูุณุญ + ุจุงูุฑุฏ
โน : ููุน โข ุงูุบุงุก ููุน
โน : ูุงุฆูู ุงูููุน
โน : ุญุฐู ูุงุฆูู ุงูููุน
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุฑุงุจุท
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุงูุนุงุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุชุฑุญูุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุชุงู ูููู
โน : ุชูุนูู โข ุชุนุทูู -โบ  ูุดู ุงูุงุนุฏุงุฏุงุช
โโโโโโ ๐ฃ โโโโโโ
โน : ุทุฑุฏ ุงููุญุฐูููู
โน : ุทุฑุฏ -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ูุชู โข ุงูุบุงุก ูุชู
โน : ุชููุฏ โข ุงูุบุงุก ุชููุฏ
โน : ุญุธุฑ โข ุงูุบุงุก ุญุธุฑ
โน : ุงูููุชูููู โข ุญุฐู ุงูููุชูููู
โน : ุงููููุฏูู โข ุญุฐู ุงููููุฏูู
โน : ุงููุญุธูุฑูู โข ุญุฐู ุงููุญุธูุฑูู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูููุฏ ุฏูููู + ุนุฏุฏ ุงูุฏูุงุฆู
โน : ุชูููุฏ ุณุงุนู + ุนุฏุฏ ุงูุณุงุนุงุช
โน : ุชูููุฏ ููู + ุนุฏุฏ ุงูุงูุงู
โน : ุงูุบุงุก ุชูููุฏ -โบ  ูุงูุบุงุก ุงูุชูููุฏ ุจุงูููุช
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู3" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฃ" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู3) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help31'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help31'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help3', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู3" or text == "ููฃ" or text == "ุงูุงูุฑ3" or text == "ุงูุงูุฑูฃ" then
if not Admin(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโน : ุงุฑุณู -โบ  (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAli:get(LaUrEn..'Ali:Help3')
local Text = [[
โน : ุงูุงูุฑ ุงููุฏุฑุงุก -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ูุญุต ุงูุจูุช
โน : ุถุน ุงุณู + ุงูุงุณู
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ
โน : ุฑุฏูุฏ ุงููุฏูุฑ
โน : ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ ูุชุนุฏุฏ
โน : ุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ
โน : ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โน : ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โน : ุญุฐู ููุงุฆู ุงูููุน
โน : ููุน -โบ  ุจุงูุฑุฏ ุนูู ( ููุตู โข ุตูุฑู โข ูุชุญุฑูู )
โน : ุญุฐู ูุงุฆูู ููุน + -โบ  โค
( ุงูุตูุฑ โข ุงููุชุญุฑูุงุช โข ุงูููุตูุงุช )
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุฒูู ุงููู
โน : ุฑูุน ุงุฏูู โข ุชูุฒูู ุงุฏูู
โน : ุงูุงุฏูููู โข ุญุฐู ุงูุงุฏูููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุซุจูุช
โน : ุงูุบุงุก ุงูุชุซุจูุช
โน : ุงุนุงุฏู ุงูุชุซุจูุช
โน : ุงูุบุงุก ุชุซุจูุช ุงููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุบูุฑ ุฑุฏ + ุงุณู ุงูุฑุชุจู + ุงููุต -โบ  โค
โน : ุงููุทูุฑ โข ููุดุฆ ุงูุงุณุงุณู
โน : ุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู
โน : ุงููููุฒ โข ุงูููุธู โข ุงูุนุถู
โน : ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุบููุฑ ุงูุงูุฏู -โบ  ูุชุบููุฑ ุงููููุดู
โน : ุชุนููู ุงูุงูุฏู -โบ  ูุชุนููู ุงููููุดู
โน : ุญุฐู ุงูุงูุฏู -โบ  ูุญุฐู ุงููููุดู
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ุงุทุฑุฏูู โข ุงูุงูุฏู ุจุงูุตูุฑู โข ุงูุงุจุฑุงุฌ
โน : ูุนุงูู ุงูุงุณูุงุก โข ุงูุงูุฑ ุงููุณุจ โข ุงูุทู
โน : ุงูุงูุฏู โข ุชุญููู ุงูุตูุบ โข ุงูุงูุฑ ุงูุชุญุดูุด
โน : ุฑุฏูุฏ ุงููุฏูุฑ โข ุฑุฏูุฏ ุงููุทูุฑ โข ุงูุชุญูู
โน : ุถุงููู โข ุญุณุงุจ ุงูุนูุฑ โข ุงูุฒุฎุฑูู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู4" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููค" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู4) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help41'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help41'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help4', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
return false end
end
if text == "ููค" or text == "ู4" or text == "ุงูุงูุฑ4" or text == "ุงูุงูุฑูค" then
if not Admin(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโน : ุงุฑุณู -โบ  (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAli:get(LaUrEn..'Ali:Help4')
local Text = [[
โน : ุงูุงูุฑ ุงูููุดุฆูู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุฒูู ุงููู
โน : ุงูููุฏูุง โข ุงูุณุญ
โน : ุชุนูู ุนุฏุฏ ุงูุญุฐู
โน : ุชุฑุชูุจ ุงูุงูุงูุฑ
โน : ุงุถู โข ุญุฐู -โบ  ุงูุฑ
โน : ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู
โน : ุงูุงูุงูุฑ ุงููุถุงูู
โน : ุงุถู ููุงุท -โบ  ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โน : ุงุถู ุฑุณุงุฆู -โบ  ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โน : ุฑูุน ููุธู โข ุชูุฒูู ููุธู
โน : ุงูููุธููู โข ุญุฐู ุงูููุธููู
โน : ุฑูุน ูุฏูุฑ โข ุชูุฒูู ูุฏูุฑ
โน : ุงููุฏุฑุงุก โข ุญุฐู ุงููุฏุฑุงุก
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ูุฒููู โข ุงูุณุญ
โน : ุงูุญุธุฑ โข ุงููุชู
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงูููุดุฆูู ุงูุงุณุงุณููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ูุถุน ููุจ + ุงูููุจ
โน : ุชูุนูู โข ุชุนุทูู -โบ  ุงูุฑูุน
โน : ุฑูุน ููุดุฆ โข ุชูุฒูู ููุดุฆ
โน : ุงูููุดุฆูู โข ุญุฐู ุงูููุดุฆูู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุดุฑู
โน : ุฑูุน ุจูู ุงูุตูุงุญูุงุช
โน : ุญุฐู ุงูููุงุฆู
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงููุงูููู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน โข ุชูุฒูู -โบ  ููุดุฆ ุงุณุงุณู
โน : ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู 
โน : ุงูููุดุฆูู ุงูุงุณุงุณููู 
โน : ุญุฐู ุฌููุน ุงูุฑุชุจ
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู5" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฅ" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู5) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help51'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help51'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help5', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ููฅ" or text == "ู5" or text == "ุงูุงูุฑ5" or text == "ุงูุงูุฑูฅ" then
if not SudoBot(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูุฐุง ุงูุงูุฑ ูููุทูุฑูู ููุท', 1, 'md')
else
local Help = DevAli:get(LaUrEn..'Ali:Help5')
local Text = [[
โน : ุงูุงูุฑ ุงููุทูุฑูู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงููุฑูุจุงุช
โน : ุงููุทูุฑูู
โน : ุงููุดุชุฑููู
โน : ุงูุงุญุตุงุฆูุงุช
โน : ุงููุฌููุนุงุช
โน : ุงุณู ุงูุจูุช + ุบุงุฏุฑ
โน : ุงุณู ุงูุจูุช + ุชุนุทูู
โน : ูุดู + -ุงูุฏู ุงููุฌููุนู
โน : ุฑูุน ูุงูู โข ุชูุฒูู ูุงูู
โน : ุงููุงูููู โข ุญุฐู ุงููุงูููู
โโโโโโ ๐ฃ โโโโโโ
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุฏูุฑ ุนุงู
โน : ุญุฐู โข ุงููุฏุฑุงุก ุงูุนุงููู 
โน : ุฑูุน โข ุชูุฒูู -โบ  ุงุฏูู ุนุงู
โน : ุญุฐู โข ุงูุงุฏูููู ุงูุนุงููู 
โน : ุฑูุน โข ุชูุฒูู -โบ  ูููุฒ ุนุงู
โน : ุญุฐู โข ุงููููุฒูู ุนุงู 
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุงูุฑ ุงููุทูุฑ ุงูุงุณุงุณู -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุชุญุฏูุซ
โน : ุงููููุงุช
โน : ุงููุชุฌุฑ
โน : ุงูุณูุฑูุฑ
โน : ุฑูุงุจุท ุงููุฑูุจุงุช
โน : ุชุญุฏูุซ ุงูุณูุฑุณ
โน : ุชูุธูู ุงููุฑูุจุงุช
โน : ุชูุธูู ุงููุดุชุฑููู
โน : ุญุฐู ุฌููุน ุงููููุงุช
โน : ุชุนููู ุงูุงูุฏู ุงูุนุงู
โน : ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู
โน : ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ
โน : ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ
โน : ุบุงุฏุฑ + -ุงูุฏู ุงููุฌููุนู
โน : ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก + ุงูุนุฏุฏ
โน : ุญุธุฑ ุนุงู โข ุงูุบุงุก ุงูุนุงู
โน : ูุชู ุนุงู โข ุงูุบุงุก ุงูุนุงู
โน : ูุงุฆูู ุงูุนุงู โข ุญุฐู ูุงุฆูู ุงูุนุงู
โน : ูุถุน โข ุญุฐู -โบ  ุงุณู ุงูุจูุช
โน : ุงุถู โข ุญุฐู -โบ  ุฑุฏ ุนุงู
โน : ุฑุฏูุฏ ุงููุทูุฑ โข ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ
โน : ุชุนููู โข ุญุฐู โข ุฌูุจ -โบ  ุฑุฏ ุงูุฎุงุต
โน : ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช
โน : ุฑูุน ุงููุณุฎู + ุจุงูุฑุฏ ุนูู ุงูููู
โน : ุชุนููู โข ุญุฐู -โบ  ููุงุฉ ุงูุงุดุชุฑุงู
โน : ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู
โน : ุชุบููุฑ โข ุญุฐู -โบ  ูููุดู ุงูุงุดุชุฑุงู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุทูุฑ
โน : ุงููุทูุฑูู โข ุญุฐู ุงููุทูุฑูู
โน : ุฑูุน โข ุชูุฒูู -โบ  ูุทูุฑ ุซุงููู
โน : ุงูุซุงููููู โข ุญุฐู ุงูุซุงููููู
โน : ุชุนููู โข ุญุฐู -โบ  ูููุดุฉ ุงูุงูุฏู
โน : ุงุฐุงุนู ูููู ุจุงูุชูุฌูู -โบ  ุจุงูุฑุฏ
โโโโโโ ๐ฃ โโโโโโ
โน : ุชูุนูู ููู + ุงุณู ุงูููู
โน : ุชุนุทูู ููู + ุงุณู ุงูููู
โน : ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ -โบ  โค
โน : ุงูุงุฐุงุนู โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู
โน : ุชุฑุญูุจ ุงูุจูุช โข ุงููุบุงุฏุฑู
โน : ุงูุจูุช ุงูุฎุฏูู โข ุงูุชูุงุตู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู6" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฆ" and SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ (ู6) ุงูุงู " ,  1, "md")
DevAli:set(LaUrEn..'Ali:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LaUrEnTEAM =  DevAli:get(LaUrEn..'Ali:Help61'..msg.sender_user_id_)
if LaUrEnTEAM == 'msg' then
Dev_Ali(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAli:del(LaUrEn..'Ali:Help61'..msg.sender_user_id_)
DevAli:set(LaUrEn..'Ali:Help6', text)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
return false end
end
if text == "ููฆ" or text == "ู6" or text == "ุงูุงูุฑ6" or text == "ุงูุงูุฑูฆ" then
local Help = DevAli:get(LaUrEn..'Ali:Help6')
local Text = [[
โน : ุงูุงูุฑ ุงูุงุนุถุงุก -โบ  โค
โโโโโโ ๐ฃ โโโโโโ
โน : ุงูุณูุฑุณ โข ูููุนู โข ุฑุชุจุชู โข ูุนูููุงุชู 
โน : ุฑููู โข ููุจู โข ูุจุฐุชู โข ุตูุงุญูุงุชู โข ุบูููู
โน : ุฑุณุงุฆูู โข ุญุฐู ุฑุณุงุฆูู โข ุงุณูู โข ูุนุฑูู 
โน : ุงูุฏู โขุงูุฏูู โข ุฌูุงุชู โข ุฑุงุณููู โข ุงูุงูุนุงุจ 
โน : ููุงุทู โข ุจูุน ููุงุทู โข ุงูููุงููู โข ุฒุฎุฑูู 
โน : ุฑุงุจุท ุงูุญุฐู โข ูุฒููู โข ุงุทุฑุฏูู โข ุงููุทูุฑ 
โน : ููู ุถุงููู โข ูุดุงูุฏุงุช ุงูููุดูุฑ โข ุงูุฑุงุจุท 
โน : ุงูุฏู ุงููุฌููุนู โข ูุนูููุงุช ุงููุฌููุนู 
โน : ูุณุจู ุงูุญุจ โข ูุณุจู ุงููุฑู โข ูุณุจู ุงูุบุจุงุก 
โน : ูุณุจู ุงูุฑุฌููู โข ูุณุจู ุงูุงููุซู โข ุงูุชูุงุนู
โโโโโโ ๐ฃ โโโโโโ
โน : ููุจู + ุจุงูุฑุฏ
โน : ููู + ุงููููู
โน : ุฒุฎุฑูู + ุงุณูู
โน : ุจุฑุฌ + ููุน ุงูุจุฑุฌ
โน : ูุนูู ุงุณู + ุงูุงุณู
โน : ุจูุณู โข ุจูุณูุง -โบ  ุจุงูุฑุฏ
โน : ุงุญุณุจ + ุชุงุฑูุฎ ูููุงุฏู
โน : ุฑูุน ูุทู โข ุชูุฒูู ูุทู โข ุงููุทุงูู
โน : ูููู โข ููููุง -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู
โน : ุตูุญู โข ุตูุญูุง -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู
โน : ุตูุงุญูุงุชู -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ุงูุฏู โข ูุดู  -โบ  ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โน : ุชุญููู + ุจุงูุฑุฏ -โบ  ุตูุฑู โข ููุตู โข ุตูุช โข ุจุตูู
โน : ุงูุทู + ุงูููุงู ุชุฏุนู ุฌููุน ุงููุบุงุช ูุน ุงูุชุฑุฌูู ููุนุฑุจู
โโโโโโ ๐ฃ โโโโโโ
โน : [ ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน ](https://t.me/iinzzz)
]]
Dev_Ali(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source LaUrEn     --
if SecondSudo(msg) then
if text == "ุชุญุฏูุซ ุงูุณูุฑุณ" or text == "ุชุญุฏูุซ ุณูุฑุณ" then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุฌุงุฑู ุชุญุฏูุซ ุณูุฑุณ ุณูุงุจ', 1, 'md') 
os.execute('rm -rf LaUrEn.lua') 
os.execute('wget https://raw.githubusercontent.com/LaUrEnTEM/LaUrEn/master/LaUrEn.lua') 
dofile('LaUrEn.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( ุชู ุชุญุฏูุซ ุงูุณูุฑุณ )          \n\27[0;34;49m\n") 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุงูุชุญุฏูุซ ุงูู ุงูุงุตุฏุงุฑ ุงูุฌุฏูุฏ', 1, 'md') 
end
if text == 'ุชุญุฏูุซ' or text == 'ุชุญุฏูุซ ุงูุจูุช' or text == '-โบ  ุชุญุฏูุซ โช' then  
dofile('LaUrEn.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช )        \n\27[0;34;49m\n") 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช", 1, "md")
end 
--     Source LaUrEn     --
if text == 'ุงููููุงุช' then
Files = '\nโน : ุงููููุงุช ุงูููุนูู ูู ุงูุจูุช -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = 'โน : ูุง ุชูุฌุฏ ูููุงุช ูู ุงูุจูุช'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "ูุชุฌุฑ ุงููููุงุช" or text == 'ุงููุชุฌุฑ' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/LaUrEnTEM/LaUrEnFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\nโน : ูุงุฆูุฉ ูููุงุช ูุชุฌุฑ ุณูุฑุณ ุณูุงุจ\nโน : ุงููููุงุช ุงููุชููุฑู ุญุงููุง -โบ  โค\nโโโโโโ ๐ฃ โโโโโโ\n"
local TextE = "โโโโโโ ๐ฃ โโโโโโ\nโน : ุนูุงูุฉ -โบ  (โ) ุชุนูู ุงูููู ููุนู\nโน : ุนูุงูุฉ -โบ  (โ๏ธ) ุชุนูู ุงูููู ูุนุทู\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(โ)"
else
CheckFile = "(โ๏ธ)"
end
NumFile = NumFile + 1
TextS = TextS.."โน : "..Info..' -โบ  โค\n'..NumFile.."~ : `"..name..'` โฌ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"โน : ูุง ููุฌุฏ ุงุชุตุงู ูู ุงููapi") 
end
end
if text == "ูุณุญ ุฌููุน ุงููููุงุช" or text == "ุญุฐู ุฌููุน ุงููููุงุช" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"โน : ุชู ุญุฐู ุฌููุน ุงููููุงุช ุงูููุนูู")
end
if text and text:match("^(ุชุนุทูู ููู) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(ุชุนุทูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/LaUrEnTEM/LaUrEnFiles/master/LaUrEnFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\nโน : ุงูููู -โบ  *"..FileName.."*\nโน : ุชู ุชุนุทููู ูุญุฐูู ูู ุงูุจูุช ุจูุฌุงุญ") 
dofile('LaUrEn.lua')  
else
send(msg.chat_id_, msg.id_,"โน : ูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
end
if text and text:match("^(ุชูุนูู ููู) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(ุชูุนูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/LaUrEnTEM/LaUrEnFiles/master/LaUrEnFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\nโน : ุงูููู -โบ  *"..FileName.."*\nโน : ุชู ุชูุนููู ูู ุงูุจูุช ุจูุฌุงุญ") 
dofile('LaUrEn.lua')  
else
send(msg.chat_id_, msg.id_,"โน : ูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
return false
end
end 
--     Source LaUrEn     --
if text and (text == 'ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ูุณุญ ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ', 1, 'md')   
DevAli:del(LaUrEn..'Ali:Text:BotWelcome')
DevAli:del(LaUrEn..'Ali:Photo:BotWelcome')
return false
end 
if text and (text == 'ุชูุนูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชูุนูู ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชูุนูู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevAli:del(LaUrEn..'Ali:Lock:BotWelcome')
return false
end 
if text and (text == 'ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชุนุทูู ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชุนุทูู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevAli:set(LaUrEn..'Ali:Lock:BotWelcome',true)
return false
end 
if text and (text == 'ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ุชุบููุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == '-โบ  ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ โช') and SecondSudo(msg) then    
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุงุฑุณู ูู ูุต ุงูุชุฑุญูุจ', 1, 'md') 
DevAli:del(LaUrEn..'Ali:Text:BotWelcome')
DevAli:del(LaUrEn..'Ali:Photo:BotWelcome')
DevAli:set(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAli:get(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevAli:del(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููุต ุงุฑุณู ูู ุตูุฑุฉ ุงูุชุฑุญูุจ\nโน : ุงุฑุณู -โบ  ุงูุบุงุก ูุญูุธ ุงููุต ููุท", 1, 'md')   
DevAli:set(LaUrEn.."Ali:Text:BotWelcome",text) 
DevAli:set(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAli:get(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููุต ูุงูุบุงุก ุญูุธ ุตูุฑุฉ ุงูุชุฑุญูุจ", 1, "md") 
DevAli:del(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAli:set(LaUrEn.."Ali:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญูุธ ุงููุต ูุตูุฑุฉ ุงูุชุฑุญูุจ", 1, 'md')   
DevAli:del(LaUrEn.."Ali:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source LaUrEn     --
if text and text:match("^ุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ูุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ุชุบููุฑ ูููุดู ุงููุทูุฑ$") then
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุงุฑุณู ูููุดุฉ ุงููุทูุฑ ุงูุงู ", 1, "md")
DevAli:setex(LaUrEn.."Ali:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^ูุณุญ ูููุดู ุงููุทูุฑ$") or text and text:match("^ุญุฐู ูููุดู ุงููุทูุฑ$") then
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุญุฐู ูููุดุฉ ุงููุทูุฑ", 1, "md")
DevAli:del(LaUrEn.."DevText")
end end
--     Source LaUrEn     --
if DevAli:get(LaUrEn.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "โน : ุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevAli:del(LaUrEn.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAli:del(LaUrEn.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAli:set(LaUrEn..'Ali:ChText',texxt)
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ุชู ุชุบููุฑ ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู', 1, 'md')
end
if text and text:match("^ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู$") and SecondSudo(msg) or text and text:match("^ุชุบููุฑ ูููุดู ุงูุงุดุชุฑุงู$") and SecondSudo(msg) then  
DevAli:setex(LaUrEn.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
local text = 'โน : ุญุณูุง ุงุฑุณู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุฌุฏูุฏู'  
Dev_Ali(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "ุญุฐู ูููุดู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "ุญุฐู ูููุดู ุงูุงุดุชุฑุงู" then  
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAli:del(LaUrEn..'Ali:ChText')
textt = "โน : ุชู ุญุฐู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู"
Dev_Ali(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'ูููุดู ุงูุงุดุชุฑุงู' or text == 'ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู' then
if not SecondSudo(msg) then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
local chtext = DevAli:get(LaUrEn.."Ali:ChText")
if chtext then
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูููุดุฉ ุงูุงุดุชุฑุงู -โบ  โค \nโโโโโโ ๐ฃ โโโโโโ\n['..chtext..']', 1, 'md')
else
if DevAli:get(LaUrEn.."Ali:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAli:get(LaUrEn.."Ali:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "โน : ุนุฐุฑุง ูุงุชุณุชุทูุน ุงุณุชุฎุฏุงู ุงูุจูุช !\nโน : ุนููู ุงูุงุดุชุฑุงู ูู ุงูููุงุฉ ุงููุง :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : ูู ูุชู ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nโน : ุงุฑุณู -โบ  ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ููุชุนููู ', 1, 'md')
end end end end
--     Source LaUrEn     --
if text == 'ุงูููุงุฉ' or text == 'ููุงุฉ ุงูุณูุฑุณ' or text == 'ููุงู ุงูุณูุฑุณ' or text == 'ููุงุช ุงูุณูุฑุณ' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, 'โน : Channel โฌ [@iinzzz]', 1, 'md')    
end 
--     Source LaUrEn     --
if Sudo(msg) then 
if text == 'ูุนูููุงุช ุงูุณูุฑูุฑ' or text == 'ุงูุณูุฑูุฑ' then 
Dev_Ali(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo 'โน : ูุธุงู ุงูุชุดุบูู -โบ  โค\n`'"$LinuxVersion"'`' 
echo 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุงูุฐุงูุฑู ุงูุนุดูุงุฆูู -โบ  โค\n`'"$MemoryUsage"'`'
echo 'โโโโโโ ๐ฃ โโโโโโ\nโน : ูุญุฏุฉ ุงูุชุฎุฒูู -โบ  โค\n`'"$HardDisk"'`'
echo 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุงููุนุงูุฌ -โบ  โค\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุงูุฏุฎูู -โบ  โค\n`'`whoami`'`'
echo 'โโโโโโ ๐ฃ โโโโโโ\nโน : ูุฏุฉ ุชุดุบูู ุงูุณูุฑูุฑ -โบ  โค\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source LaUrEn     --
LaUrEnFiles(msg)
--     Source LaUrEn     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAli:incr(LaUrEn..'Ali:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'ุงูููุฏูุง'
if result.content_.ID == "MessagePhoto" then Media = 'ุงูุตูุฑู'
elseif result.content_.ID == "MessageSticker" then Media = 'ุงูููุตู'
elseif result.content_.ID == "MessageVoice" then Media = 'ุงูุจุตูู'
elseif result.content_.ID == "MessageAudio" then Media = 'ุงูุตูุช'
elseif result.content_.ID == "MessageVideo" then Media = 'ุงูููุฏูู'
elseif result.content_.ID == "MessageAnimation" then Media = 'ุงููุชุญุฑูู'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local aliname = 'โน : ุงูุนุถู -โบ  ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local aliid = 'โน : ุงูุฏูู -โบ  `'..dp.id_..'`'
local alitext = 'โน : ูุงู ุจุงูุชุนุฏูู ุนูู '..Media
local alitxt = 'โโโโโโ ๐ฃ โโโโโโ\nโน : ุชุนุงูู ูุงูุดุฑููู ุงูู ูุฎุฑุจ'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,alii) 
local admins = alii.members_  
text = '\nโโโโโโ ๐ฃ โโโโโโ\n'
for i=0 , #admins do 
if not alii.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, aliname..'\n'..aliid..'\n'..alitext..text..alitxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAli:get(LaUrEn..'Ali:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source LaUrEn     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAli:get(LaUrEn..'Ali:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAli:del(LaUrEn..'Ali:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAli:del(LaUrEn..'Ali:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAli:del(LaUrEn..'Ali:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAli:del(LaUrEn..'Ali:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source LaUrEn     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mุฌุงุฑู ุชูุธูู ุงููุฌููุนุงุช ุงูููููู ูุฑุฌู ุงูุงูุชุธุงุฑ\n\27[1;37m')
local PvList = DevAli:smembers(LaUrEn..'Ali:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAli:smembers(LaUrEn..'Ali:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=LaUrEn,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAli:srem(LaUrEn..'Ali:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAli:srem(LaUrEn..'Ali:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAli:srem(LaUrEn..'Ali:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAli:srem(LaUrEn..'Ali:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAli:sadd(LaUrEn..'Ali:Groups',v)  
end end,nil) end
end
--     Source LaUrEn     --
end 
------------------------------------------------
-- This Source Was Developed By (Ali) @AAAPA.--
--   This Is The  ู๐ฅ ๐ฆ๐ก๐ฎ๐ฃ ๐ง๐๐ฎ๐บ โคน  @iinzzz .   --
--                - LaUrEn -                 --
--        -- https://t.me/iinzzz --         --
------------------------------------------------ 
