function zwag(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == "زواج" or text == "رفع زوجتي" or text == "رفع زوجي" then 
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز تتجوز نفسك ؟ هتتكاثر ازاي طيب ؟!!","md",true)
end
if tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعد عني يحيحان ملكقتش غيري","md",true)
end
if Redis:sismember(Fast..msg.chat_id.."zwgat:",rep_idd) then
local rd_mtzwga = {
"اسف يصحبي متجوزه",
"متجوزه يبن عمي شفلك واحده تانيه",
"يبني متجوزه اجوزهاشلك ازاي انا",
"للاسف متجوزه بس لو العمليه جايبه اخرها شوف واحده تانيه",
"يادي الكسفه طلعت متجوزه قبلك"
}
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,rd_mtzwga[math.random(#rd_mtzwga)]).Reply,"md",true)
else
local rd_zwag = {
"تم زواجك منه وبارك الله لكم وعليكم",
"لولولولويي تم الزواج عقبال العيال بقا",
"مبروك اتجوزتها عاوز اتغدا بقا في الفرح",
"تم زواجكم... ودا رقمي عشان لو العريس معرفش يسد 012345..",
"الزواج تم اتفضلو اعملو احلا واحد بقا هيهيهي"
}
if Redis:sismember(Fast..msg.chat_id.."mutlqat:",rep_idd) then 
Redis:srem(Fast..msg.chat_id.."mutlqat:",rep_idd)
end
Redis:sadd(Fast..msg.chat_id.."zwgat:",rep_idd) 
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,rd_zwag[math.random(#rd_zwag)]).Reply,"md",true)
end
end
end
if text == "تاك للزوجات" or text == "الزوجات" then
local zwgat_list = Redis:smembers(Fast..msg.chat_id.."zwgat:")
if #zwgat_list == 0 then 
return send(msg.chat_id,msg.id,'• لايوجد زوجات',"md",true) 
end 
local zwga_list = "• عدد الزوجات : "..#zwgat_list.."\n• الزوجات :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k, v in pairs(zwgat_list) do
local UserInfo = bot.getUser(v)
local zwga_name = FlterBio(UserInfo.first_name)
local zwga_tag = '['..zwga_name..'](tg://user?id='..v..')'
zwga_list = zwga_list.."- "..zwga_tag.."\n"
end
return send(msg.chat_id,msg.id,zwga_list,"md",true) 
end
-- tlaq
if text == "طلاق" or text == "تنزيل زوجتي" or text == "تزيل زوجي" and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"احا هو انت كنت اتجوزت نفسك عشان تطلق","md",true)
end
if tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"هو احنا كنا اتجوزنا يروح خالتك عشان نطلق","md",true)
end
if Redis:sismember(Fast..msg.chat_id.."zwgat:",rep_idd) then
Redis:srem(Fast..msg.chat_id.."zwgat:",rep_idd)
Redis:sadd(Fast..msg.chat_id.."mutlqat:",rep_idd) 
local rd_tmtlaq = {
"تم طلاقكم للاسف",
"تم الطلاق بلص ام عبير عاوزه تعرف اتطلقتو لي ؟",
"تم الطلاق عشان المعلم مبيعرفش",
"تم الطلاق عشان في سوسه دخلت وسطهم",
"تم الطلاق بلص دا رقمي عشان لو حبيتي نتكلم باحترام 01234..."
}
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,rd_tmtlaq[math.random(#rd_tmtlaq)]).Reply,"md",true)
else
local rd_tlaq = {
"مكنتش اتجوزت عشان تطلق اصلا",
"بايره محدش اتجوزها",
"محدش عبرها قبل كدا اسسن"
}
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,rd_tlaq[math.random(#rd_tlaq)]).Reply,"md",true)
end
end
if text == "تاك للمطلقات" or text == "المطلقات" then
local mutlqat_list = Redis:smembers(Fast..msg.chat_id.."mutlqat:")
if #mutlqat_list == 0 then 
return send(msg.chat_id,msg.id,'• لايوجد مطلقات',"md",true) 
end 
local mutlqa_list = "• عدد المطلقات : "..#mutlqat_list.."\n• المطلقات :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k, v in pairs(mutlqat_list) do
local UserInfo = bot.getUser(v)
local mutlqa_name = FlterBio(UserInfo.first_name)
local mutlqa_tag = '['..mutlqa_name..'](tg://user?id='..v..')'
mutlqa_list = mutlqa_list.."- "..mutlqa_tag.."\n"
end
return send(msg.chat_id,msg.id,mutlqa_list,"md",true) 
end
if text == "رفع بقلبي" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:")) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"مهو فقلبك ولا هي شغلانه","md")
elseif tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز ترفع نفسك فقلبك ؟؟","md")
elseif tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعد عني يبن الهبله","md")
elseif Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:") then
return send(msg.chat_id,msg.id,"للاسف العضو فقلب حد تاني","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:")) ~= tonumber(senderr) and not Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:") then
Redis:set(Fast..msg.chat_id..rep_idd.."in_heart:", senderr)
Redis:sadd(Fast..msg.chat_id..senderr.."my_heart:", rep_idd)
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"تم رفعو فقلبك").Reply,"md",true)
end
end
if text == "تنزيل من قلبي" then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:")) == tonumber(senderr) then
Redis:del(Fast..msg.chat_id..rep_idd.."in_heart:")
Redis:srem(Fast..msg.chat_id..senderr.."my_heart:", msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"تم تنزيلو من قلبك").Reply,"md",true) 
elseif tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز تنزل نفسك من قلبك ؟؟","md")
elseif tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعد عني يبن الهبله","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."in_heart:")) ~= tonumber(senderr)then
return send(msg.chat_id,msg.id,"هو فقلبك اصلا عشان تنزلو ؟؟","md")
end
end
if text == "انا فقلب مين" then
if not Redis:get(Fast..msg.chat_id..senderr.."in_heart:") then
return send(msg.chat_id,msg.id,"اقعد يعم انت محدش طايقك","md")
elseif Redis:get(Fast..msg.chat_id..senderr.."in_heart:") then
local in_heart_id = Redis:get(Fast..msg.chat_id..senderr.."in_heart:")
local heart_name = bot.getUser(in_heart_id).first_name
return send(msg.chat_id,msg.id,"انت فقلب ["..heart_name.."](tg://user?id="..in_heart_id..")","md")
end
end
if text == "تاك للبقلبي" or text == "تاك للي فقلبي" or text == "تاك للناس الي فقلبي" then
local heart_list = Redis:smembers(Fast..msg.chat_id..senderr.."my_heart:")
if #heart_list == 0 then
return send(msg.chat_id,msg.id,"قلبك فاضي محدش فيه","md")
elseif #heart_list > 0 then
your_heart = "الناس الي فقلبك \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = FlterBio(user_info.first_name)
your_heart = your_heart..k.." - ["..name.."](tg://user?id="..v..")\n"
end
return send(msg.chat_id,msg.id,your_heart,"md")
end
end
if text == "مسح للبقلبي" or text == "مسح للي فقلبي" then 
local list = Redis:smembers(Fast..msg.chat_id..senderr.."my_heart:")
for k,v in pairs(list) do
Redis:del(Fast..msg.chat_id..v.."in_heart:")
end
Redis:del(Fast..msg.chat_id..senderr.."my_heart:")
return send(msg.chat_id,msg.id,"تم مسح الي فقلبك","md")
end
-------
-- ttgwzine
if text == "تعطيل جوزني" or text == "تعطيل زوجني" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:set(Fast..'zwgnyy'..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n •تم تعطيل امر جوزني')
end
if text == "تفعيل جوزني" or text == "تفعيل زوجني" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:del(Fast..'zwgnyy'..msg.chat_id)
send(msg.chat_id,msg.id,'\n •تم تفعيل امر جوزني')
end
if text == "جوزني" or text == "زوجني" then
if not Redis:get(Fast..'zwgnyy'..msg.chat_id) then 
local Info_Chats = bot.getSupergroupFullInfo(msg.chat_id)
local chat_Members = bot.searchChatMembers(msg.chat_id, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local mem_tag = "["..FlterBio(member_name).."](tg://user?id="..member_id..")"
if tonumber(member_id) == tonumber(senderr) or tonumber(member_id) == tonumber(Fast) or bot.getUser(member_id).type.bot == "userTypeBot" then 
return send(msg.chat_id,msg.id,"معندناش حد للجواز شطبنا شفلك كلبه بقا","md")
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافق', data = senderr..'/yes_zw/'..member_id},
{text = 'مش موافق', data = senderr..'/no_zw/'..member_id},
},
}
}
return send(msg.chat_id,msg.id,"جبتلك عروسه انما اي لقطه "..mem_tag.." اي رايك فيها ؟؟","md",false, false, false, false, reply_markup)
end
end
if text == "تتجوزيني" and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")) == tonumber(rep_idd) then
return send(msg.chat_id,msg.id,"منتو متجوزين ولا هو محن وخلاص","md")
elseif tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز تتجوز نفسك ؟؟","md")
elseif tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعد عني يبن الحيحانه","md")
elseif Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")
local zwg_info = bot.getUser(zwg_id)
return send(msg.chat_id,msg.id,"هناديلك جوزها\n["..FlterBio(zwg_info.first_name).."](tg://user?id="..zwg_id..")\nالحق يا دكر عاوزين يتجوزو مراتك","md")
elseif Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")
local zwg_info = bot.getUser(zwg_id)
return send(msg.chat_id,msg.id,"هناديلك مراتك\n["..FlterBio(zwg_info.first_name).."](tg://user?id="..zwg_id..")\nالحقي يا وليه جوزك عاوز يتجوز عليكي","md")
elseif not Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:") then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local rep_info = bot.getUser(rep_idd)
local rep_tag = "["..FlterBio(rep_info.first_name).."](tg://user?id="..rep_idd..")"
local user_info = bot.getUser(senderr)
local user_tag = "["..FlterBio(user_info.first_name).."](tg://user?id="..senderr..")"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافقه', data = rep_idd..'/yes_z/'..senderr},
{text = 'مش موافقه', data = rep_idd..'/no_z/'..senderr},
},
}
}
return send(msg.chat_id,msg.reply_to_message_id,"يا "..rep_tag.."\nالكبتن"..user_tag.."\nطالب ايدك للجواز اي رايك ؟","md",false, false, false, false, reply_markup)
end
end
if text == "زوجتي" then
if Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
local zwga_id = Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")
local zwga_name = FlterBio(bot.getUser(zwga_id).first_name)
return send(msg.chat_id,msg.id,"كلمي يا ["..zwga_name.."](tg://user?id="..zwga_id..") جوزك عاوزك","md")
elseif not Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
return send(msg.chat_id,msg.id,"زوجتك اي يهبل انت سنجل","md")
end
end
if text == "زوجي" then
if Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
local zwga_id = Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")
local zwga_name = FlterBio(bot.getUser(zwga_id).first_name)
return send(msg.chat_id,msg.id,"كلم يا ["..zwga_name.."](tg://user?id="..zwga_id..") مراتك عوزاك","md")
elseif not Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
return send(msg.chat_id,msg.id,"انتي مش متجوزه يا عبيطه","md")
end
end
if text == "انتي طالق" and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز تطلق نفسك ؟؟","md")
elseif tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعد عني يبن الحيحانه","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")) ~= tonumber(senderr) or tonumber(Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")) ~= tonumber(rep_idd) then
return send(msg.chat_id,msg.id,"مش مراتك عشان تطلقها يهبل","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")) == tonumber(rep_idd) then
Redis:del(Fast..msg.chat_id..rep_idd.."mtzwga:")
Redis:del(Fast..msg.chat_id..senderr.."mtzwga:")
return send(msg.chat_id,msg.id,"تم طلاقكم وشوفو العيال هتبقا مع مين","md")
end
end
if text == "انت طالق" and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(rep_idd) == tonumber(senderr) then
return send(msg.chat_id,msg.id,"انتي هبله يبنتي عاوزه تطلقي نفسك ؟؟","md")
elseif tonumber(rep_idd) == tonumber(Fast) then
return send(msg.chat_id,msg.id,"ابعدي عني يبنت الحيحانه","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")) ~= tonumber(senderr) or tonumber(Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")) ~= tonumber(rep_idd) then
return send(msg.chat_id,msg.id,"مش جوزك يهبله عشان تطلقي منو","md")
elseif tonumber(Redis:get(Fast..msg.chat_id..rep_idd.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")) == tonumber(rep_idd) then
Redis:del(Fast..msg.chat_id..rep_idd.."mtzwga:")
Redis:del(Fast..msg.chat_id..senderr.."mtzwga:")
return send(msg.chat_id,msg.id,"تم طلاقكم وشوفو العيال هتبقا مع مين","md")
end
end
if text == "بوت طلقني" then
if not Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then 
return send(msg.chat_id,msg.id,"انت ولا متجوز ولا متنيل عشان اطلقك","md")
elseif Redis:get(Fast..msg.chat_id..senderr.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg.chat_id..senderr.."mtzwga:")
local zwg_name = bot.getUser(zwg_id).first_name
Redis:del(Fast..msg.chat_id..senderr.."mtzwga:")
Redis:del(Fast..msg.chat_id..zwg_id.."mtzwga:")
return send(msg.chat_id,msg.id,"تم طلاقك من ["..FlterBio(zwg_name).."](tg://user?id="..zwg_id..")\nشوفو مين هياخد العيال بقا","md")
end
end


end
return {Fast = zwag}