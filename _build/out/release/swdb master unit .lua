-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1564 (1960 with comment) chars
D="I4"
C=" = "
B="f"

l=pairs
i=false
p=true
r=screen
q=string
y=q.sub
u=r.drawText
n=r.setColor
k=output.setNumber
w=q.unpack
z=q.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}x=1
c={}c.type=0
c.t=0
c.j=0
g={}g[0]={type=0,h=p}for d=1,125,1 do
g[d]={type=1,h=i}end
g[63]={type=2,h=i}g[126]={type=2,h=i}g[127]={type=3,h=p}function onTick()b.s=input.getNumber(x)b.m=z(B,b.s)b.f=w(D,b.m)b[_[1]]=(b.f>>31 & 1)b[_[2]]=(b.f>>30 & 1)b[_[3]]=(b.f>>23 &(2^7-1))b[_[4]]=(b.f>>16 &(2^7-1))b[_[5]]=(b.f>>9 &(2^7-1))b[_[6]]=(b.f &(2^9-1))v()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=0
a[_[4]]=0
a[_[5]]=127
a[_[6]]=b[_[6]]<<7
for A,e in l(g)do
if e.h==i and e.type==b[_[6]]then
a[_[6]]=a[_[6]]|A
e.h=p
break
end
end
elseif b[_[1]]==1 then
local t=b[_[6]]&(2^7-1)g[t].h=i
o()end
elseif b[_[3]]==1 then
for d=1,126 do
g[d].h=i
end
o()else
v()end
else
o()end
if a[_[2]]==1 then
if c.j>60 then
c.j=0
a[_[1]]=0
a[_[2]]=0
a[_[3]]=1
a[_[4]]=0
a[_[5]]=127
a[_[6]]=0
end
end
a.f=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])k(1,a.f)a.m=z(D,a.f)a.s=w(B,a.m)k(x,a.s)c.j=c.j+1
k(2,c.type)k(3,c.t)k(4,c.j)end
function onDraw()n(20,20,20)r.drawClear()n(0,255,0)local d=0
for _,e in l(_)do
d=d+1
u(2,6*d-4,y(e,1,3)..C..b[e])end
n(255,0,0)for _,e in l(_)do
d=d+1
u(2,6*d-2,y(e,1,3)..C..a[e])end
end
function o()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function v()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
