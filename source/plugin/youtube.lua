function youtube(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
function time_to_sec(time)
    local sec = 0
    local time_table = {}
    for i in string.gmatch(time, "%d+") do
        table.insert(time_table, i)
    end
    local hour = tonumber(time_table[1])
    local min = tonumber(time_table[2])
    local sec = tonumber(time_table[3])
    return hour*3600 + min*60 + sec
end
if text == "تعطيل اليوتيوب" or text == "تعطيل يوتيوب" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast.."yt:lock"..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n• تم تعطيل اليوتيوب ',"md",true)  
end
if text == "تفعيل اليوتيوب" or text == "تفعيل يوتيوب" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast.."yt:lock"..msg.chat_id)
send(msg.chat_id,msg.id,'\n• تم تفعيل اليوتيوب ',"md",true)  
end

if text then
if text:match("^بحث (.*)$") then
if Redis:get(Fast.."yt:lock"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• اليوتيوب معطل*',"md",true)  
return false 
end
local search = text:match("^بحث (.*)$")
local json = json:decode(http.request("https://api-jack.ml/api18.php?search="..URL.escape(search)..""))
local datar = {data = {{text = "٠ 𝘼𝘽𝘼𝙕𝘼¹ま ٠" , url = 'https://t.me/JJXXH'}}}
for i = 1,5 do
title = json.results[i].title
link = json.results[i].url
datar[i] = {{text = title , data =msg.sender.user_id.."dl/"..link}}
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = datar
}
LuaTele.sendText(msg.chat_id,msg.id,'※ نتائج بحثك ل *'..search..'*',"md",false, false, false, false, reply_markup)
end
end

if Redis:get(Fast.."youtube"..msg.sender.user_id..msg_chat_id) == "mp3" then
Redis:del(Fast.."youtube"..msg.sender.user_id..msg_chat_id)
local rep = msg.id/2097152/0.5
local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/photojack14366/65&reply_to_message_id="..rep)).result.message_id
local se = http.request("https://api-jack.ml/api18.php?search="..URL.escape(text))
local j = JSON.decode(se)
local link = j.results[1].url
local title = j.results[1].title 
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
print(link)
os.execute("yt-dlp "..link.." -f 251 -o '"..title..".mp3'")
LuaTele.sendAudio(msg_chat_id,msg_id,'./'..title..'.mp3',""..title.."","md",nil,title)
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
Redis:del(Fast.."youtube"..msg.sender.user_id..msg_chat_id)
sleep(2)
os.remove(""..title..".mp3")
end
if Redis:get(Fast.."youtube"..msg.sender.user_id..msg_chat_id) == "mp4" then
local rep = msg.id/2097152/0.5
local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/photojack14366/65&reply_to_message_id="..rep)).result.message_id
local se = http.request("https://api-jack.ml/api18.php?search="..URL.escape(text))
local j = JSON.decode(se)
local link = j.results[1].url
local title = j.results[1].title 
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
os.execute("yt-dlp "..link.." -f 18 -o '"..title..".mp4'")
LuaTele.sendVideo(msg_chat_id,msg_id,'./'..title..'.mp4',""..title.."","md") 
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
Redis:del(Fast.."youtube"..msg.sender.user_id..msg_chat_id)
sleep(2)
os.remove(""..title..".mp4")
end
if text == "يوتيوب" or text == 'يوت' or text == 'YouTube' or text == 'The Youtube' or text == 'Youtube' or text == 'youtube' or text == 'You Tube' or text == 'YT' or text == 'Yt' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝑀𝑃3', data = msg.sender.user_id..'/mp3'..msg_id}, {text = '𝑀𝑃4', data = msg.sender.user_id..'/mp4'..msg_id}, 
},
{
{text = '𝘼𝘽𝘼𝙕𝘼¹ま ', url = "https://t.me/JJXXH"}
},
}
}
return send(msg_chat_id,msg_id, [[*
٠ 𝐶𝐻𝑂𝑂𝑆𝐸 𝐻𝑂𝑊 𝑌𝑂𝑈 𝑊𝐴𝑁𝑇 𝑇𝑂 𝐷𝑂𝑊𝑁𝐿𝑂𝐴𝐷 .
*]],"md",false, false, false, false, reply_markup)
end
end
return {Fast = youtube}