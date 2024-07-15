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

s=pairs
k=screen
n=string
p=n.sub
o=k.drawText
j=k.setColor
i=output.setNumber
t=n.unpack
r=n.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}u=1
c={}c.type=1
c.f=-1
function onTick()b.m=input.getNumber(u)b.l=r(v,b.m)b.d=t(x,b.l)b[_[1]]=(b.d>>31 & 1)b[_[2]]=(b.d>>30 & 1)b[_[3]]=(b.d>>23 &(2^7-1))b[_[4]]=(b.d>>16 &(2^7-1))b[_[5]]=(b.d>>9 &(2^7-1))b[_[6]]=(b.d &(2^9-1))h()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
h()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.f==-1 then
c.f=b[_[6]]&(2^7-1)q()else
h()end
end
elseif b[_[3]]==1 then
c.f=-1
h()else
h()end
else
q()end
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
a.d=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])i(1,a.d)a.l=r(x,a.d)a.m=t(v,a.l)i(u,a.m)i(2,c.type)i(3,c.f)end
function onDraw()j(20,20,20)k.drawClear()j(0,255,0)local e=0
for _,g in s(_)do
e=e+1
o(2,6*e-4,p(g,1,3)..w..b[g])end
j(255,0,0)for _,g in s(_)do
e=e+1
o(2,6*e-2,p(g,1,3)..w..a[g])end
j(0,0,0)e=e+1
o(2,6*e,"Unit")end
function q()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function h()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
