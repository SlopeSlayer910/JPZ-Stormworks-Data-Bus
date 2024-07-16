-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1300 (1696 with comment) chars
x=" = "
w="I4"
v="f"

t=pairs
n=screen
o=string
u=o.sub
k=n.drawText
i=n.setColor
j=output.setNumber
r=o.unpack
q=o.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}p=1
c={}c.type=1
c.f=-1
function onTick()b.l=input.getNumber(p)b.m=q(v,b.l)b.d=r(w,b.m)b[_[1]]=(b.d>>31 & 1)b[_[2]]=(b.d>>30 & 1)b[_[3]]=(b.d>>23 &(2^7-1))b[_[4]]=(b.d>>16 &(2^7-1))b[_[5]]=(b.d>>9 &(2^7-1))b[_[6]]=(b.d &(2^9-1))g()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.f==-1 then
c.f=b[_[6]]&(2^7-1)s()else
g()end
end
elseif b[_[3]]==1 then
c.f=-1
g()else
g()end
else
s()end
if a[_[2]]==1 then
if c.f==-1 then
a[_[1]]=0
a[_[2]]=0
a[_[3]]=0
a[_[4]]=127
a[_[5]]=0
a[_[6]]=c.type
end
end
a.d=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])j(1,a.d)a.m=q(w,a.d)a.l=r(v,a.m)j(p,a.l)j(2,c.type)j(3,c.f)end
function onDraw()i(20,20,20)n.drawClear()i(0,255,0)local e=0
for _,h in t(_)do
e=e+1
k(2,6*e-4,u(h,1,3)..x..b[h])end
i(255,0,0)for _,h in t(_)do
e=e+1
k(2,6*e-2,u(h,1,3)..x..a[h])end
i(0,0,0)e=e+1
k(2,6*e,"Unit")end
function s()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function g()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
