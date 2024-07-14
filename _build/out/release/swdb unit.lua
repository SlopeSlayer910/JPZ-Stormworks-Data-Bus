-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1271 (1667 with comment) chars
x="I4"
w=" = "
v="f"

u=pairs
n=screen
m=string
o=m.sub
p=n.drawText
k=n.setColor
i=output.setNumber
t=m.unpack
q=m.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}s=1
c={}c.type=1
c.g=-1
function onTick()b.l=input.getNumber(s)b.j=q(v,b.l)b.d=t(x,b.j)b[_[1]]=(b.d>>31 & 1)b[_[2]]=(b.d>>30 & 1)b[_[3]]=(b.d>>23 &(2^7-1))b[_[4]]=(b.d>>16 &(2^7-1))b[_[5]]=(b.d>>9 &(2^7-1))b[_[6]]=(b.d &(2^9-1))h()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
h()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.g==-1 then
c.g=b[_[6]]&(2^7-1)r()else
h()end
end
elseif b[_[3]]==0 then
c.g=-1
h()else
h()end
else
r()end
if a[_[2]]==1 then
if c.g==-1 then
a[_[1]]=0
a[_[2]]=0
a[_[3]]=0
a[_[4]]=127
a[_[5]]=0
a[_[6]]=c.type
end
end
a.d=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])i(1,a.d)a.j=q(x,a.d)a.l=t(v,a.j)i(s,a.l)i(2,c.type)i(3,c.g)end
function onDraw()k(20,20,20)n.drawClear()k(0,255,0)local e=0
for _,f in u(_)do
e=e+1
p(2,6*e-4,o(f,1,3)..w..b[f])end
k(255,0,0)for _,f in u(_)do
e=e+1
p(2,6*e-2,o(f,1,3)..w..a[f])end
end
function r()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function h()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
