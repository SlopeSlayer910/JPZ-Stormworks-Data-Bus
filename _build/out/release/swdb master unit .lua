-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1606 (2002 with comment) chars
D="I4"
C=" = "
B="f"

m=pairs
i=false
u=true
r=screen
p=string
y=p.sub
n=r.drawText
l=r.setColor
k=output.setNumber
w=p.unpack
z=p.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}v=1
d={}d.type=0
d.t=0
d.j=0
h={}h[0]={type=0,g=u}for c=1,125,1 do
h[c]={type=1,g=i}end
h[63]={type=2,g=i}h[126]={type=2,g=i}h[127]={type=3,g=u}function onTick()b.q=input.getNumber(v)b.s=z(B,b.q)b.e=w(D,b.s)b[_[1]]=(b.e>>31 & 1)b[_[2]]=(b.e>>30 & 1)b[_[3]]=(b.e>>23 &(2^7-1))b[_[4]]=(b.e>>16 &(2^7-1))b[_[5]]=(b.e>>9 &(2^7-1))b[_[6]]=(b.e &(2^9-1))x()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=0
a[_[4]]=0
a[_[5]]=127
a[_[6]]=b[_[6]]<<7
for A,f in m(h)do
if f.g==i and f.type==b[_[6]]then
a[_[6]]=a[_[6]]|A
f.g=u
break
end
end
elseif b[_[1]]==1 then
local t=b[_[6]]&(2^7-1)h[t].g=i
o()end
elseif b[_[3]]==1 then
for c=1,126 do
h[c].g=i
end
o()else
x()end
else
o()end
if a[_[2]]==1 then
if i and d.j>60 then
d.j=0
a[_[1]]=0
a[_[2]]=0
a[_[3]]=1
a[_[4]]=0
a[_[5]]=127
a[_[6]]=0
end
end
a.e=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])k(1,a.e)a.s=z(D,a.e)a.q=w(B,a.s)k(v,a.q)d.j=d.j+1
k(2,d.type)k(3,d.t)k(4,d.j)end
function onDraw()l(20,20,20)r.drawClear()l(0,255,0)local c=0
for _,f in m(_)do
c=c+1
n(2,6*c-4,y(f,1,3)..C..b[f])end
l(255,0,0)for _,f in m(_)do
c=c+1
n(2,6*c-2,y(f,1,3)..C..a[f])end
l(0,0,0)c=c+1
n(2,6*c,"Master Unit")end
function o()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function x()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
