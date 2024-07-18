-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1722 (2118 with comment) chars
D="f"
C=" = "
B="I4"

y=pairs
o=screen
p=string
v=p.sub
q=o.drawText
i=o.setColor
k=output.setNumber
w=p.unpack
t=p.pack
u=property.getNumber
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}x=1
c={}c.type=1
c.f=-1
c.m=-1
c.j={}c.j.A=u("Main Type")c.j.z=u("Sub Type")c.l=0
function onTick()b.s=input.getNumber(x)b.n=t(D,b.s)b.d=w(B,b.n)b[_[1]]=(b.d>>31 & 1)b[_[2]]=(b.d>>30 & 1)b[_[3]]=(b.d>>23 &(2^7-1))b[_[4]]=(b.d>>16 &(2^7-1))b[_[5]]=(b.d>>9 &(2^7-1))b[_[6]]=(b.d &(2^9-1))g()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.f==-1 and(b[_[6]]& 2^7-1)>0
then
c.f=b[_[6]]&(2^7-1)r()else
g()end
end
elseif b[_[3]]==1 then
c.f=-1
g()elseif b[_[3]]==2 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if b[_[5]]==c.f then
if b[_[4]]==127 then
c.m=-1
else
c.m=b[_[4]]end
r()else
g()end
end
else
g()end
else
r()end
if a[_[2]]==1 then
if c.f==-1 then
a[_[1]]=0
a[_[2]]=0
a[_[3]]=0
a[_[4]]=127
a[_[5]]=0
a[_[6]]=c.type
elseif c.m==-1 and c.l>60 then
c.l=0
a[_[1]]=0
a[_[2]]=0
a[_[3]]=2
a[_[4]]=c.f
a[_[5]]=127
a[_[6]]=(c.j.A &(2^3-1)<<4)|(c.j.z &(2^4-1))elseif false then
end
end
a.d=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])k(1,a.d)a.n=t(B,a.d)a.s=w(D,a.n)k(x,a.s)c.l=c.l+1
k(2,c.type)k(3,c.f)end
function onDraw()i(20,20,20)o.drawClear()i(0,255,0)local e=0
for _,h in y(_)do
e=e+1
q(2,6*e-4,v(h,1,3)..C..b[h])end
i(255,0,0)for _,h in y(_)do
e=e+1
q(2,6*e-2,v(h,1,3)..C..a[h])end
i(0,0,0)e=e+1
q(2,6*e,"Weapon")end
function r()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function g()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
