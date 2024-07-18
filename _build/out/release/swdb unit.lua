-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1300 (1696 with comment) chars
x="I4"
w=" = "
v="f"

r=pairs
m=screen
n=string
p=n.sub
o=m.drawText
i=m.setColor
j=output.setNumber
q=n.unpack
t=n.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}u=1
c={}c.type=1
c.h=-1
function onTick()b.k=input.getNumber(u)b.l=t(v,b.k)b.e=q(x,b.l)b[_[1]]=(b.e>>31 & 1)b[_[2]]=(b.e>>30 & 1)b[_[3]]=(b.e>>23 &(2^7-1))b[_[4]]=(b.e>>16 &(2^7-1))b[_[5]]=(b.e>>9 &(2^7-1))b[_[6]]=(b.e &(2^9-1))f()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
f()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.h==-1 then
c.h=b[_[6]]&(2^7-1)s()else
f()end
end
elseif b[_[3]]==1 then
c.h=-1
f()else
f()end
else
s()end
if a[_[2]]==1 then
if c.h==-1 then
a[_[1]]=0
a[_[2]]=0
a[_[3]]=0
a[_[4]]=127
a[_[5]]=0
a[_[6]]=c.type
end
end
a.e=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])j(1,a.e)a.l=t(x,a.e)a.k=q(v,a.l)j(u,a.k)j(2,c.type)j(3,c.h)end
function onDraw()i(20,20,20)m.drawClear()i(0,255,0)local d=0
for _,g in r(_)do
d=d+1
o(2,6*d-4,p(g,1,3)..w..b[g])end
i(255,0,0)for _,g in r(_)do
d=d+1
o(2,6*d-2,p(g,1,3)..w..a[g])end
i(0,0,0)d=d+1
o(2,6*d,"Unit")end
function s()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function f()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
