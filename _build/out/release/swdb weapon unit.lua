-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1683 (2079 with comment) chars
C="f"
B="I4"
A=" = "

v=pairs
n=screen
m=string
u=m.sub
r=n.drawText
i=n.setColor
j=output.setNumber
s=m.unpack
x=m.pack
w=property.getNumber
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}t=1
c={}c.type=1
c.f=-1
c.k=-1
c.l.y=w("Main Type")c.l.z=w("Sub Type")function onTick()b.p=input.getNumber(t)b.o=x(C,b.p)b.e=s(B,b.o)b[_[1]]=(b.e>>31 & 1)b[_[2]]=(b.e>>30 & 1)b[_[3]]=(b.e>>23 &(2^7-1))b[_[4]]=(b.e>>16 &(2^7-1))b[_[5]]=(b.e>>9 &(2^7-1))b[_[6]]=(b.e &(2^9-1))g()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if(b[_[6]]>>7)==c.type and c.f==-1 and(b[_[6]]& 2^7-1)>0
then
c.f=b[_[6]]&(2^7-1)q()else
g()end
end
elseif b[_[3]]==1 then
c.f=-1
g()elseif b[_[3]]==2 then
if b[_[1]]==0 then
g()elseif b[_[1]]==1 then
if b[_[5]]==c.f then
if b[_[4]]==127 then
c.k=-1
else
c.k=b[_[4]]end
q()else
g()end
end
else
g()end
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
elseif c.k==-1 then
a[_[1]]=0
a[_[2]]=0
a[_[3]]=2
a[_[4]]=c.f
a[_[5]]=127
a[_[6]]=(c.l.y &(2^3-1)<<4)|(c.l.z &(2^4-1))elseif false then
end
end
a.e=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])j(1,a.e)a.o=x(B,a.e)a.p=s(C,a.o)j(t,a.p)j(2,c.type)j(3,c.f)end
function onDraw()i(20,20,20)n.drawClear()i(0,255,0)local d=0
for _,h in v(_)do
d=d+1
r(2,6*d-4,u(h,1,3)..A..b[h])end
i(255,0,0)for _,h in v(_)do
d=d+1
r(2,6*d-2,u(h,1,3)..A..a[h])end
i(0,0,0)d=d+1
r(2,6*d,"Weapon")end
function q()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function g()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
