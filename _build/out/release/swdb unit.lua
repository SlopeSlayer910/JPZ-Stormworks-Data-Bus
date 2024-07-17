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

p=pairs
n=screen
l=string
u=l.sub
o=n.drawText
j=n.setColor
i=output.setNumber
r=l.unpack
t=l.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}s=1
c={}c.type=1
c.h=-1
function onTick()b.k=input.getNumber(s)b.m=t(v,b.k)b.d=r(x,b.m)b[_[1]]=(b.d>>31 & 1)b[_[2]]=(b.d>>30 & 1)b[_[3]]=(b.d>>23 &(2^7-1))b[_[4]]=(b.d>>16 &(2^7-1))b[_[5]]=(b.d>>9 &(2^7-1))b[_[6]]=(b.d &(2^9-1))g()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.h==-1 then
c.h=b[_[6]]&(2^7-1)q()else
g()end
end
elseif b[_[3]]==1 then
c.h=-1
g()else
g()end
else
q()end
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
a.d=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])i(1,a.d)a.m=t(x,a.d)a.k=r(v,a.m)i(s,a.k)i(2,c.type)i(3,c.h)end
function onDraw()j(20,20,20)n.drawClear()j(0,255,0)local e=0
for _,f in p(_)do
e=e+1
o(2,6*e-4,u(f,1,3)..w..b[f])end
j(255,0,0)for _,f in p(_)do
e=e+1
o(2,6*e-2,u(f,1,3)..w..a[f])end
j(0,0,0)e=e+1
o(2,6*e,"Unit")end
function q()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function g()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
